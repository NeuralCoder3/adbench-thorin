. ../project.sh
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../runtime/build/lib
impala gmm.impala --emit-thorin -o out &&
impala gmm.impala --emit-llvm -o out &&
llvm-as out.ll &&
clang -L../runtime/build/lib -lruntime -lm lib.c out.bc -o prog &&
./prog
