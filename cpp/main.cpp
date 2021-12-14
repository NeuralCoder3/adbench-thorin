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
  printf("%lf", error);
  return 0;
}