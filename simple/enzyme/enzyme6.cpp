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



void mul(int input_size, int output_size,
         const double *input,
         const double *weights,
         double *output){

    for( int i = 0 ; i < input_size ; i++ ){
        for( int j = 0 ; j < output_size ; j++ ){
            output[j] += input[j] * weights[j + i * output_size];
        }
    }
}

void mul_d(int input_size, int output_size,
           const double *input,
           const double *weights,
           double *output,
           double *input_d,
           double *weights_d,
           double *output_d
){


    double err_d = 1.0;

    __enzyme_autodiff((void*)mul,
                      enzyme_const, input_size,
                      enzyme_const, output_size,
                      enzyme_dup,   input, input_d,
                      enzyme_dup,   weights, weights_d,
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
    int output_size = atoi(argv[2]);
    int weights_size = input_size * output_size;
    auto input = new double[input_size];
    auto weights = new double[weights_size];
    auto output = new double[output_size];

    auto input_d = new double[input_size];
    auto weights_d = new double[weights_size];
    auto output_d = new double[output_size];
    for (int i = 0; i < input_size; i++)
    {
        input[i] = i + 1;
        input_d[i] = 0;
    }

    for (int i = 0; i < weights_size; i++)
    {
        weights[i] = i + 2;
        weights_d[i] = 0;
    }

    for (int i = 0; i < output_size; i++)
    {
        output[i] = 0;
        output_d[i] = 1;
    }

    begin();
    mul_d(input_size, output_size, input, weights, output, input_d, weights_d, output_d);
    //mul(n,input,weights,output);
    eval();

    /*print(input_size, input);
    print(weights_size, weights);
    print(output_size, output);
    print(input_size, input_d);
    print(weights_size, weights_d);
    print(output_size, output_d);*/
    return 0;
}