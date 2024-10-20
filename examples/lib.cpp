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

#include <cstring>

#define MAX(A,B) ((A) > (B) ? A : B)

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



void dgemm(char mode, long a_rows, long b_cols, long a_cols_b_rows, double* a, double* b, double* c){
    bool ltrans = (mode & 1) == 1;
    bool rtrans = (mode & 2) == 2;

    double tmp[MAX(a_rows, b_cols) * a_cols_b_rows];

    if( c == a ){
        memcpy(tmp, a, sizeof(tmp));
        a = tmp;
    }else if( c == b ){
        memcpy(tmp, b, sizeof(tmp));
        b = tmp;
    }

    cblas_dgemm(CblasRowMajor,
                ltrans ? CblasTrans : CblasNoTrans,
                rtrans ? CblasTrans : CblasNoTrans,
                a_rows,
                b_cols,
                a_cols_b_rows,

                1.0,
                a, ltrans ? a_rows : a_cols_b_rows,
                b, rtrans ? a_cols_b_rows : b_cols,

                0.0,
                c, b_cols);
}

void dgeadd(long a_rows, long a_cols, double* a, double* b, double* c){
    if(a == c){
        memcpy(c, a, sizeof(double) * a_rows * a_cols);
        cblas_dgeadd(CblasRowMajor,  a_rows, a_cols, 1.0, b, a_cols, 1.0, c, a_cols);
    }else{
        memcpy(c, b, sizeof(double) * a_rows * a_cols);
        cblas_dgeadd(CblasRowMajor,  a_rows, a_cols, 1.0, a, a_cols, 1.0, c, a_cols);
    }
}

void dgesub(long a_rows, long a_cols, double* a, double* b, double* c){
    if(a == c){
        memcpy(c, a, sizeof(double) * a_rows * a_cols);
        cblas_dgeadd(CblasRowMajor,  a_rows, a_cols, -1.0, b, a_cols, 1.0, c, a_cols);
    }else{
        memcpy(c, b, sizeof(double) * a_rows * a_cols);
        cblas_dgeadd(CblasRowMajor,  a_rows, a_cols, 1.0, a, a_cols, -1.0, c, a_cols);
    }
}

void dscal(long a_rows, long a_cols, double alpha, double* x, double* c){
    cblas_domatcopy(CblasRowMajor, CblasNoTrans, a_rows, a_cols, alpha, x, a_cols, c, a_cols);
}

double dsum(long a_rows, long b_cols, double* x){
    return cblas_dsum (a_rows * b_cols, x, 1);
}

uint64_t timeSinceEpochMillisec() {
    using namespace std::chrono;
    return duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count();
}

static int start_time = 0;
void start(){
    start_time = timeSinceEpochMillisec();
}

void end(){
    int end_time = timeSinceEpochMillisec();
    printf("%d\n", end_time - start_time);
    std::flush(std::cout);
}

int readInt(){
    int n;
    std::cin >> n;
    return n;
}

void* malloc2(long size){
    return malloc(size);
}

}