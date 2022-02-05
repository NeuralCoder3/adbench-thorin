#!/bin/bash
mkdir -p build/cpp
. ../project.sh

clang cpp/enzyme.cpp -S -emit-llvm -o build/cpp/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
clang cpp/read.cpp -S -emit-llvm -o build/cpp/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops

/opt/homebrew/Cellar/llvm/13.0.0_2/bin/opt build/cpp/enzyme_input.ll -load=/opt/homebrew/Cellar/enzyme/0.0.26/lib/LLVMEnzyme-13.dylib -enzyme -o build/cpp/enzyme_output.ll -S -enable-new-pm=0

llvm-as build/cpp/enzyme_output.ll -o build/cpp/enzyme_output.bc
llvm-as build/cpp/read.ll -o build/cpp/read.bc

clang++ build/cpp/enzyme_output.bc build/cpp/read.bc -O2 -o build/cpp/enzyme
./build/cpp/enzyme
#make
#cd ../../
#./build/cpp/main
