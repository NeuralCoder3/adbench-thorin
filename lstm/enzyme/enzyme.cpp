#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <iostream>
#include <vector>
#include "../shared/lstm.cpp"
#include "../../cpp/defs.h"
#include "../../cpp/read.h"

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

void lstm_d(int l, int c, int b,
          double *main_params,
          double *extra_params,
          double *state,
          double *sequence,
          double *loss,
          double *J){

    double *main_d = &J[0];
    double *extra_d = &J[2 * l * 4 * b];

    double loss_d = 1.0;

    __enzyme_autodiff((void*) lstm_objective,
                        enzyme_const, l,
                        enzyme_const, c,
                        enzyme_const, b,
                        enzyme_dup,   main_params, main_d,
                        enzyme_dup,   extra_params, extra_d,
                        enzyme_const,   state,
                        enzyme_const, sequence,
                        enzyme_dup, loss, &loss_d);
}

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    std::string benchmark = argv[1];

    int l;
    int c;
    int b;

    double *main_params;
    double *extra_params;
    double *state;
    double *sequence;

    read_lstm_instance(benchmark.c_str(), &l, &c, &b, &main_params, &extra_params, &state, &sequence);

    double *J = new double [2 * l * 4 * b + 3 * b];
    double loss;

    //lstm_objective(l, c, b, main_params, extra_params, state, sequence, &loss);

    lstm_d(l, c, b, main_params, extra_params, state, sequence, &loss, J);
    //lstm_objective(l, c, b, main_params, extra_params, state, sequence, &loss);

    std::cout << loss << std::endl;

    /*
     *
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
     *
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