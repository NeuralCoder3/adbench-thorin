SHELL := /bin/bash


cpp:
	source ../../project.sh && \
	clang++ main.cpp read.cpp gmm_d.cpp -O2 -o ../../build/cpp/gmm_manual

enzyme:
	mkdir -p ../build/cpp
	source ../../project.sh && \
	clang enzyme.cpp -S -emit-llvm -o ../build/cpp/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	clang read.cpp -S -emit-llvm -o ../build/cpp/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	opt ../build/cpp/enzyme_input.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ../build/cpp/enzyme_output.ll -S -enable-new-pm=0 && \
	llvm-as ../build/cpp/enzyme_output.ll -o ../build/cpp/enzyme_output.bc && \
	llvm-as ../build/cpp/read.ll -o ../build/cpp/read.bc && \
	clang++ ../build/cpp/enzyme_output.bc ../build/cpp/read.bc -O2 -o ../build/cpp/gmm_enzyme

run-enzyme:
	../build/cpp/gmm_enzyme ../benchmark/gmm/1k/gmm_d2_K5.txt
