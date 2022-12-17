#include <stdio.h>
#include <stdlib.h>


int main(){
    int* test = (int*)malloc(10000000000);
    test[0] = 0;
    return *test;
}