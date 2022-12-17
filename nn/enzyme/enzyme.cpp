#include <math.h>
#include <stdio.h>
#include <iostream>
#include "../../cpp/lib.h"



extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

void softmax(int size, const double* __restrict__ input, double* __restrict__ output){
    double sum = 0.0;
    for(int i = 0 ; i < size ; i++){
        auto inp = exp(input[i]);
        sum += inp;
        output[i] = inp;
    }

    for(int i = 0 ; i < size ; i++){
        output[i] = output[i] / sum;
    }
}

double relu(double x){
    if(x > 0){
        return x;
    }else{
        return 0.1 * x;
    }
}

void fully_connected_layer(int input_size, int output_size, const double * __restrict__ input, const double * __restrict__ weights, double * __restrict__ output){
    for( int i = 0 ; i < input_size ; i++ ){
        auto inp = input[i];
        for( int j = 0 ; j < output_size ; j++ ){
            output[j] += relu(inp * weights[j + i * output_size]);
        }
    }
}


void mul(int input_size, int hidden_size, int output_size,
         const double * __restrict__ input,
         const double * __restrict__ first_weights,
         double * __restrict__ hidden,
         const double * __restrict__ second_weights,
         double * __restrict__ output){
    fully_connected_layer(input_size, hidden_size, input, first_weights, hidden);
    fully_connected_layer(hidden_size, output_size, hidden, second_weights, output);
    softmax(output_size, output, output);
}

void mul_d(int input_size, int hidden_size, int output_size,
           const double * input,
           const double * first_weights,
           const double * hidden,
           const double * second_weights,
           double * output,
           double * input_d,
           const double * first_weights_d,
           const double * hidden_d,
           const double * second_weights_d,
           double * output_d
){
    double err_d = 1.0;

    __enzyme_autodiff((void*)mul,
                      enzyme_const, input_size,
                      enzyme_const, hidden_size,
                      enzyme_const, output_size,
                      enzyme_dup,   input, input_d,
                      enzyme_dup,   first_weights, first_weights_d,
                      enzyme_dup,   hidden, hidden_d,
                      enzyme_dup,   second_weights, second_weights_d,
                      enzyme_dup,   output, output_d);
}

void print(int size, const double* arr){
    for (int i = 0; i < size; i++)
    {
        std::cout << arr[i] << "," ;
    }
    std::cout << std::endl;
}

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    int input_size = atoi(argv[1]);
    int hidden_size = atoi(argv[2]);
    int output_size = atoi(argv[3]);
    int first_weights_size = input_size * hidden_size;
    int second_weights_size = hidden_size * output_size;

    auto input = new double[input_size];
    auto first_weights = new double[first_weights_size];
    auto hidden = new double[hidden_size];
    auto second_weights = new double[second_weights_size];
    auto output = new double[output_size];

    auto input_d = new double[input_size];
    auto first_weights_d = new double[first_weights_size];
    auto hidden_d = new double[hidden_size];
    auto second_weights_d = new double[second_weights_size];
    auto output_d = new double[output_size];

    auto min_samples = 10;
    long min_time = 500;

    auto count = 0;
    long min_runtime = -1;
    long time_sum = 0;

    while(time_sum < 10000  && (count < min_samples || time_sum < min_time)){
        for (int i = 0; i < input_size; i++)
        {
            input[i] = i * 0.1 - 0.2;
            input_d[i] = 0;
        }

        for (int i = 0; i < first_weights_size; i++)
        {
            first_weights[i] = i * 0.1;
            first_weights_d[i] = 0;
        }

        for (int i = 0; i < hidden_size; i++)
        {
            hidden[i] = 0;
            hidden_d[i] = 0;
        }

        for (int i = 0; i < second_weights_size; i++)
        {
            second_weights[i] = i * 0.1;
            second_weights_d[i] = 0;
        }

        for (int i = 0; i < output_size; i++)
        {
            output[i] = 0;
            output_d[0] = 0;
        }

        output_d[0] = 1;

        begin();
        mul_d(input_size, hidden_size, output_size, input, first_weights, hidden, second_weights, output,
              input_d, first_weights_d, hidden_d, second_weights_d, output_d);
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