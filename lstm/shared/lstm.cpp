// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

/*
 *   File "lstm_b_tapenade_generated.c" is generated by Tapenade 3.14 (r7259) from this file.
 *   To reproduce such a generation you can use Tapenade CLI
 *   (can be downloaded from http://www-sop.inria.fr/tropics/tapenade/downloading.html)
 *
 *   After installing use the next command to generate a file:
 *
 *      tapenade -b -o lstm_tapenade -head "lstm_objective(loss)/(main_params extra_params)" lstm.c
 *
 *   This will produce a file "lstm_tapenade_b.c" which content will be the same as the content of the file "lstm_b_tapenade_generated.c",
 *   except one-line header. Moreover a log-file "lstm_tapenade_b.msg" will be produced.
 *
 *   NOTE: the code in "lstm_b_tapenade_generated.c" is wrong and won't work.
 *         REPAIRED SOURCE IS STORED IN THE FILE "lstm_b.c".
 *         You can either use diff tool or read "lstm_b.c" header to figure out what changes was performed to fix the code.
 *
 *   NOTE: you can also use Tapenade web server (http://tapenade.inria.fr:8080/tapenade/index.jsp)
 *         for generating but the result can be slightly different.
 */
#include "lstm.h"
#include <iostream>

// UTILS
// Sigmoid on scalar
double sigmoid(double x)
{
    return 1.0 / (1.0 + exp(-x));
}

// log(sum(exp(x), 2))
double logsumexp(double const* vect, int sz)
{
    double sum = 0.0;
    int i;

    for (i = 0; i < sz; i++)
    {
        sum += exp(vect[i]);
    }

    sum += 2;
    return log(sum);
}

// LSTM OBJECTIVE
// The LSTM model
void lstm_model(
    int hsize,
    double const* weight,
    double const* bias,
    double* hidden,
    double* cell,
    double const* input
)
{
    double* gates = new double[4 * hsize];
    double* forget = &(gates[0]);
    double* ingate = &(gates[hsize]);
    double* outgate = &(gates[2 * hsize]);
    double* change = &(gates[3 * hsize]);

    int i;
    for (i = 0; i < hsize; i++)
    {
        forget[i] = sigmoid(input[i] * weight[i] + bias[i]);
        ingate[i] = sigmoid(hidden[i] * weight[hsize + i] + bias[hsize + i]);
        outgate[i] = sigmoid(input[i] * weight[2 * hsize + i] + bias[2 * hsize + i]);
        change[i] = tanh(hidden[i] * weight[3 * hsize + i] + bias[3 * hsize + i]);
    }

    for (i = 0; i < hsize; i++)
    {
        cell[i] = cell[i] * forget[i] + ingate[i] * change[i];
    }

    for (i = 0; i < hsize; i++)
    {
        hidden[i] = outgate[i] * tanh(cell[i]);
    }

    delete[] gates;
}

// Predict LSTM output given an input
void lstm_predict(
    int l,
    int b,
    double const* w,
    double const* w2,
    double* s,
    double const* x,
    double* x2
)
{
    int i;
    for (i = 0; i < b; i++)
    {
        x2[i] = x[i] * w2[i];
    }

    double* xp = x2;
    for (i = 0; i <= 2 * l * b - 1; i += 2 * b)
    {
        lstm_model(b, &(w[i * 4]), &(w[(i + b) * 4]), &(s[i]), &(s[i + b]), xp);
        xp = &(s[i]);
    }

    for (i = 0; i < b; i++)
    {
        x2[i] = xp[i] * w2[b + i] + w2[2 * b + i];
    }
}

// LSTM objective (loss function)
void lstm_objective(
    int l,
    int c,
    int b,
    double const* main_params,
    double const* extra_params,
    double* state,
    double const* sequence,
    double* loss
)
{
    int i, t;
    double total = 0.0;
    int count = 0;
    const double* input = &(sequence[0]);
    double* ypred = (double*)malloc(b * sizeof(double));
    double* ynorm = (double*)malloc(b * sizeof(double));
    const double* ygold;
    double lse;

    for (t = 0; t <= (c - 1) * b - 1; t += b)
    {
        lstm_predict(l, b, main_params, extra_params, state, input, ypred);
        lse = logsumexp(ypred, b);
        for (i = 0; i < b; i++)
        {
            ynorm[i] = ypred[i] - lse;
        }

        ygold = &(sequence[t + b]);
        for (i = 0; i < b; i++)
        {
            total += ygold[i] * ynorm[i];
        }


        count += b;
        input = ygold;
    }

    *loss = -total / count;
free(ypred);
    free(ynorm);
}



void read_lstm_instance(const std::string& fn,
                        int* l, int* c, int* b,
                        std::vector<double>& main_params,
                        std::vector<double>& extra_params,
                        std::vector<double>& state,
                        std::vector<double>& sequence)
{
    FILE* fid = fopen(fn.c_str(), "r");

    if (!fid) {
        printf("could not open file: %s\n", fn.c_str());
        exit(1);
    }

    fscanf(fid, "%i %i %i", l, c, b);

    int l_ = *l, c_ = *c, b_ = *b;

    int main_sz = 2 * l_ * 4 * b_;
    int extra_sz = 3 * b_;
    int state_sz = 2 * l_ * b_;
    int seq_sz = c_ * b_;

    main_params.resize(main_sz);
    extra_params.resize(extra_sz);
    state.resize(state_sz);
    sequence.resize(seq_sz);

    for (int i = 0; i < main_sz; i++) {
        fscanf(fid, "%lf", &main_params[i]);
    }

    for (int i = 0; i < extra_sz; i++) {
        fscanf(fid, "%lf", &extra_params[i]);
    }

    for (int i = 0; i < state_sz; i++) {
        fscanf(fid, "%lf", &state[i]);
    }

    for (int i = 0; i < c_ * b_; i++) {
        fscanf(fid, "%lf", &sequence[i]);
    }

    fclose(fid);
}