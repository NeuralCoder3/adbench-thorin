#include <math.h>
#include <stdio.h>
#include <vector>
#include "../shared/lstm.h"
#include "../../cpp/lib.h"

extern double __enzyme_autodiff(void*, ...);

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;

void lstm_d(int l, int c, int b,
          double * __restrict__ main_params,
          double * __restrict__ extra_params,
          double * __restrict__ state,
          double * __restrict__ sequence,
          double * __restrict__ loss,
          double * __restrict__ J){


    int main_sz = 2 * l * 4 * b;
    int extra_sz = 3 * b;
    int state_sz = 2 * l * b;
    int seq_sz = c * b;

    double *main_d = J;
    double *extra_d = &main_d[main_sz];
    double *state_d = &extra_d[extra_sz];
    double *sequence_d = &state_d[state_sz];

    double loss_d = 1.0;

    __enzyme_autodiff((void*) lstm_objective,
                        enzyme_const, l,
                        enzyme_const, c,
                        enzyme_const, b,
                        enzyme_dup, main_params, main_d,
                        enzyme_dup, extra_params, extra_d,
                        enzyme_dup, state, state_d,
                        enzyme_dup, sequence, sequence_d,
                        enzyme_dup, loss, &loss_d);
}

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    std::string benchmark = argv[1];

    int l;
    int c;
    int b;

    std::vector<double> main_params;
    std::vector<double> extra_params;
    std::vector<double> state;
    std::vector<double> sequence;

    read_lstm_instance(benchmark.c_str(), &l, &c, &b, main_params, extra_params, state, sequence);

    int main_sz = 2 * l * 4 * b;
    int extra_sz = 3 * b;
    int state_sz = 2 * l * b;
    int seq_sz = c * b;

    auto size = main_sz + extra_sz + state_sz + seq_sz;
    double *J = new double [size];
    double loss;

    auto min_samples = 10;
    long min_time = 500;

    auto count = 0;
    long min_runtime = -1;
    long time_sum = 0;

    while(time_sum < 10000  && (count < min_samples || time_sum < min_time)){
        for( size_t i = 0 ; i < size ; i++ ){
            J[i] = 0.0;
        }

        begin();
        lstm_d(l, c, b, &main_params[0], &extra_params[0], &state[0], &sequence[0], &loss, J);
        auto time = eval();

        if(min_runtime == -1 || time < min_runtime){
            min_runtime = time;
        }

        time_sum += time;
        count++;
    }

    printLong(min_runtime);

    for( size_t i = 0 ; i < main_sz + extra_sz ; i++ ){
        std::cout << std::setprecision(20) << J[i] << std::endl;
    }

    return 0;
}