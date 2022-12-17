#include "../shared/gmm.h"
#include "../shared/gmm_d.h"
#include <stdio.h>
#include "../../cpp/read.h"
#include "../../cpp/lib.h"

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

    double error = 0;
    gmm_objective(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart.gamma, wishart.m, &error);

    std::vector<double> J;

    int icf_sz = d * (d + 1) / 2;

    auto min_samples = 10;
    long min_time = 500;

    auto count = 0;
    long min_runtime = -1;
    long time_sum = 0;

    while(time_sum < 10000  && (count < min_samples || time_sum < min_time)){
        J.clear();
        J.resize(k + d * k + icf_sz * k);
        begin();
        gmm_objective_d(d, k, n, &alphas[0], &means[0], &icf[0], &x[0], wishart.gamma, wishart.m, &error, &J[0]);
        auto time = eval();

        if(min_runtime == -1 || time < min_runtime){
            min_runtime = time;
        }

        time_sum += time;
        count++;
    }

    printLong(min_runtime);
    for (int i = 0; i < J.size(); i++)
    {
        std::cout << std::setprecision(20) << J[i] << std::endl;
    }

    return 0;
}