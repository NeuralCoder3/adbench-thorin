SHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_lstm := ${BUILD}/lstm

NATIVE_MANUAL := native/
ENZYME_IMPALA := impala/enzyme/
ENZYME_NATIVE := enzyme/
NATIVE_IMPALA := impala/native/
ENZYME_IMPALA_BUILD := ${BUILD_lstm}/impala/enzyme
ENZYME_NATIVE_BUILD := ${BUILD_lstm}/enzyme
NATIVE_IMPALA_BUILD := ${BUILD_lstm}/impala/native
NATIVE_MANUAL_BUILD := ${BUILD_lstm}/manual

NATIVE_MANUAL_BUILD_CPP := ${SHARED_ALL}/read.cpp ${SHARED}/lstm.cpp ./manual/main.cpp ./manual/lstm_d.cpp

setup-ubuntu:
	sudo ldconfig ${RUNTIME}

build:
	mkdir -p ${ENZYME_NATIVE_BUILD} && \
	source ../../project.sh && \
	clang++ ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	opt ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 && \
	llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc && \
	clang++  ${SHARED_ALL}/read.cpp  ${ENZYME_NATIVE_BUILD}/enzyme_output.bc -O0 -o ${ENZYME_NATIVE_BUILD}/lstm_enzyme

run:
	${ENZYME_NATIVE_BUILD}/lstm_enzyme ../benchmark/lstm/lstm_l2_c1024.txt


build-native:
	source ../../project.sh && \
	mkdir -p ${NATIVE_MANUAL_BUILD} && \
	clang++ ${NATIVE_MANUAL_BUILD_CPP} -O2 -std=c++11  -o ${NATIVE_MANUAL_BUILD}/lstm_manual

run-native:
	${NATIVE_MANUAL_BUILD}/lstm_manual ../benchmark/lstm/lstm_l2_c1024.txt

native: build-native run-native

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	source ../../project.sh && \
	mkdir -p ${NATIVE_IMPALA_BUILD} && \
	impala ${NATIVE_IMPALA}/lstm.impala -emit-llvm --emit-c-interface -o ${NATIVE_IMPALA_BUILD}/lstm_impala && \
	/opt/homebrew/opt/llvm/bin/llvm-as ${NATIVE_IMPALA_BUILD}/lstm_impala.ll && \
	/opt/homebrew/opt/llvm/bin/clang++ -L${RUNTIME} -lruntime -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/lstm_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/lstm_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	${NATIVE_IMPALA_BUILD}/lstm_impala ../benchmark/lstm/lstm_l2_c1024.txt

impala: build-impala run-impala

build-enzyme-impala:
	source ../../project.sh && \
	mkdir -p ${ENZYME_IMPALA_BUILD} && \
	impala ${ENZYME_IMPALA}/lstm.impala --emit-llvm -O0 --emit-c-interface -o ${ENZYME_IMPALA_BUILD}/lstm_enzyme_impala -Othorin && \
	clang++ ${ENZYME_IMPALA}/enzyme.cpp -S -emit-llvm -o ${ENZYME_IMPALA_BUILD}/lstm_enzyme.ll -O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	llvm-as ${ENZYME_IMPALA_BUILD}/lstm_enzyme_impala.ll && \
	llvm-as ${ENZYME_IMPALA_BUILD}/lstm_enzyme.ll && \
	llvm-link ${ENZYME_IMPALA_BUILD}/lstm_enzyme_impala.bc ${ENZYME_IMPALA_BUILD}/lstm_enzyme.bc  -o ${ENZYME_IMPALA_BUILD}/bundle.bc && \
	llvm-dis ${ENZYME_IMPALA_BUILD}/bundle.bc -o ${ENZYME_IMPALA_BUILD}/bundle.ll && \
	opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enable-new-pm=0 && \
	llvm-as ${ENZYME_IMPALA_BUILD}/out.ll && \
	clang++ -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/lstm_enzyme


run-enzyme-impala:
	${ENZYME_IMPALA_BUILD}/lstm_enzyme ../benchmark/lstm/1k/lstm_d2_K5.txt

build-enzyme-native:
	mkdir -p ${ENZYME_NATIVE_BUILD} && \
	source ../../project.sh && \
	clang ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	clang ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	clang ${SHARED}/lstm.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/lstm.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_input.ll && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_NATIVE_BUILD}/lstm.ll -o ${ENZYME_NATIVE_BUILD}/lstm.bc && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-link ${ENZYME_NATIVE_BUILD}/enzyme_input.bc ${ENZYME_NATIVE_BUILD}/lstm.bc  -o ${ENZYME_NATIVE_BUILD}/bundle.bc && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-dis ${ENZYME_NATIVE_BUILD}/bundle.bc -o ${ENZYME_NATIVE_BUILD}/bundle.ll && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/opt ${ENZYME_NATIVE_BUILD}/bundle.ll -load=../../Enzyme2/enzyme/build/Enzyme/LLVMEnzyme-12.dylib -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_NATIVE_BUILD}/read.ll -o ${ENZYME_NATIVE_BUILD}/read.bc && \
	clang++ ${ENZYME_NATIVE_BUILD}/enzyme_output.bc ${ENZYME_NATIVE_BUILD}/read.bc -O2 -o ${ENZYME_NATIVE_BUILD}/lstm_enzyme

run-enzyme-native:
	${ENZYME_NATIVE_BUILD}/lstm_enzyme ../benchmark/lstm/lstm_l2_c1024.txt


enzyme: build-enzyme run-enzyme

all: build-native build-impala build-enzyme-impala build-enzyme-native