#include "../../../build/gmm/impala/enzyme/gmm_enzyme_impala.h"
#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <vector>
#include "../../../cpp/read.h"
#include "../../../cpp/defs.h"
#include "../../../cpp/lib.h"
#include <iostream>

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

using namespace std;

void gmm_d(int d, int k, int n,
           const double *alphas,
           const double *means,
           const double *icf,
           const double *x,
           const Wishart wishart,
           double *err,
           double *J){

    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];

    double d_err = 1.0;

    __enzyme_autodiff((void*) gmm,
                      enzyme_const, d,
                      enzyme_const, k,
                      enzyme_const, n,
                      enzyme_const, wishart.m,
                      enzyme_const, wishart.gamma,
                      enzyme_dup,   alphas, alphas_d,
                      enzyme_dup,   means, means_d,
                      enzyme_dup,   icf, icf_d,
                      enzyme_const, x,
                      enzyme_dup, err, &d_err);
}

void initBenchmark(const std::string& file){
    int d = 1;
    int k = 1;
    int n = 1;
    vector<double> alphas;
    vector<double> means;
    vector<double> icf;
    vector<double> x;
    Wishart wishart;

    read_gmm_instance(file, &d, &k, &n, alphas, means, icf, x, wishart, false);

    double error = 0;
    vector<double> J;

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
}

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }


    std::string file = argv[1];
    initBenchmark(file);

    return 0;
}