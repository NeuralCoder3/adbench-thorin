#pragma once

#include <cstring>
#include <string>
#include <vector>
#include "defs.h"


void read_gmm_instance(const std::string& fn,
                       int* d, int* k, int* n,
                       std::vector<double>& alphas,
                       std::vector<double>& means,
                       std::vector<double>& icf,
                       std::vector<double>& x,
                       Wishart& wishart,
                       bool replicate_point);

extern "C"{
void read_gmm(
        char* file,
        int* d,
        int* k,
        int* n,
        int* wishartM,
        double* wishartGamma,
        double* alphas,
        double* means,
        double* icf,
        double* x
);

void read_gmm_size(
        char* file,
        int* d,
        int* k,
        int* n
);
}