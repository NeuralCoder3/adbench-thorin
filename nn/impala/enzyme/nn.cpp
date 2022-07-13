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
    void loss_c_stub(
                     int hidden_size,
                     double const* input_c,
                     double const* first_weights_c,
                     double const* second_weights_c,
                     unsigned long long y, double * loss){

        loss_c(
                hidden_size,
                input_c,
                first_weights_c,
                second_weights_c,
                y, loss);
    }

double loss_d_c(
            int hidden_size,
            double const* input_c, double const* input_d_c,
            double const* first_weights_c, double const* first_weights_d_c,
            double const* second_weights_c, double const* second_weights_d_c,
            unsigned long long y){

        double loss = 1.0;
        double loss_d = 1.0;

        __enzyme_autodiff((void*) loss_c_stub,
                          enzyme_const, hidden_size,
                          enzyme_dup,   input_c, input_d_c,
                          enzyme_dup,   first_weights_c, first_weights_d_c,
                          enzyme_dup,   second_weights_c, second_weights_d_c,
                          enzyme_const, y,
                          enzyme_dup, &loss, &loss_d);

        return loss;
    }
}