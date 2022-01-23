//
// Created by Christopher Jung on 23.01.22.
//

#ifndef IMPALA_BA_H
#define IMPALA_BA_H


#ifndef NBDirsMax
#define NBDirsMax 1650
#endif

#define NBDirsMaxReproj_BV 2

#ifndef PI
#define PI 3.14159265359
#endif

#define BA_NCAMPARAMS 11
#define BA_ROT_IDX 0
#define BA_C_IDX 3
#define BA_F_IDX 6
#define BA_X0_IDX 7
#define BA_RAD_IDX 9

//# Flexion, Abduction, Twist = 'xzy'
#define HAND_XYZ_TO_ROTATIONAL_PARAMETERIZATION {0, 2, 1}


#endif //IMPALA_BA_H


extern "C"{
void ba_objective(int n, int m, int p,
                  const double* const cams,
                  const double* const X,
                  const double* const w,
                  const int* const obs,
                  const double* const feats,
                  double* reproj_err,
                  double* w_err);
}