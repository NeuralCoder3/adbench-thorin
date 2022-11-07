// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

#pragma once



#include <vector>
#include <string>
#include <stdlib.h>
#include <math.h>

double sigmoid(double x);

template<typename T>
struct WeightOrBias
{
    const T* forget;
    const T* ingate;
    const T* outgate;
    const T* change;

    WeightOrBias(const T* params, int hsize) :
            forget(params),
            ingate(&params[hsize]),
            outgate(&params[2 * hsize]),
            change(&params[3 * hsize])
    {}
};

template<typename T>
struct LayerParams
{
    const WeightOrBias<T> weight;
    const WeightOrBias<T> bias;

    LayerParams(const T* layer_params, int hsize) :
            weight(layer_params, hsize),
            bias(&layer_params[hsize * 4], hsize)
    {}
};

template<typename T>
struct MainParams
{
    std::vector<LayerParams<T> > layer_params;

    MainParams(const T* main_params, int hsize, int n_layers)
    {
        layer_params.reserve(n_layers);
        for (int i = 0; i < n_layers; ++i)
        {
            layer_params.emplace_back(&main_params[8 * hsize * i], hsize);
        }
    }
};

template<typename T>
struct ExtraParams
{
    const T* in_weight;
    const T* out_weight;
    const T* out_bias;

    ExtraParams(const T* params, int hsize) :
            in_weight(params),
            out_weight(&params[hsize]),
            out_bias(&params[2 * hsize])
    {}
};

template<typename T>
struct InputSequence
{
    std::vector<const T*> sequence;

    InputSequence(const T* input_sequence, int char_bits, int char_count)
    {
        sequence.reserve(char_count);
        for (int i = 0; i < char_count; ++i)
        {
            sequence.push_back(&input_sequence[char_bits * i]);
        }
    }
};

template<typename T>
struct LayerState
{
    T* hidden;
    T* cell;

    LayerState(T* layer_state, int hsize) :
            hidden(layer_state),
            cell(&layer_state[hsize])
    {}
};

template<typename T>
struct State
{
    std::vector<LayerState<T> > layer_state;

    State(T* state, int hsize, int n_layers)
    {
        layer_state.reserve(n_layers);
        for (int i = 0; i < n_layers; ++i)
        {
            layer_state.emplace_back(&state[2 * hsize * i], hsize);
        }
    }
};


// LSTM objective (loss function)
// Input variables: main_params (8 * l * b), extra_params (3 * b)
// Output variable: loss (scalar)
// Parameters:
//      state (2 * l * b)
//      sequence (c * b)
void lstm_objective(
    int l,
    int c,
    int b,
    double const* main_params,
    double const* extra_params,
    double* state,
    double const* sequence,
    double* loss
);


void read_lstm_instance(const std::string& fn,
                        int* l, int* c, int* b,
                        std::vector<double>& main_params,
                        std::vector<double>& extra_params,
                        std::vector<double>& state,
                        std::vector<double>& sequence);
