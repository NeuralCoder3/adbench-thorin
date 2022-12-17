#include "../shared/lstm.h"
#include "lstm_d.h"
#include <stdio.h>
#include "../../cpp/read.h"
#include "../../cpp/lib.h"
#include <string>

int main(int argc, const char** argv){
    if(argc < 2){
        printf("No file specified!");
        return -1;
    }

    int l;
    int c;
    int b;
    std::vector<double> main_params;
    std::vector<double> extra_params;
    std::vector<double> state;
    std::vector<double> sequence;

    std::string benchmark = argv[1];


    read_lstm_instance(benchmark, &l, &c, &b, main_params, extra_params, state, sequence);
    double error;


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
        lstm_objective_d(l, c, b, &main_params[0], &extra_params[0], state, &sequence[0], &error, J);
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