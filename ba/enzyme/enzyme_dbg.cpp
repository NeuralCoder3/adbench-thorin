#include <math.h>
#include <stdio.h>
#include <vector>
#include "../shared/ba.h"
#include "../../cpp/lib.h"
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

    double *err_d = new double [p];
    double *reproj_err_d = new double [2 * p];

    for( size_t i = 0 ; i < p ; i++ ){
        err_d[i] = 1.0;

    }

    for( size_t i = 0 ; i < 2 * p ; i++ ){
        reproj_err_d[i] = 1.0;
    }

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
    double *cams = new double[11 * n];
    double *X = new double[3 * m];
    double *w = new double[p];
    int *obs = new int[2 * p];
    double *feats = new double[2 * p];

    std::string benchmark = argv[1];

    read_ba_instance(benchmark.c_str(), n, m, p, cams, X, w, obs, feats);

    double *w_err = new double [p];
    double *reproj_err = new double [ 2 * p ];

    int derivative_size = 11 * n + 3*m + p;
    double *J = new double [ derivative_size ];

    auto min_samples = 10;
    long min_time = 500;

    auto count = 0;
    long min_runtime = -1;
    long time_sum = 0;

    while(time_sum < 10000  && (count < min_samples || time_sum < min_time)){
        for( size_t i = 0 ; i < derivative_size ; i++ ){
            J[i] = 0.0;
        }

        begin();
        ba_d(n, m, p, cams, X, w, obs, feats, reproj_err, w_err, &J[0]);
        auto time = eval();

        if(min_runtime == -1 || time < min_runtime){
            min_runtime = time;
        }

        time_sum += time;
        count++;
    }

    printLong(min_runtime);
    return 0;
}