#!/bin/bash
mkdir -p build/cpp

clang cpp/example.cpp -S -emit-llvm -o build/cpp/example.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops &&

/opt/homebrew/Cellar/llvm/13.0.0_2/bin/opt build/cpp/example.ll -load=/opt/homebrew/Cellar/enzyme/0.0.26/lib/LLVMEnzyme-13.dylib -enzyme -o build/cpp/example_out.ll -S -enable-new-pm=0 &&

llvm-as build/cpp/example_out.ll -o build/cpp/example.bc &&

clang build/cpp/example.bc -o build/cpp/example &&
./build/cpp/example
#make
#cd ../../
#./build/cpp/main
