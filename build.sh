. ../project.sh
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../runtime/build/lib
impala test.impala --emit-thorin -o out &&
impala test.impala --emit-llvm -o out &&
llvm-as out.ll &&
clang -L../runtime/build/lib -lruntime -lm lib.c out.bc -o prog &&
./prog
