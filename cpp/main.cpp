#include "gmm.h"
#include "gmm_d.h"
#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include "read.h"
#include "defs.h"
#include <string>


int main(){
    int d;
    int k;
    int n;
    vector<double> alphas;
    vector<double> means;
    vector<double> icf;
    vector<double> x;
    Wishart wishart;

    std::string benchmark = "benchmark/gmm_d2_K5.txt";
    read_gmm_instance(benchmark, &d, &k, &n, alphas, means, icf, x, wishart, false);

    //cpp : -5240.590563
    //impala : -5240.589720
    //diff: 0.000843

    double error = 0;
    gmm_objective<double>(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart, &error);

    printf("error\n");
    printf("%lf\n", error);

    vector<double> J;


    int icf_sz = d * (d + 1) / 2;
    J.resize(k + d * k + icf_sz * k);
    gmm_objective_d(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart, &error, &J[0]);

    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];

    printf("\n");
    printf("alpha derivative\n");

    for (int i = 0; i < k; i++)
    {
        printf("%lf\n", alphas_d[i]);
    }

    printf("\n");
    printf("means derivative\n");
    for (int i = 0; i < k*d; i++)
    {
        printf("%lf\n", means_d[i]);
    }

    printf("\n");
    printf("icf derivative\n");
    for (int i = 0; i < k*icf_sz; i++)
    {
        printf("%lf\n", icf_d[i]);
    }

    return 0;
}