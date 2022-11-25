#include "../../../build/gmm/impala/enzyme/gmm_enzyme_impala.h"
#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <vector>
#include "../../../cpp/read.h"
#include "../../../cpp/defs.h"
#include <string>
#include <iostream>
#include<sys/time.h>


long long timeInMilliseconds(void) {
    struct timeval tv;

    gettimeofday(&tv,NULL);
    return (((long long)tv.tv_sec)*1000)+(tv.tv_usec/1000);
}

static long long startTime = 0;

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

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    int d = 1;
    int k = 1;
    int n = 1;
    vector<double> alphas;
    vector<double> means;
    vector<double> icf;
    vector<double> x;
    Wishart wishart;

    std::string benchmark = argv[1];//"benchmark/gmm_d2_K5.txt";
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

    begin();
    gmm_d(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart, &error, &J[0]);

    eval();

    //printf("%.20lf\n", error);

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