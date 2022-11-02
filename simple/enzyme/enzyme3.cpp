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

double fib(double x) {
    if(x < 2) {
        return x;
    }else {
        return fib(x-1) + fib(x-2);
    }
}

double fib_d( double x ){

    double grad_x = __enzyme_autodiff((void*)fib, x);

    return grad_x;
}

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    double x = atof(argv[1]);

    //begin();
    double x_d = fib_d(x);
    //eval();

    printf("%f", x_d);

    return 0;
}