#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <iostream>
#include <vector>
#include "../shared/lstm.h"
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

    std::vector<double> main_params;
    std::vector<double> extra_params;
    std::vector<double> state;
    std::vector<double> sequence;

    read_lstm_instance(benchmark.c_str(), &l, &c, &b, main_params, extra_params, state, sequence);

    double *J = new double [2 * l * 4 * b + 3 * b];
    double loss;


    //lstm_objective(l, c, b, main_params, extra_params, state, sequence, &loss);

    begin();
    lstm_d(l, c, b, &main_params[0], &extra_params[0], &state[0], &sequence[0], &loss, J);
    eval();
    //lstm_objective(l, c, b, main_params, extra_params, state, sequence, &loss);

    double *main_d = &J[0];
    double *extra_d = &J[2 * l * 4 * b];

    printf("\n");

    for( size_t i = 0 ; i < 3 * b ; i++ ){
        printf("%f\n", extra_d[i]);
    }

    std::cout << loss << std::endl;

    return 0;
}