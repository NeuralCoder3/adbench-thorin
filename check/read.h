#pragma once

void read_gmm_instance(const std::string& fn,
                       int* d, int* k, int* n,
                       std::vector<double>& alphas,
                       std::vector<double>& means,
                       std::vector<double>& icf,
                       std::vector<double>& x,
                       Wishart& wishart,
                       bool replicate_point);