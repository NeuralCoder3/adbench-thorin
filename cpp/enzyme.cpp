#include "gmm.h"
#include "gmm_d.h"
#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include "read.h"
#include "defs.h"
#include <string>
#include <iostream>

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
           const Wishart wishart,
           double *err,
           double *J){

    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];

    double d_err = 1.0;

    __enzyme_autodiff((void*)gmm_objective<double>,
                      enzyme_const, d,
                      enzyme_const, k,
                      enzyme_const, n,
                      enzyme_dup,   alphas, alphas_d,
                      enzyme_dup,   means, means_d,
                      enzyme_dup,   icf, icf_d,
                      enzyme_const, x,
                      enzyme_const, wishart,
                      enzyme_dup, err, &d_err);
}

int main(){
    int d = 1;
    int k = 1;
    int n = 1;
    vector<double> alphas;
    vector<double> means;
    vector<double> icf;
    vector<double> x;
    Wishart wishart;

    std::string benchmark = "benchmark/gmm_d2_K5.txt";
    read_gmm_instance(benchmark, &d, &k, &n, alphas, means, icf, x, wishart, false);

    //cpp : -5240.590563
    //impala : -5240.589720
    //diff: 0.000843

    double error = 0;
    //gmm_objective<double>(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart, &error);

    //printf("error\n");
    //

    vector<double> J;


    int icf_sz = d * (d + 1) / 2;
    J.resize(k + d * k + icf_sz * k);
    gmm_d(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart, &error, &J[0]);

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