//
// Created by Christopher Jung on 08.08.22.
//

#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <vector>
#include <string>
#include <iostream>

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

void product(double* x, double* y, double* z, int size){
    for( int i = 0 ; i < size ; i++ ){
        for (int j = 0; j < size; j++) {
            z[i * size + j] = 0.0;
        }

        for (int k = 0; k < size; k++) {
            for (int j = 0; j < size; j++) {
                z[i * size + j] += x[i * size + k] * y[k * size + j];
            }
        }
    }
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


int main(int argc, char** argv){
    
    int size = std::atoi(argv[1]);

    double help = 0.0;

    for( size_t i = 39 ; i <= 41 ; i++ ){
        size = 50 * i;
        double* x = new double[size * size];
        double* y = new double[size * size];
        double* z = new double[size * size];

        double* x_d = new double[size * size];
        double* y_d = new double[size * size];
        double* z_d = new double[size * size];

        for( size_t i = 0 ; i < size * size ; i++ ){
            x[i] = i;
            y[i] = i;
            z[i] = 0;
            x_d[i] = 0;
            y_d[i] = 0;
            z_d[i] = 0;
        }
        z_d[0] = 1.0;

        start();
        product_d(x,x_d, y,y_d, z,z_d, size);
        //std::cout << size << ":";
        end();

        help += z[0] +  x_d[0] + y_d[0];
    }
    std::cout << help << std::endl;


}