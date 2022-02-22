// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

#pragma once

#include <cmath>
#include <vector>
using std::vector;
#include "../../cpp/defs.h"
#include "../../cpp/matrix.h"

////////////////////////////////////////////////////////////
//////////////////// Declarations //////////////////////////
////////////////////////////////////////////////////////////

// d: dim
// k: number of gaussians
// n: number of points
// alphas: k logs of mixture weights (unnormalized), so
//          weights = exp(log_alphas) / sum(exp(log_alphas))
// means: d*k component means
// icf: (d*(d+1)/2)*k inverse covariance factors
//                  every icf entry stores firstly log of diagonal and then
//          columnwise other entris
//          To generate icf in MATLAB given covariance C :
//              L = inv(chol(C, 'lower'));
//              inv_cov_factor = [log(diag(L)); L(au_tril_indices(d, -1))]
// wishart: wishart distribution parameters
// x: d*n points
// err: 1 output

void gmm_objective(int d, int k, int n, const double* const alphas, const double* const means,
                   const double* const icf, const double* const x,
                   const double wishart_gamma,
                   const int wishart_m, double* err);

// split of the outer loop over points

void gmm_objective_split_inner(int d, int k,
                               const double* const alphas,
                               const double* const means,
                               const double* const icf,
                               const double* const x,
                               Wishart wishart,
                               double* err);
// other terms which are outside the loop

void gmm_objective_split_other(int d, int k, int n,
                               const double* const alphas,
                               const double* const means,
                               const double* const icf,
                               const double wishart_gamma,
                               const int wishart_m,
                               double* err);


double logsumexp(int n, const double* const x);

// p: dim
// k: number of components
// wishart parameters
// sum_qs: k sums of log diags of Qs
// Qdiags: d*k
// icf: (p*(p+1)/2)*k inverse covariance factors

double log_wishart_prior(int p, int k,
                    Wishart wishart,
                    const double* const sum_qs,
                    const double* const Qdiags,
                    const double* const icf);


void preprocess_qs(int d, int k,
                   const double* const icf,
                   double* sum_qs,
                   double* Qdiags);


void Qtimesx(int d,
             const double* const Qdiag,
             const double* const ltri, // strictly lower triangular part
             const double* const x,
             double* out);

////////////////////////////////////////////////////////////
//////////////////// Definitions ///////////////////////////
////////////////////////////////////////////////////////////


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
  for (int id = 0; id < d; id++)
    out[id] = Qdiag[id] * x[id];

  int Lparamsidx = 0;
  for (int i = 0; i < d; i++)
  {
    for (int j = i + 1; j < d; j++)
    {
      out[j] = out[j] + ltri[Lparamsidx] * x[i];
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


void gmm_objective_split_inner(int d, int k,
                               const double* const alphas,
                               const double* const means,
                               const double* const icf,
                               const double* const x,
                               Wishart wishart,
                               double* err)
{
  int icf_sz = d * (d + 1) / 2;

  double* Ldiag = new double[d];
  double* xcentered = new double[d];
  double* mahal = new double[d];
  double* lse = new double[k];

  for (int ik = 0; ik < k; ik++)
  {
    int icf_off = ik * icf_sz;
    double sumlog_Ldiag(0.);
    for (int id = 0; id < d; id++)
    {
      sumlog_Ldiag = sumlog_Ldiag + icf[icf_off + id];
      Ldiag[id] = exp(icf[icf_off + id]);
    }

    for (int id = 0; id < d; id++)
    {
      xcentered[id] = x[id] - means[ik * d + id];
      mahal[id] = Ldiag[id] * xcentered[id];
    }
    int Lparamsidx = d;
    for (int i = 0; i < d; i++)
    {
      for (int j = i + 1; j < d; j++)
      {
        mahal[j] = mahal[j] + icf[icf_off + Lparamsidx] * xcentered[i];
        Lparamsidx++;
      }
    }
    double sqsum_mahal(0.);
    for (int id = 0; id < d; id++)
    {
      sqsum_mahal = sqsum_mahal + mahal[id] * mahal[id];
    }

    lse[ik] = alphas[ik] + sumlog_Ldiag - 0.5 * sqsum_mahal;
  }

  *err = logsumexp(k, lse);

  delete[] mahal;
  delete[] xcentered;
  delete[] Ldiag;
  delete[] lse;
}


