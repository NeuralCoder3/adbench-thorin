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
    printf("Time elapsed : %lld ms\n", endTime - startTime);
}

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

double func(double x){
    return x * x;
}



void mul(int n,
         const double *left,
         const double *right,
         double *output){

    for( int i = 0 ; i < n ; i++ ){
        for( int j = 0 ; j < n ; j++ ){
            output[j] += left[i] * right[j];
        }
        for( int j = 0 ; j < n ; j++ ){
            output[j] += left[i] * right[j];
        }
    }
}

void mul_d(int n,
           const double *left,
           const double *right,
           double *output,
           double *left_d,
           double *right_d,
           double *output_d
){


    double err_d = 1.0;

    __enzyme_autodiff((void*)mul,
                      enzyme_const, n,
                      enzyme_dup,   left, left_d,
                      enzyme_dup,   right, right_d,
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

    int n = atoi(argv[1]);
    auto left = new double[n];
    auto right = new double[n];
    auto output = new double[n];

    auto left_d = new double[n];
    auto right_d = new double[n];
    auto output_d = new double[n];
    for (int i = 0; i < n; i++)
    {
        left[i] = i + 1;
        right[i] = i + 2;
        output[i] = 0;

        left_d[i] = 0;
        right_d[i] = 0;
        output_d[i] = 1;
    }

    begin();
    mul_d(n, left, right, output, left_d, right_d, output_d);
    //mul(n,left,right,output);
    eval();

    print(n, left);
    print(n, right);
    print(n, output);
    print(n, left_d);
    print(n, right_d);
    print(n, output_d);
    return 0;
}