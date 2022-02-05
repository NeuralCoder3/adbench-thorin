#include <math.h>
#include <stdio.h>
#include <stdbool.h>

extern "C"{
    void printString(const char* str){
        printf("%s\n", str);
    }

    void printFloat(float i) {
        printf("%f\n", i);
    }
    void printDouble(double i) {
        printf("%lf\n", i);
    }
    void printInteger(int i) {
        printf("%d\n", i);
    }

}