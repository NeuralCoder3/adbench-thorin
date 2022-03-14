
There are 4 differentiation tests:
* Gaussian Mixture Models (GMM)
* Bundle Assignment (BA)
* Natural Language Processing (LSTM)
* Neuronal Network for MNIST (NN)

For each tests are different implementations present: 

* **Hand crafted cpp**
* **Enzyme**
  * **with Cpp implementation** \
    Function implemented in CPP and differentiated by LLVM
  * **with Impala implentation** \
    Function implemented in Impala and differentiated by Impala
* **Impala** \
  Code written and differentiated in Impala

Setup:

Clone impala-adbench project to anydsl folder.
https://github.com/AnyDSL/anydsl

According to the README setup and build anydsl environment.

Additional for using enzyme clone enzyme inside anydsl folder and build it.
https://github.com/EnzymeAD/Enzyme

In each folder (gmm, ba, lstm, nn) are these make targets:
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