SHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

build-impala:
	source ../../project.sh && \
	mkdir -p ../build/gmm && \
	impala gmm.impala --emit-llvm --emit-c-interface -o ../build/gmm/gmm_impala -O0&& \
	llvm-as ../build/gmm/gmm_impala.ll && \
	clang++ -L${RUNTIME} -lruntime -lm ../cpp/lib.cpp ../cpp/read.cpp ../build/gmm/gmm_impala.bc -O3 -o ../build/gmm/gmm_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	../build/gmm/gmm_impala ../benchmark/gmm/1k/gmm_d2_K5.txt

build-enzyme:
	source ../../project.sh && \
	mkdir -p ../build/gmm && \
	impala gmm_enzyme.impala --emit-llvm -O0 --emit-c-interface -o ../build/gmm/gmm_enzyme_impala -Othorin && \
	clang++ enzyme.cpp -S -emit-llvm -o ../build/gmm/gmm_enzyme.ll -O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	llvm-as ../build/gmm/gmm_enzyme_impala.ll && \
	llvm-as ../build/gmm/gmm_enzyme.ll && \
	llvm-link ../build/gmm/gmm_enzyme_impala.bc ../build/gmm/gmm_enzyme.bc  -o ../build/gmm/bundle.bc && \
	llvm-dis ../build/gmm/bundle.bc -o ../build/gmm/bundle.ll && \
	opt ../build/gmm/bundle.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ../build/gmm/out.ll -S -enable-new-pm=0 && \
	llvm-as ../build/gmm/out.ll && \
	clang++ -lm ../cpp/lib.cpp ../cpp/read.cpp ../build/gmm/out.bc -O3 -o ../build/gmm/gmm_enzyme


run-enzyme:
	../build/gmm/gmm_enzyme ../benchmark/gmm/1k/gmm_d2_K5.txt
