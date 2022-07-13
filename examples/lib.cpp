#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <cblas.h>
#include <iostream>
#include <cstring>

extern "C"{
    void printString(const char* str){
        printf("%s ", str);
    }

    void printLine(const char* str){
        printf("%s\n", str);
    }

    void printFloat(float i) {
        printf("%f\n", i);
    }

    void printDouble(double i) {
        printf("%lf ", i);
    }

    void printDoubleLine(double i) {
        printf("%lf\n", i);
    }

    void printInteger(int i) {
        printf("%d ", i);
    }

    void printIntegerLine(int i) {
        printf("%d\n", i);
    }

    void printLong(unsigned long i) {
        printf("%lu\n", i);
    }

    double randomDouble(double fMin, double fMax)
    {
        double f = (double)rand() / RAND_MAX;
        return fMin + f * (fMax - fMin);
    }

    void dgemm(long a_rows, long b_cols, long a_cols, double* a, double* b, double* c){

        if( c == a ){
            double a_cpy[a_rows * a_cols];
            memcpy(a_cpy, a, sizeof(double) * a_rows * a_cols);
            a = a_cpy;
        }

        if( c == b ){
            double b_cpy[b_cols * a_cols];
            memcpy(b_cpy, a, sizeof(double) * b_cols * a_cols);
            b = b_cpy;
        }

        float alpha = 1.0;
        float beta = 0.0;

        cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                    a_rows, b_cols, a_cols, alpha, a, a_cols, b, b_cols, beta, c, b_cols);
    }
}

