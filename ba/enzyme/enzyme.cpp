#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <iostream>
#include <vector>
#include "../shared/ba.cpp"
#include "../shared/ba_d.cpp"
#include "../../cpp/defs.h"
#include "../../cpp/read.h"

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

    double *err_d = new double [p]{1.0};
    double *reproj_err_d = new double [2 * p]{1.0};

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
    double *cams = new double[11 * n]{0.0};
    double *X = new double[3 * m]{0.0};
    double *w = new double[p]{0.0};
    int *obs = new int[2 * p]{0};
    double *feats = new double[2 * p]{0.0};

    std::string benchmark = argv[1];

    read_ba_instance(benchmark.c_str(), n, m, p, cams, X, w, obs, feats);

    double *w_err = new double [p];
    double *reproj_err = new double [ 2 * p ];

    int derivative_size = 11 * n + 3*m + p;
    double *J = new double [ derivative_size ];

    ba_d(n, m, p, cams, X, w, obs, feats, reproj_err, w_err, &J[0]);

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
    }

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