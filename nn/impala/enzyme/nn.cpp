#include "../../../build/nn/impala/enzyme/nn_enzyme_impala.h"
#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <vector>
#include "../../../cpp/read.h"
#include "../../../cpp/defs.h"
#include <string>
#include <iostream>

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

using namespace std;


extern "C"{
    void loss_c_stub(int input_size, int hidden_size, int output_size, double const* __restrict input, double const* __restrict first_weights, double* __restrict hidden_output, double const* __restrict second_weights, double* __restrict output){
        nn_f(
                input_size, hidden_size, output_size,
                input,
                first_weights,
                hidden_output,
                second_weights,
                output);
    }

void nn_f_d(
            int input_size, int hidden_size, int output_size,
            double const* input_c, double const* input_d_c,
            double const* first_weights_c, double const* first_weights_d_c,
            double const* hidden_c, double const* hidden_c_d,
            double const* second_weights_c, double const* second_weights_d_c,
            double const* output_c, double const* output_c_d){

        __enzyme_autodiff((void*) loss_c_stub,
                          enzyme_const, input_size,
                          enzyme_const, hidden_size,
                          enzyme_const, output_size,
                          enzyme_dup,   input_c, input_d_c,
                          enzyme_dup,   first_weights_c, first_weights_d_c,
                          enzyme_dup,   hidden_c, hidden_c_d,
                          enzyme_dup,   second_weights_c, second_weights_d_c,
                          enzyme_dup,   output_c, output_c_d);
    }
}