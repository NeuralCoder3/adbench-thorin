
#include <vector>
#include <cmath>
#include <iostream>
#include <fstream>
#include <cstring>
#include <filesystem>
#include <unistd.h>
#include <limits.h>
#include <unistd.h>
#include <stdlib.h>
#include <unistd.h>
#include <random>
#include <sstream>
#include <sstream>
#include <iostream>
#include <iomanip>
#include "../shared/mnist.h"

int enzyme_dup;
int enzyme_dupnoneed;
int enzyme_out;
int enzyme_const;
using namespace std;

extern double __enzyme_autodiff(void*, ...);

int number_of_digits(double n) {
  int m;
  ostringstream strs;
  strs << n;
  string str = strs.str();
  m = str.size();
  return m;
}

void print_matrix(double *M, int n, int m){
  int max_len_per_column[n];

  for (int j = 0; j < m; j++){
    int max_len = 0;
    for (int i=0; i<n; i++){
      int num_length = number_of_digits(M[i + j * m]);
      if (num_length > max_len){
        max_len = num_length;
      }
    }
    max_len_per_column[j] = max_len;
  }
  for (int i=0;i<n;i++){
    std::cout << endl << std::setw(2) << "|" << std::setw(1);
    for (int j=0;j<m;j++){
      std::cout << std::setw(max_len_per_column[j]+1);
      std::cout << M[i + j * m];
      if(j==m-1) std::cout << std::setw(1)<< " |";
    }
  }

  std::cout << std::endl;
}


double random(double fMin, double fMax)
{
  double f = (double)rand() / RAND_MAX;
  return fMin + f * (fMax - fMin);
}

#include <iostream>
#include <vector>



double cross_entropy(double *output, int target){
  /*double value = 0.0;
  for(int i = 0 ; i < 10 ; i++ ){
    double test = target == i ? (1 - output[i]): output[i];
    value += test * test;
  }*/
  return -log(output[target]);
}

double relu(double x){
  return x>=0 ? x : 0.1 * x;
}

void softmax(double *input, double *output, int size){
  double sum = 0;

  double temp[10];

  for(int i = 0; i < size ; i++){
    double e = exp(input[i]);
    sum += e;
    temp[i] = e;
  }

  for(int i = 0; i < size ; i++){
    output[i] = temp[i] / sum;
  }
}

void fully_connected(double *input, double *output, double *weights, int input_size, int output_size){
  for(int i = 0 ; i < output_size ; i++){
    double value = 0;
    for(int j = 0 ; j < input_size; j++){
      double test = input[j] * weights[j + i * output_size];
      value += test;
    }

    output[i] = relu(value);
  }
}

void max_pooling(double *input, double *output, int size_x, int size_y, int size_z){
  for(int z_i = 0 ; z_i < size_z; z_i++) {
    double *data_z = &input[z_i * size_y * size_x];
    for (int x_i = 0; x_i <= size_x - 2; x_i += 2) {
      for(int y_i = 0 ; y_i <= size_y - 2; y_i += 2){

        int index = (z_i * size_y / 2 + y_i / 2 ) * size_x / 2 + x_i / 2;
        output[index]  = std::max(
          std::max(data_z[y_i * size_x + x_i], data_z[y_i * size_x + x_i + 1]),
          std::max(data_z[(y_i + 1) * size_x + x_i], data_z[(y_i + 1) * size_x + x_i + 1])
        );
      }
    }
  }
}

void conv_layer(double *input, double *output, double *weights, int kernel_size, int size_x, int size_y, int input_features, int output_features){

  int offset = (kernel_size - 1) / 2;

  for(int z_i = 0 ; z_i < output_features; z_i++){
    for(int x_i = 0 ; x_i < size_x - kernel_size; x_i++){
      for(int y_i = 0 ; y_i < size_y - kernel_size; y_i++){
        double value = 0;

        for(int feature_i = 0 ; feature_i < input_features ; feature_i++) {
          for (int offset_x = 0; offset_x < kernel_size; offset_x++) {
            for (int offset_y = 0; offset_y < kernel_size; offset_y++) {
              int data_index = feature_i * size_y * size_x + (y_i + offset_y) * size_x + x_i + offset_x;
              int weight_index = offset_x + (offset_y + feature_i * kernel_size) * kernel_size;
              value += input[data_index] * weights[weight_index];
            }
          }
        }

        output[(z_i * size_y + y_i + offset) * size_x + x_i + offset] = relu(value);
      }
    }
  }
}



