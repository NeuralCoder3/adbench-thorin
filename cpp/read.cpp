#include "read.h"

using namespace std;

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
}


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
    )
    {
        FILE* fid = fopen(file, "r");

        if (!fid) {
            return;
        }

        fscanf(fid, "%i %i %i", d, k, n);

        int d_ = *d, k_ = *k, n_ = *n;

        int icf_sz = d_ * (d_ + 1) / 2;

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

        for (int i = 0; i < n_; i++)
        {
            for (int j = 0; j < d_; j++)
            {
                fscanf(fid, "%lf", &x[i * d_ + j]);
            }
        }

        fscanf(fid, "%lf %i", wishartGamma, wishartM);

        fclose(fid);
    }

    void read_gmm_size(
            char* file,
            int* d,
            int* k,
            int* n
    )
    {
        FILE* fid = fopen(file, "r");

        if (!fid) {
            return;
        }

        fscanf(fid, "%i %i %i", d, k, n);
        fclose(fid);
    }

    void read_ba_size(const char* file,
                          int& n, int& m, int& p) {
        FILE *fid = fopen(file, "r");
        if (!fid) {
            throw "oik";
        }

        fscanf(fid, "%i %i %i", &n, &m, &p);
    }


    void read_ba_instance(const char* file,
                          int n, int m, int p,
                          double* cams,
                          double* X,
                          double* w,
                          int* obs,
                          double* feats)
    {
        FILE* fid = fopen(file, "r");
        if (!fid) {
            throw "oik";
        }

        fscanf(fid, "%i %i %i", &n, &m, &p);
        int nCamParams = 11;

        for (int j = 0; j < nCamParams; j++)
            fscanf(fid, "%lf", &cams[j]);
        for (int i = 1; i < n; i++)
            memcpy(&cams[i * nCamParams], &cams[0], nCamParams * sizeof(double));

        for (int j = 0; j < 3; j++)
            fscanf(fid, "%lf", &X[j]);
        for (int i = 1; i < m; i++)
            memcpy(&X[i * 3], &X[0], 3 * sizeof(double));

        fscanf(fid, "%lf", &w[0]);
        for (int i = 1; i < p; i++)
            w[i] = w[0];

        int camIdx = 0;
        int ptIdx = 0;
        for (int i = 0; i < p; i++)
        {
            obs[i * 2 + 0] = (camIdx++ % n);
            obs[i * 2 + 1] = (ptIdx++ % m);
        }

        fscanf(fid, "%lf %lf", &feats[0], &feats[1]);
        for (int i = 1; i < p; i++)
        {
            feats[i * 2 + 0] = feats[0];
            feats[i * 2 + 1] = feats[1];
        }

        fclose(fid);
    }
}



