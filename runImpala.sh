#!/bin/bash
. ../project.sh
mkdir -p build/impala
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../runtime/build/lib
impala impala/gmm.impala --emit-thorin -o build/impala/out &&
impala impala/gmm.impala --emit-llvm -o build/impala/out &&
llvm-as build/impala/out.ll &&
clang -L../runtime/build/lib -lruntime -lm impala/lib.c build/impala/out.bc -o build/impala/prog &&
./build/impala/prog
