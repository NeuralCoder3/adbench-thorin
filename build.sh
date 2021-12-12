. ../project.sh
impala test.impala --emit-thorin -o out &&
impala test.impala --emit-llvm -o out &&
llvm-as out.ll &&
clang -L. -lruntime -lm lib.c out.bc -o prog &&
./prog
