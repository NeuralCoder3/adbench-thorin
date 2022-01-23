#!/bin/bash
. ../project.sh
mkdir -p build/gmm
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../runtime/build/lib
impala gmm/gmm.impala --emit-thorin -o build/gmm/out &&
impala gmm/gmm.impala --emit-llvm -o build/gmm/out &&
llvm-as build/gmm/out.ll &&
clang -L../runtime/build/lib -lruntime -lm gmm/lib.c build/gmm/out.bc -o build/gmm/prog &&
./build/gmm/prog
