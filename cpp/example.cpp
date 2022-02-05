#include "gmm.h"
#include "gmm_d.h"
#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include "read.h"
#include "defs.h"
#include <string>
#include <iostream>


#include <stdio.h>

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

double __enzyme_autodiff(void*, ...);


double sumAndMul(double* array, size_t size, double *mul) {
    double sum = 0;
    for(size_t i=0; i < size; i++) {
        sum += array[i];
    }
    return sum * *mul;
}

int main() {
    double   array[10] = { 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 };
    double d_array[10] = { 0.0 };

    size_t size = 10;

    double mul = 2.0;

    double d_mul;

    double value = __enzyme_autodiff((void*)sumAndMul,
             enzyme_dup  , array, d_array,
             enzyme_const, size,
                      enzyme_dupnoneed  , &mul, &d_mul);

    printf("square'(%f)\n", (float) value);
    printf("square'(%f)\n", (float) d_mul);
    printf("square'(%f)\n", (float) d_array[2]);
}