//
// Created by Christopher Jung on 23.01.22.
//

#include "ba.h"

#include <stdlib.h>
#include <math.h>
#include <float.h>

#include "../../cpp/defs.h"
#include "../../cpp/matrix.h"

double sqsum(int n, const double* const x)
{
    double res = 0;
    for (int i = 0; i < n; i++)
        res = res + x[i] * x[i];
    return res;
}

void rodrigues_rotate_point(
        const double* const rot,
        const double* const pt,
        double *rotatedPt)
{
    double sqtheta = sqsum(3, rot);
    if (sqtheta != 0)
    {
        double theta, costheta, sintheta, theta_inverse,
                w[3], w_cross_pt[3], tmp;

        theta = sqrt(sqtheta);
        costheta = cos(theta);
        sintheta = sin(theta);
        theta_inverse = 1.0 / theta;

        for (int i = 0; i < 3; i++)
            w[i] = rot[i] * theta_inverse;

        cross(w, pt, w_cross_pt);

        tmp = (w[0] * pt[0] + w[1] * pt[1] + w[2] * pt[2]) *
              (1. - costheta);

        for (int i = 0; i < 3; i++)
            rotatedPt[i] = pt[i] * costheta + w_cross_pt[i] * sintheta + w[i] * tmp;
    }
    else
    {
        double rot_cross_pt[3];
        cross(rot, pt, rot_cross_pt);

        for (int i = 0; i < 3; i++)
            rotatedPt[i] = pt[i] + rot_cross_pt[i];
    }
}

void radial_distort(
        const double* const rad_params,
        double *proj)
{
    double rsq, L;
    rsq = sqsum(2, proj);
    L = 1. + rad_params[0] * rsq + rad_params[1] * rsq * rsq;
    proj[0] = proj[0] * L;
    proj[1] = proj[1] * L;
}

void project(const double* const cam,
             const double* const X,
             double* proj)
{
    const double* const C = &cam[3];
    double Xo[3], Xcam[3];

    Xo[0] = X[0] - C[0];
    Xo[1] = X[1] - C[1];
    Xo[2] = X[2] - C[2];

    rodrigues_rotate_point(&cam[0], Xo, Xcam);

    proj[0] = Xcam[0] / Xcam[2];
    proj[1] = Xcam[1] / Xcam[2];

    radial_distort(&cam[9], proj);

    proj[0] = proj[0] * cam[6] + cam[7];
    proj[1] = proj[1] * cam[6] + cam[8];
}


void computeReprojError(
        const double* const cam,
        const double* const X,
        const double* const w,
        const double* const feat,
        double *err)
{
    double proj[2];
    project(cam, X, proj);

    err[0] = (*w)*(proj[0] - feat[0]);
    err[1] = (*w)*(proj[1] - feat[1]);
}

void computeZachWeightError(const double* const w, double* err)
{
    *err = 1 - (*w)*(*w);
}


extern "C"{
void ba_objective(int n, int m, int p,
                  const double* const cams,
                  const double* const X,
                  const double* const w,
                  const int* const obs,
                  const double* const feats,
                  double* reproj_err,
                  double* w_err)
{
    for (int i = 0; i < p; i++)
    {
        int camIdx = obs[i * 2 + 0];
        int ptIdx = obs[i * 2 + 1];
        computeReprojError(&cams[camIdx * BA_NCAMPARAMS], &X[ptIdx * 3],
                           &w[i], &feats[i * 2], &reproj_err[2 * i]);
    }

    for (int i = 0; i < p; i++)
    {
        computeZachWeightError(&w[i], &w_err[i]);
    }
}
};