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

void gmm_objective(int d, int k, int n, const double* const __restrict alphas, const double* const __restrict means,
                   const double* const __restrict icf, const double* const __restrict x,
                   const double wishart_gamma,
                   const int wishart_m, double* __restrict err);

// split of the outer loop over points


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
                    const double wishart_gamma,
                    const int wishart_m,
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
