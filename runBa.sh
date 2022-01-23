#!/bin/bash
. ../project.sh
mkdir -p build/ba
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../runtime/build/lib
clang -shared -undefined dynamic_lookup -o build/libadbench.so cpp/read.cpp cpp/ba_d.cpp cpp/ba.cpp &&
impala ba/ba.impala --emit-thorin -o build/ba/out &&
impala ba/ba.impala --emit-llvm -o build/ba/out &&
llvm-as build/ba/out.ll &&
clang -L../runtime/build/lib -Lbuild -lruntime -lm -ladbench ba/lib.c build/ba/out.bc -o build/ba/prog &&
./build/ba/prog
