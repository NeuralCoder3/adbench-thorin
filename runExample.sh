#!/bin/bash
. ../project.sh
mkdir -p build/examples
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../runtime/build/lib
clang -shared -undefined dynamic_lookup -o build/libadbench.so cpp/read.cpp cpp/gmm_d.cpp &&
impala examples/example.impala --emit-llvm -o build/examples/out &&
llvm-as build/examples/out.ll &&
clang -L../runtime/build/lib -Lbuild -lruntime -lm -ladbench examples/lib.c build/examples/out.bc -o build/examples/prog &&
./build/examples/prog