void propagate(
    double *conv_weights_1,
    double *conv_weights_2,
    double *fully_connected_weights_1,
    double *fully_connected_weights_2,
    double *input,
    double *output){


  const int features1 = 8;
  const int features2 = 2;

  double conv_out_1[28 * 28 * features1]{0.0};
  double max_out_1[14 * 14 * features1]{0.0};
  double conv_out_2[14 * 14 * features2]{0.0};
  double max_out_2[7 * 7 * features2]{0.0};
  double fully_connected_out[256]{0.0};
  double fully_connected_2_out[10]{0.0};

  conv_layer(input, conv_out_1, conv_weights_1, 5, 28, 28, 1, features1);
  max_pooling(conv_out_1, max_out_1, 28, 28, features1);

  conv_layer(max_out_1, conv_out_2, conv_weights_2, 5, 14, 14, features1, features2);
  max_pooling(conv_out_2, max_out_2, 14, 14, features2);

  fully_connected(max_out_2, fully_connected_out, fully_connected_weights_1, 7 * 7 * features2, 256);
  fully_connected(fully_connected_out, fully_connected_2_out, fully_connected_weights_2, 256, 10);

  softmax(fully_connected_2_out, output, 10);
}

int argmax(double *output, int size){
  int max_index = 0;
  for(int i = 1 ; i < size; i++){
    if( output[max_index] < output[i] ){
      max_index = i;
    }
  }
  return max_index;
}

void loss_f(
              double *conv_weights_1,
              double *conv_weights_2,
              double *fully_connected_weights_1,
              double *fully_connected_weights_2,
              double *input,
              int target,
              double *err){
  double output[10];
  propagate(conv_weights_1, conv_weights_2, fully_connected_weights_1, fully_connected_weights_2, input, output);
  *err = cross_entropy(output, target);
}

int predict(
    double *conv_weights_1,
    double *conv_weights_2,
    double *fully_connected_weights_1,
    double *fully_connected_weights_2,
    double *input){
  double output[10];
  propagate(conv_weights_1, conv_weights_2, fully_connected_weights_1, fully_connected_weights_2, input, output);
  return argmax(output, 10);
}

#define BACKPROPAGATE

#ifdef BACKPROPAGATE
void backpropagate(
      double *conv_weights_1,
      double *conv_weights_2,
      double *fully_connected_weights_1,
      double *fully_connected_weights_2,
      double *input,
      int target,
      double *err,
      double *conv_weights_1_d,
      double *conv_weights_2_d,
      double *fully_connected_weights_1_d,
      double *fully_connected_weights_2_d){

    double err_d = 1.0;
    __enzyme_autodiff((void*) loss_f,
                    enzyme_dup,   conv_weights_1, conv_weights_1_d,
                    enzyme_dup,   conv_weights_2, conv_weights_2_d,
                    enzyme_dup,   fully_connected_weights_1, fully_connected_weights_1_d,
                    enzyme_dup,   fully_connected_weights_2, fully_connected_weights_2_d,
                    enzyme_const, input,
                    enzyme_const, target,
                    enzyme_dup,   err, &err_d);
}
#endif

void adamOptimizer(int epoch, int size, double *weights, double *J, double lr, double beta1, double beta2, double *m, double *v ) {
  double beta1Pow = pow(beta1, epoch);
  double beta2Pow = pow(beta2, epoch);

  for( int index = 0 ; index < size ; index++ ){
    m[index] = beta1 * m[index] + (1.0 - beta1) * J[index];
    v[index] = beta2 * v[index] + (1.0 - beta2) * J[index] * J[index];

    double mHat = m[index] / ( 1.0 - beta1Pow );
    double vHat = v[index] / ( 1.0 - beta2Pow );

    double offset = lr * mHat / ( sqrt( vHat ) + 1e-8 );

    weights[index] -= offset;
  }
}

