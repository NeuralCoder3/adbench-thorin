#include "../shared/lstm.h"
#include "lstm_d.h"
#include <stdio.h>
#include "../../cpp/read.h"
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
    lstm_objective(l, c, b, &main_params[0], &extra_params[0], &state[0], &sequence[0], &error);

    printf("error\n");
    printf("%.20lf\n", error);

    return 0;
}