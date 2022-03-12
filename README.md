
There are 4 differentiation tests.
* Gaussian Mixture Models (GMM)
* Bundle Assignment (BA)
* Natural Language Processing (LSTM)
* Neuronal Network for MNIST (NN)

Tests are written for 

* **Hand crafted cpp**
* **Enzyme**
  * **with Cpp implementation** \
    Function implemented in CPP and differentiated by LLVM
  * **with Impala implentation** \
    Function implemented in Impala and differentiated by Impala
* **Impala** \
  Code written and differentiated in Impala


```
build-native #Build manual implementation
run-native #Run manual with first test instance

build-impala #Build impala implementation
run-impala #Run impala with first test instance

build-enzyme-impala #Build enzyme impala implementation
run-enzyme-impala #Run enzyme impala with first test instance

build-enzyme-native #Build enzyme implementation
run-enzyme-native #Run enzyme with first test instance
```