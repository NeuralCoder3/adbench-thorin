#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <iostream>
#include <vector>
#include "../shared/ba.h"
#include "../../cpp/defs.h"
#include "../../cpp/read.h"

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

void gmm_d(int n, int m, int p,
           const double* const cams,
           const double* const X,
           const double* const w,
           const int* const obs,
           const double* const feats,
           double* reproj_err,
           double* w_err){

    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];

    double err_d = 1.0;

    __enzyme_autodiff((void*) ba_objective,
                        enzyme_const, n,
                        enzyme_const, m,
                        enzyme_const, p,
                        enzyme_dup,   cams, alphas_d,
                        enzyme_dup,   X, means_d,
                        enzyme_dup,   w, icf_d,
                        enzyme_const, obs,
                        enzyme_const, feats,
                        enzyme_dup, reproj_err,
                        enzyme_dup, w_err, &err_d);
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
    gmm_d(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart.gamma, wishart.m, &error, &J[0]);

    printf("%.20lf\n", error);

    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];

    printf("\n");
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
    }

    return 0;
}