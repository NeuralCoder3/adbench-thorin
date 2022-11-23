#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <iostream>
#include <vector>
#include "../shared/gmm.h"
#include "../../cpp/defs.h"
#include "../../cpp/read.h"
#include<sys/time.h>


long long timeInMilliseconds(void) {
    struct timeval tv;

    gettimeofday(&tv,NULL);
    return (((long long)tv.tv_sec)*1000)+(tv.tv_usec/1000);
}

long long startTime = 0;

void begin(){
    startTime = timeInMilliseconds();
}

void eval(){
    long long endTime = timeInMilliseconds();
    printf("%d\n", endTime - startTime);
}

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

void gmm_d(int d, int k, int n,
           const double *alphas,
           const double *means,
           const double *icf,
           const double *x,
           const double wishart_gamma,
           const int wishart_m,
           double *err,
           double *J){

    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];

    double err_d = 1.0;

    __enzyme_autodiff((void*)gmm_objective,
                        enzyme_const, d,
                        enzyme_const, k,
                        enzyme_const, n,
                        enzyme_dup,   alphas, alphas_d,
                        enzyme_dup,   means, means_d,
                        enzyme_dup,   icf, icf_d,
                        enzyme_const, x,
                        enzyme_const, wishart_gamma,
                        enzyme_const, wishart_m,
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

    begin();
    gmm_d(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart.gamma, wishart.m, &error, &J[0]);
    eval();


    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];
    double *x_d = &J[k + d * k];

    /*
    printf("%f, \n", error);
    printf("alpha derivative\n");

    for (int i = 0; i < k; i++)
    {
        printf("%.20lf\n", alphas_d[i]);
    }

    printf("\n");
    printf("means derivative\n");
    for (int i = 0; i < k*d; i++)
    {
        printf("%.20lf\n", means_d[i]);
    }

    printf("\n");
    printf("icf derivative\n");
    for (int i = 0; i < k*icf_sz; i++)
    {
        printf("%.20lf\n", icf_d[i]);
    }*/

    return 0;
}