int main(){
  int size_x = 28;
  int size_y = 28;
  int kernel_size = 5;

  vector<vector<double>> train_data;
  vector<int> labels_data;
  readMNIST(10000, 784, train_data, labels_data);

  int kernel_size_sqr = kernel_size * kernel_size;

  int convolution_size_1 = kernel_size_sqr * 8;
  int convolution_size_2 = kernel_size_sqr * 8 * 16;

  int fully_connected_size_1 = convolution_size_2 * 256;
  int fully_connected_size_2 = 256 * 10;

  int weight_size = convolution_size_1 +convolution_size_2 + fully_connected_size_1 + fully_connected_size_2;

  double *weights = new double[weight_size];
  double *derivatives = new double[weight_size]{0.0};
  double *m = new double[weight_size]{0.0};
  double *v = new double[weight_size]{0.0};

  for(int i = 0; i < weight_size; i++){
    weights[i] = random(-0.1, 0.1);
  }

  double *conv_weights_1 = weights;
  double *conv_weights_2 = conv_weights_1 + convolution_size_1;
  double *fully_connected_weights_1 = conv_weights_2 + convolution_size_2;
  double *fully_connected_weights_2 = fully_connected_weights_1 + fully_connected_size_1;

  double *conv_weights_1_d = derivatives;
  double *conv_weights_2_d = conv_weights_1_d + convolution_size_1;
  double *fully_connected_weights_1_d = conv_weights_2_d + convolution_size_2;
  double *fully_connected_weights_2_d = fully_connected_weights_1_d + fully_connected_size_1;

  double lr = 1e-4;

  double loss1;
  double output[10] {0.0};
  double err;

  int test_i = 3;

  loss_f(conv_weights_1,
         conv_weights_2,
         fully_connected_weights_1,
         fully_connected_weights_2,
         &train_data[test_i][0],
         labels_data[test_i],
         &err);

  std::cout << err << std::endl;
  double best = 0.0;
  int failed = 0;

  for(int epoch = 0; epoch < 70 ; epoch++){
    std::cout << "epoch" << epoch << std::endl;
    for(int j = 0 ; j < 9000 ; j++){
      double *input = &train_data[j][0];
      int label = labels_data[j];

#ifdef BACKPROPAGATE
      backpropagate(
          conv_weights_1,
          conv_weights_2,
          fully_connected_weights_1,
          fully_connected_weights_2,
          input,
          label,
          &loss1,
          conv_weights_1_d,
          conv_weights_2_d,
          fully_connected_weights_1_d,
          fully_connected_weights_2_d);
#endif

      adamOptimizer(epoch + 1, weight_size, weights, derivatives, lr, 0.9, 0.999, m, v);
      for(int i = 0 ; i < weight_size ; i++){
        //weights[i] -= lr * derivatives[i];
        derivatives[i] = 0.0;
      }
    }


    int match = 0;
    int non_match = 0;
    for(int j = 9000 ; j < 9000 + 100 ; j++){
      int index = predict(conv_weights_1,
                          conv_weights_2,
                          fully_connected_weights_1,
                          fully_connected_weights_2,
                          &train_data[j][0]);

      if(index ==  labels_data[j]){
        match++;
      }else{
        non_match++;
      }
    }

    double accuracy = (double)match / (match + non_match);
    std::cout << accuracy << std::endl;

    if(best < accuracy){
      std::ofstream file("weights2.bin", std::ios::binary);
      file.write((char*) weights, weight_size * sizeof(double));
      file.close();
      failed = 0;
      best = accuracy;
    }else{
      failed++;
      if(failed > 2){
        break;
      }
    }
  }

  for(int j = 0 ; j < 5 ; j++){
    std::cout << "######" << std::endl;
    std::cout << labels_data[j] << std::endl;
    std::cout << " " << std::endl;
    propagate(conv_weights_1, conv_weights_2, fully_connected_weights_1, fully_connected_weights_2, &train_data[j][0], output);

    for(int i = 0 ; i < 10 ; i++){
      std::cout << output[i] << std::endl;
    }
  }



  return 0;
}