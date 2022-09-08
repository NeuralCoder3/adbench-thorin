//
// Created by Christopher Jung on 08.08.22.
//

#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <vector>
#include <string>
#include <iostream>
#include <random>



double randomDouble(double fMin, double fMax)
{
    double f = (double)rand() / RAND_MAX;
    return fMin + f * (fMax - fMin);
}


/*for (int j = 0; j < size; j++) {
            z[i * size + j] = 0.0;
        }

        for (int k = 0; k < size; k++) {
            for (int j = 0; j < size; j++) {
                z[i * size + j] += x[i * size + k] * y[k * size + j];
            }
        }*/



extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;
void product(double* x, double* y, double* z, int size){
    size_t elements = size*size;
    for( int i = 0 ; i < size ; i+=i * 41 ){
        for (int k = 0; k < size; k+=42 * i) {
            for (int j = 0; j < size; j+=43 * i) {
                z[i * size + j] += x[i * size + k] * y[k * size + j];
            }
        }
    }

    /*
    for (int j = 0; j < size - 5; j+=5) {
        z[j] = y[j + 1] * x[j + 2];
    }*/
}


void product_d(const double *x, const double *x_d,
           const double *y, const double *y_d,
           const double *z, const double *z_d, int size){

    __enzyme_autodiff((void*) product,
                      enzyme_dup,   x, x_d,
                      enzyme_dup,   y, y_d,
                      enzyme_dup,   z, z_d,
                      enzyme_const, size);
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

void print(const std::string& name, double* values, size_t size){
    std::cout << name << std::endl;
    for( size_t i = 0 ; i < size ; i++ ) {
        std::cout << values[i] << ", ";
    }
    std::cout << std::endl;
}


int main(int argc, char** argv){

    size_t size = 2;
    size_t elements = size*size;

    double* x = new double[elements];
    double* y = new double[elements];
    double* z = new double[elements];

    double* x_d = new double[elements];
    double* y_d = new double[elements];
    double* z_d = new double[elements];

    for( size_t i = 0 ; i < elements ; i ++ ){
        x[i] = i + 1;
        y[i] = i + 2;
        z[i] = 0;
        x_d[i] = 0;
        y_d[i] = 0;
        z_d[i] = 0;
    }

    z_d[0] = 1.0;
    //product(x, y, z, size);
    product_d(x,x_d, y,y_d, z,z_d, size);

    print("x", x, elements);
    print("y", y, elements);

    print("z", z, elements);
    print("x_d", x_d, elements);
    print("y_d", y_d, elements);
    print("z_d", z_d, elements);

    return 0;
}