// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.


#include <cmath>
#include <vector>
using std::vector;
#include "../../cpp/defs.h"
#include "../../cpp/matrix.h"
#include "gmm.h"

double logsumexp(int n, const double* const x)
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
                    const double* const sum_qs,
                    const double* const Qdiags,
                    const double* const icf)
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
                   const double* const icf,
                   double* sum_qs,
                   double* Qdiags)
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
             const double* const Qdiag,
             const double* const ltri, // strictly lower triangular part
             const double* const x,
             double* out)
{
    int i, j;
    for (i = 0; i < d; i++)
    {
        out[i] = Qdiag[i] * x[i];
    }

    //caching lparams as scev doesn't replicate index calculation
    // todo note changing to strengthened form
    //int Lparamsidx = 0;
    for (i = 0; i < d; i++)
    {
        int Lparamsidx = i*(2*d-i-1)/2;
        for (j = i + 1; j < d; j++)
        {
            // and this x
            out[j] = out[j] + ltri[i] * x[i];
            Lparamsidx++;
        }
    }
}

void gmm_objective(int d, int k, int n,
                   const double* const alphas,
                   const double* const means,
                   const double* const icf,
                   const double* const x,
                   const double wishart_gamma,
                   const int wishart_m,
                   double* err)
{
  const double CONSTANT = -n * d * 0.5 * log(2 * PI);
  int icf_sz = d * (d + 1) / 2;

  vector<double> Qdiags(d * k);
  vector<double> sum_qs(k);
  vector<double> xcentered(d);
  vector<double> Qxcentered(d);
  vector<double> main_term(k);

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

  *err = CONSTANT + slse - n * lse_alphas;

  *err = *err + log_wishart_prior(d, k, wishart_gamma, wishart_m, &sum_qs[0], &Qdiags[0], icf);
}



