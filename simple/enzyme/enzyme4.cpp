#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <iostream>
#include <vector>
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
    printf("Time elapsed : %lld ms", endTime - startTime);
}

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

void mul(int n,
         double *left,
         double *right){

    for( int i = 0 ; i < n ; i++ ){
        left[i] = left[i] * right[i];
    }
}

void mul_d(int n,
           double *left,
           double *right,
           double *left_d,
           double *right_d
){


    __enzyme_autodiff((void*)mul,
                      enzyme_const, n,
                      enzyme_dup,   left, left_d,
                      enzyme_dup,   right, right_d);
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
        right[i] = i;
        output[i] = 0;

        left_d[i] = 1;
        right_d[i] = 0;
    }

    begin();
    mul_d(n, left, right, left_d, right_d);
    eval();


    return 0;
}