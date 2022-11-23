
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
#Manual implementation
  build-native 
  run-native 

#Impala Autodiff
  build-impala 
  run-impala 

#Enzyme Autodiff on impala llvm code
  build-enzyme-impala
  run-enzyme-impala 

#Enzyme Autodiff on c llvm code
  build-enzyme-native 
  run-enzyme-native
```