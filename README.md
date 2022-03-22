
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

# Using Neuronal Network Benchmark:

### Train
Each epoch weights are saved to given weight file.
Training stops if max epochs are reached or 3 times a row no improvement in test acurracy is reached.

### Eval 
Calculates accuracy of given weights file.

### Test
Classify one sample with weights of given file.
Use --sample to pick one sample of 10000

### Using

```

--file , -f       weights file
--sample          sample for test mode [0 - 10000]
--train           train mode 
--eval            eval mode
--test            test mode
--epoch           max epoch count
--train-size      training samples [0 - 9000] default 9000
--test-size       training samples [0 - 1000] default 1000

```

### Examples

```
cd nn
make build

#calculate accuracy:
$ ../build/nn/enzyme/nn_enzyme -f weightsSaved.bin --eval
git p
weights: weightsSaved.bin
accuracy: 0.9222

$ ../build/nn/enzyme/nn_enzyme -f weightsSaved.bin --test --sample 9

weights: weightsSaved.bin
                            
                            
                            
                            
                            
            ############    
        ################    
       ################     
       ###########          
        ####### ##          
         #####              
           ####             
           ####             
            ######          
             ######         
              ######        
               #####        
                 ####       
              #######       
            ########        
          #########         
        ##########          
      ##########            
    ##########              
    ########                
                            
                            
                            
solution: 5
prediction: 5

8.76542e-05
6.55587e-05
0.00057456
0.0230654
4.27149e-05
0.975758
6.89789e-05
0.000114778
0.000149279
7.29924e-05



$ ../build/nn/enzyme/nn_enzyme -f weightsOutput.bin --train

weights: weightsOutput.bin
2.30243
epoch0
0.846
epoch1
...


```