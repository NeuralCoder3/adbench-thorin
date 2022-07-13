#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <string>
#include <iostream>
#include <algorithm>
#include <thread>
#include <functional>
#include <vector>
#include <random>
#include <sstream>
#include <cblas.h>

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

    int parseInt(const char* i) {
        return std::atoi(i);
    }

    double randomDouble(double fMin, double fMax)
    {
      double f = (double)rand() / RAND_MAX;
      return fMin + f * (fMax - fMin);
    }



    void measure(std::function<void()> f){
        std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();

        f();

        static long store = 0;

        std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
        store +=  (double)std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count() / 1000;
        std::cout << "Time difference = " << store << "[ms]" << std::endl;
    }

    void dgemm(long a_rows, long b_cols, long a_cols, double* a, double* b, double* c){


        //measure([&](){
            float alpha = 1.0;
            float beta = 0.0;

            cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                        a_rows, b_cols, a_cols, alpha, a, a_cols, b, b_cols, beta, c, b_cols);
        //});
    }

    double test(double* x, double* y, int z){
        return x[0] * y[0];
    }

}