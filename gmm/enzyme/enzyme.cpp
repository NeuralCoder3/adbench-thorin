#include <stdio.h>
#include <iostream>
#include <vector>
#include "../shared/gmm.h"
#include "../../cpp/lib.h"
#include "../../cpp/read.h"

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

void gmm_d(int d, int k, int n,
           const double * __restrict__ alphas,
           const double * __restrict__ means,
           const double * __restrict__ icf,
           const double * __restrict__ x,
           const Wishart wishart,
           double * __restrict__ err,
           double * __restrict__ J){

    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];

    double err_d = 1.0;
    double test_d = 1.0;
    int test2_d = 1.0;

    int lol1;
    int lol2;
    int lol3;

    __enzyme_autodiff((void*)gmm_objective,
                        enzyme_dup, d, lol1,
                        enzyme_dup, k, lol2,
                        enzyme_dup, n, lol3,
                        enzyme_dup,   alphas, alphas_d,
                        enzyme_dup,   means, means_d,
                        enzyme_dup,   icf, icf_d,
                        enzyme_const, x,
                        enzyme_dup, wishart.gamma, test_d,
                        enzyme_dup, wishart.m, test2_d,
                        enzyme_dup, err, &err_d);
}

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    int d = 1;
    int k = 1;
    int n = 1;
    std::vector<double> alphas;
    std::vector<double> means;
    std::vector<double> icf;
    std::vector<double> x;
    Wishart wishart;

    std::string benchmark = argv[1];
    read_gmm_instance(benchmark, &d, &k, &n, alphas, means, icf, x, wishart, false);

    double error = 0;

    std::vector<double> J;

    int icf_sz = d * (d + 1) / 2;
    J.resize(k + d * k + icf_sz * k);

    auto min_samples = 10;
    long min_time = 500;

    auto count = 0;
    long min_runtime = -1;
    long time_sum = 0;

    while(time_sum < 10000  && (count < min_samples || time_sum < min_time)){
        J.clear();
        J.resize(k + d * k + icf_sz * k);
        begin();
        gmm_d(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart, &error, &J[0]);
        auto time = eval();

        if(min_runtime == -1 || time < min_runtime){
            min_runtime = time;
        }

        time_sum += time;
        count++;
    }

    printLong(min_runtime);
    for (int i = 0; i < J.size(); i++)
    {
        std::cout << std::setprecision(20) << J[i] << std::endl;
    }


    return 0;
}