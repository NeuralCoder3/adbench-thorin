#include <math.h>
#include <stdio.h>
#include <iostream>
#include<sys/time.h>

long long timeInMilliseconds(void) {
    struct timeval tv;

    gettimeofday(&tv,NULL);
    return (((long long)tv.tv_sec)*1000)+(tv.tv_usec/1000);
}

long long startTime = 0;

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

double func(double x){
    return x * x;
}

void softmax(int size, const double* __restrict input, double* __restrict output){
    double sum = 0.0;
    for(size_t i = 0 ; i < size ; i++){
        auto inp = exp(input[i]);
        sum += inp;
        output[i] = inp;
    }

    for(size_t i = 0 ; i < size ; i++){
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

void fully_connected_layer(int input_size, int output_size, const double * __restrict input, const double * __restrict weights, double *__restrict output){
    for( int i = 0 ; i < input_size ; i++ ){
        for( int j = 0 ; j < output_size ; j++ ){
            output[j] += relu(input[j] * weights[j + i * output_size]);
        }
    }
}


void mul(int input_size, int hidden_size, int output_size,
         const double * __restrict input,
         const double * __restrict first_weights,
         double *__restrict hidden,
         const double *__restrict second_weights,
         double *__restrict output){

    for( int i = 0 ; i < input_size ; i++ ){
        for( int j = 0 ; j < output_size ; j++ ){
            output[j] += input[j] * input[j];
        }
    }

    //fully_connected_layer(input_size, hidden_size, input, first_weights, hidden);
    //fully_connected_layer(hidden_size, output_size, hidden, second_weights, output);
    //softmax(output_size, output, output);
}

void mul_d(int input_size, int hidden_size, int output_size,
           const double *__restrict input,
           const double *__restrict first_weights,
           const double *__restrict hidden,
           const double *__restrict second_weights,
           double *__restrict output,
           double *__restrict input_d,
           const double *__restrict first_weights_d,
           const double *__restrict hidden_d,
           const double *__restrict second_weights_d,
           double *__restrict output_d
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

void print(size_t size, const double* arr){
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
    for (int i = 0; i < input_size; i++)
    {
        input[i] = i + 1;
        input_d[i] = 0;
    }

    for (int i = 0; i < first_weights_size; i++)
    {
        first_weights[i] = i + -8;
        first_weights_d[i] = 0;
    }

    for (int i = 0; i < hidden_size; i++)
    {
        hidden[i] = 0;
        hidden_d[i] = 0;
    }

    for (int i = 0; i < second_weights_size; i++)
    {
        second_weights[i] = i + -8;
        second_weights_d[i] = 0;
    }

    for (int i = 0; i < output_size; i++)
    {
        output[i] = 0;
        output_d[i] = 1;
    }


    begin();
    mul_d(input_size, hidden_size, output_size, input, first_weights, hidden, second_weights, output,
                                   input_d, first_weights_d, hidden_d, second_weights_d, output_d);
    //mul(n,input,weights,output);
    eval();

    if(argc >= 5 && atoi(argv[4])){
        print(input_size, input);
        print(first_weights_size, first_weights);
        print(hidden_size, hidden);
        print(second_weights_size, second_weights);
        print(output_size, output);
        std::cout << "gradients#############################################" << std::endl;
        print(input_size, input_d);
        print(first_weights_size, first_weights_d);
        print(hidden_size, hidden_d);
        print(second_weights_size, second_weights_d);
        print(output_size, output_d);
    }
    return 0;
}