#include <math.h>
#include <stdio.h>
#include <iostream>
#include <functional>
#include <iomanip>

#include<sys/time.h>

#define MAX(A,B) ((A) > (B) ? A : B)

extern "C"{

void printString(const char* str);

void printLine(const char* str);

void printFloat(float i);

void printDouble(double i);

void printDoubleLine(double i);

void printInteger(int i);

void printIntegerLine(int i);

void printLong(unsigned long i);

int readInt();

int parseInt(const char* i);
double randomDouble(double fMin, double fMax);

static long long startTime;

long long timeInMilliseconds(void);

void begin();

long eval();

void measure(std::function<void()> f);


}