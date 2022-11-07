#include "../shared/gmm.h"
#include "../shared/gmm_d.h"
#include <stdio.h>
#include "../../cpp/read.h"
#include <string>

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    int d;
    int k;
    int n;
    std::vector<double> alphas;
    std::vector<double> means;
    std::vector<double> icf;
    std::vector<double> x;
    Wishart wishart;

    std::string benchmark = argv[1];//"benchmark/gmm_d2_K5.txt";
    read_gmm_instance(benchmark, &d, &k, &n, alphas, means, icf, x, wishart, false);

    //cpp : -5240.590563
    //impala : -5240.589720
    //diff: 0.000843

    double error = 0;
    gmm_objective(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart.gamma, wishart.m, &error);

    printf("error\n");
    printf("%.20lf\n", error);

    std::vector<double> J;

    int icf_sz = d * (d + 1) / 2;
    J.resize(k + d * k + icf_sz * k);
    gmm_objective_d(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart.gamma, wishart.m, &error, &J[0]);

    double *alphas_d = &J[0];
    double *means_d = &J[k];
    double *icf_d = &J[k + d * k];

    printf("\n");
    printf("alpha derivative\n");

    for (int i = 0; i < k; i++)
    {
        printf("%.20lf\n", alphas_d[i]);
    }

    printf("\n");
    printf("means derivative\n");
    for (int i = 0; i < k*d; i++)
    {
        printf("%.20lf\n", means_d[i]);
    }

    printf("\n");
    printf("icf derivative\n");
    for (int i = 0; i < k*icf_sz; i++)
    {
        printf("%.20lf\n", icf_d[i]);
    }


    return 0;
}