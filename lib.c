#include <math.h>
#include <stdio.h>


void read_gmm(
    int* d,
    int* k,
    int* n,
    int* wishartM,
    double* wishartGamma,
    double* alphas,
    double* means,
    double* icf,
    double* x){
  *d = 2;
  *k = 5;
  *n = 1000;
  *means = 1.23;
}
/*
void read_gmm_instance(const string& fn,
    int* d, int* k, int* n,
    vector<double>& alphas,
    vector<double>& means,
    vector<double>& icf,
    vector<double>& x,
    Wishart& wishart,
    bool replicate_point)
{
    FILE* fid = fopen(fn.c_str(), "r");

    if (!fid) {
        std::cerr << "Cannot open " << fn << std::endl;
        throw "oiks";
    }

    fscanf(fid, "%i %i %i", d, k, n);

    int d_ = *d, k_ = *k, n_ = *n;

    int icf_sz = d_ * (d_ + 1) / 2;
    alphas.resize(k_);
    means.resize(d_ * k_);
    icf.resize(icf_sz * k_);
    x.resize(d_ * n_);

    for (int i = 0; i < k_; i++)
    {
        fscanf(fid, "%lf", &alphas[i]);
    }

    for (int i = 0; i < k_; i++)
    {
        for (int j = 0; j < d_; j++)
        {
            fscanf(fid, "%lf", &means[i * d_ + j]);
        }
    }

    for (int i = 0; i < k_; i++)
    {
        for (int j = 0; j < icf_sz; j++)
        {
            fscanf(fid, "%lf", &icf[i * icf_sz + j]);
        }
    }

    if (replicate_point)
    {
        for (int j = 0; j < d_; j++)
        {
            fscanf(fid, "%lf", &x[j]);
        }
        for (int i = 0; i < n_; i++)
        {
            memcpy(&x[i * d_], &x[0], d_ * sizeof(double));
        }
    }
    else
    {
        for (int i = 0; i < n_; i++)
        {
            for (int j = 0; j < d_; j++)
            {
                fscanf(fid, "%lf", &x[i * d_ + j]);
            }
        }
    }

    fscanf(fid, "%lf %i", &(wishart.gamma), &(wishart.m));

    fclose(fid);
}*/

void printFloat(float i) {
  printf("%f\n", i);
}
void printDouble(double i) {
  printf("%lf\n", i);
}
void printInteger(int i) {
  printf("%d\n", i);
}
