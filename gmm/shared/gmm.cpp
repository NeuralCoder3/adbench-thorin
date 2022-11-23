// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.


#include <cmath>
#include <vector>
using std::vector;
#include "../../cpp/defs.h"
#include "../../cpp/matrix.h"
#include "gmm.h"


double logsumexp(int n, const double* const __restrict x)
{
  double mx = arr_max(n, x);
  double semx = 0.;
  for (int i = 0; i < n; i++)
  {
    semx = semx + exp(x[i] - mx);
  }
  return log(semx) + mx;
}

double log_wishart_prior(int p, int k,
                    const double wishart_gamma,
                    const int wishart_m,
                    const double* const __restrict sum_qs,
                    const double* const __restrict Qdiags,
                    const double* const __restrict icf)
{
  int n = p + wishart_m + 1;
  int icf_sz = p * (p + 1) / 2;

  double C = n * p * (log(wishart_gamma) - 0.5 * log(2)) - log_gamma_distrib(0.5 * n, p);

  double out = 0;
  for (int ik = 0; ik < k; ik++)
  {
    double frobenius = sqnorm(p, &Qdiags[ik * p]) + sqnorm(icf_sz - p, &icf[ik * icf_sz + p]);
    out = out + 0.5 * wishart_gamma * wishart_gamma * (frobenius)
          -wishart_m * sum_qs[ik];
  }

  return out - k * C;
}


void preprocess_qs(int d, int k,
                   const double* const __restrict icf,
                   double* __restrict sum_qs,
                   double* __restrict Qdiags)
{
  int icf_sz = d * (d + 1) / 2;
  for (int ik = 0; ik < k; ik++)
  {
    sum_qs[ik] = 0.;
    for (int id = 0; id < d; id++)
    {
      double q = icf[ik * icf_sz + id];
      sum_qs[ik] = sum_qs[ik] + q;
      Qdiags[ik * d + id] = exp(q);
    }
  }
}


void Qtimesx(int d,
             const double* const __restrict Qdiag,
             const double* const __restrict ltri, // strictly lower triangular part
             const double* const __restrict x,
             double* out)
{
    int i, j;
    for (i = 0; i < d; i++)
    {
        out[i] = Qdiag[i] * x[i];
    }

    int Lparamsidx = 0;
    for (i = 0; i < d; i++)
    {
        double x_val = x[i];
        for (j = i + 1; j < d; j++)
        {
            out[j] = out[j] + ltri[Lparamsidx++] * x_val;
        }
    }
}

void gmm_objective(int d, int k, int n,
                   const double* const __restrict alphas,
                   const double* const __restrict means,
                   const double* const __restrict icf,
                   const double* const __restrict x,
                   const double wishart_gamma,
                   const int wishart_m,
                   double* __restrict err)
{

  const double CONSTANT = -n * d * 0.5 * log(2 * PI);
  int icf_sz = d * (d + 1) / 2;

    double* Qdiags = (double*)malloc(d * k * sizeof(double));
    double* sum_qs = (double*)malloc(k * sizeof(double));
    double* xcentered = (double*)malloc(d * sizeof(double));
    double* Qxcentered = (double*)malloc(d * sizeof(double));
    double* main_term = (double*)malloc(k * sizeof(double));

  preprocess_qs(d, k, icf, &sum_qs[0], &Qdiags[0]);

  double slse = 0.;

  for (int ix = 0; ix < n; ix++)
  {
    for (int ik = 0; ik < k; ik++)
    {
      subtract(d, &x[ix * d], &means[ik * d], &xcentered[0]);
      Qtimesx(d, &Qdiags[ik * d], &icf[ik * icf_sz + d], &xcentered[0], &Qxcentered[0]);

      main_term[ik] = alphas[ik] + sum_qs[ik] - 0.5 * sqnorm(d, &Qxcentered[0]);
    }
    slse = slse + logsumexp(k, &main_term[0]);
  }

  double lse_alphas = logsumexp(k, alphas);

  *err = CONSTANT + slse - n * lse_alphas + log_wishart_prior(d, k, wishart_gamma, wishart_m, &sum_qs[0], &Qdiags[0], icf);

    free(Qdiags);
    free(sum_qs);
    free(xcentered);
    free(Qxcentered);
    free(main_term);
}



