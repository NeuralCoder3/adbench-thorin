
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
  make build-native 
  make run-native 

#Impala Autodiff
  make build-impala 
  make run-impala 

#Enzyme Autodiff on impala llvm code
  make build-enzyme-impala
  make run-enzyme-impala 

#Enzyme Autodiff on c llvm code
  make build-enzyme-native 
  make run-enzyme-native
```

You can call the run commands with different benchmarks:
```
#NN
  make run-<...> <input-size> <hidden-size> <output-size> [0|1 : disable or enable gradient print out]
  make run-<...> 4 4 2 1
  
#GMM
  make run-<...> <path-to-gmm-benchmark>
  make run-<...> ../benchmark/gmm/1k/gmm_d2_K5.txt
  
#BA
  make run-<...> <path-to-ba-benchmark>
  make run-<...> ../benchmark/ba/ba1_n49_m7776_p31843.txt
  
#LSTM
  make run-<...> <path-to-lstm-benchmark>
  make run-<...> ../benchmark/lstm/lstm_l2_c1024.txt
  
```
