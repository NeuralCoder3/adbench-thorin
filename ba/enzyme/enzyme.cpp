#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <iostream>
#include <vector>
#include "../shared/ba.h"
#include "../shared/ba_d.h"
#include "../../cpp/defs.h"
#include "../../cpp/read.h"
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

void ba_d(int n, int m, int p,
           const double* const cams,
           const double* const X,
           const double* const w,
           const int* const obs,
           const double* const feats,
           double* reproj_err,
           double* w_err,
           double* J){

    double *cams_d = &J[0];
    double *X_d = &J[11 * n];
    double *w_d = &X_d[3 * m];

    double *err_d = new double [p];
    double *reproj_err_d = new double [2 * p];

    for( size_t i = 0 ; i < p ; i++ ){
        err_d[i] = 1.0;

    }

    for( size_t i = 0 ; i < 2 * p ; i++ ){
        reproj_err_d[i] = 1.0;
    }

    // printf("before enzyme\n");
    __enzyme_autodiff((void*) ba_objective,
                        enzyme_const, n,
                        enzyme_const, m,
                        enzyme_const, p,
                        enzyme_dup,   cams, cams_d,
                        enzyme_dup,   X, X_d,
                        enzyme_dup,   w, w_d,
                        enzyme_const, obs,
                        enzyme_const, feats,
                        enzyme_dup, reproj_err, reproj_err_d,
                        enzyme_dup, w_err, err_d);
}

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    int n = 49;
    int m = 7776;
    int p = 31843;

    // printf("now reading sizes\n");
    std::string benchmark = argv[1];
    read_ba_size(benchmark.c_str(), n, m, p);
    // printf("n: %d, m: %d, p: %d\n", n, m, p);

    double *cams = new double[11 * n];
    double *X = new double[3 * m];
    double *w = new double[p];
    int *obs = new int[2 * p];
    double *feats = new double[2 * p];


    // printf("now reading\n");
    read_ba_instance(benchmark.c_str(), n, m, p, cams, X, w, obs, feats);

    double *w_err = new double [p];
    double *reproj_err = new double [ 2 * p ];

    int derivative_size = 11 * n + 3*m + p;
    double *J = new double [ derivative_size ];

    for( size_t i = 0 ; i < derivative_size ; i++ ){
        J[i] = 0.0;
    }

    begin();
    // printf("before ba_d\n");
    ba_d(n, m, p, cams, X, w, obs, feats, reproj_err, w_err, &J[0]);

    eval();
    double *cams_d = &J[0];
    double *X_d = &J[11 * n];
    double *w_d = &X_d[3 * m];
/*
    for( int i = 0 ; i < 20 ; i++ ){
        std::cout << cams_d[i] << std::endl;
    }*/

    /*
    std::cout << reproj_err[0] << std::endl;
    std::cout << reproj_err[1] << std::endl;

    std::cout << "---" << std::endl;
    for( int i = 0 ; i < derivative_size ; i++ ){
      if(J[i] * J[i] > 0.01){
        std::cout << i << " : " << J[i] << std::endl;
      }
    }

    compute_reproj_error_d(cams,X,w[0],feats[0],feats[1],reproj_err, J);
    std::cout << "####" << std::endl;
    std::cout << reproj_err[0] << std::endl;
    std::cout << reproj_err[1] << std::endl;

    std::cout << "---" << std::endl;
    for( int i = 0 ; i < derivative_size ; i++ ){
      if(J[i] * J[i] > 0.01){
        std::cout << i << " : " << J[i] << std::endl;
      }
    }*/

    /*
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
*/
    return 0;
}