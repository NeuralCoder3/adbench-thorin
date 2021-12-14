. ../project.sh
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../runtime/build/lib
impala impala/gmm.impala --emit-thorin -o build/out &&
impala impala/gmm.impala --emit-llvm -o build/out &&
llvm-as build/out.ll &&
clang -L../runtime/build/lib -lruntime -lm impala/lib.c build/out.bc -o build/prog &&
./build/prog
