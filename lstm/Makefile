SHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_ba := ${BUILD}/lstm

NATIVE_MANUAL := native/
ENZYME_IMPALA := impala/enzyme/
ENZYME_NATIVE := enzyme/
NATIVE_IMPALA := impala/native/
ENZYME_IMPALA_BUILD := ${BUILD_ba}/impala/enzyme
ENZYME_NATIVE_BUILD := ${BUILD_ba}/enzyme
NATIVE_IMPALA_BUILD := ${BUILD_ba}/impala/native
NATIVE_MANUAL_BUILD := ${BUILD_ba}/manual

setup-ubuntu:
	sudo ldconfig ${RUNTIME}

build:
	mkdir -p ${ENZYME_NATIVE_BUILD} && \
	source ../../project.sh && \
	clang++ ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	opt ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 && \
	llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc && \
	clang++  ${SHARED_ALL}/read.cpp  ${ENZYME_NATIVE_BUILD}/enzyme_output.bc -O0 -o ${ENZYME_NATIVE_BUILD}/ba_enzyme

run:
	${ENZYME_NATIVE_BUILD}/ba_enzyme ../benchmark/lstm/lstm_l2_c1024.txt


build-native:
	source ../../project.sh && \
	mkdir -p ${NATIVE_MANUAL_BUILD} && \
	clang++ manual/main.cpp ${SHARED_ALL}/read.cpp ${SHARED}/ba_d.cpp ${SHARED}/ba.cpp -O2 -o ${NATIVE_MANUAL_BUILD}/ba_manual

run-native:
	${NATIVE_MANUAL_BUILD}/ba_manual ../benchmark/lstm/lstm_l2_c1024.txt

native: build-native run-native

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	source ../../project.sh && \
	mkdir -p ${NATIVE_IMPALA_BUILD} && \
	impala ${NATIVE_IMPALA}/ba.impala --emit-llvm --emit-c-interface -o ${NATIVE_IMPALA_BUILD}/ba_impala -O0 && \
	llvm-as ${NATIVE_IMPALA_BUILD}/ba_impala.ll && \
	clang++ -L${RUNTIME} -lruntime -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/ba_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/ba_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	${NATIVE_IMPALA_BUILD}/ba_impala ../benchmark/lstm/lstm_l2_c1024.txt

impala: build-impala run-impala

build-enzyme-impala:
	source ../../project.sh && \
	mkdir -p ${ENZYME_IMPALA_BUILD} && \
	impala ${ENZYME_IMPALA}/ba.impala --emit-llvm -O0 --emit-c-interface -o ${ENZYME_IMPALA_BUILD}/ba_enzyme_impala -Othorin && \
	clang++ ${ENZYME_IMPALA}/enzyme.cpp -S -emit-llvm -o ${ENZYME_IMPALA_BUILD}/ba_enzyme.ll -O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	llvm-as ${ENZYME_IMPALA_BUILD}/ba_enzyme_impala.ll && \
	llvm-as ${ENZYME_IMPALA_BUILD}/ba_enzyme.ll && \
	llvm-link ${ENZYME_IMPALA_BUILD}/ba_enzyme_impala.bc ${ENZYME_IMPALA_BUILD}/ba_enzyme.bc  -o ${ENZYME_IMPALA_BUILD}/bundle.bc && \
	llvm-dis ${ENZYME_IMPALA_BUILD}/bundle.bc -o ${ENZYME_IMPALA_BUILD}/bundle.ll && \
	opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enable-new-pm=0 && \
	llvm-as ${ENZYME_IMPALA_BUILD}/out.ll && \
	clang++ -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/ba_enzyme


run-enzyme-impala:
	${ENZYME_IMPALA_BUILD}/ba_enzyme ../benchmark/ba/1k/ba_d2_K5.txt

build-enzyme-native:
	mkdir -p ${ENZYME_NATIVE_BUILD} && \
	source ../../project.sh && \
	clang ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	clang ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	clang ${SHARED}/ba.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/ba.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_input.ll && \
	llvm-as ${ENZYME_NATIVE_BUILD}/ba.ll -o ${ENZYME_NATIVE_BUILD}/ba.bc && \
	llvm-link ${ENZYME_NATIVE_BUILD}/enzyme_input.bc ${ENZYME_NATIVE_BUILD}/ba.bc  -o ${ENZYME_NATIVE_BUILD}/bundle.bc && \
	llvm-dis ${ENZYME_NATIVE_BUILD}/bundle.bc -o ${ENZYME_NATIVE_BUILD}/bundle.ll && \
	opt ${ENZYME_NATIVE_BUILD}/bundle.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 && \
	llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc && \
	llvm-as ${ENZYME_NATIVE_BUILD}/read.ll -o ${ENZYME_NATIVE_BUILD}/read.bc && \
	clang++ ${ENZYME_NATIVE_BUILD}/enzyme_output.bc ${ENZYME_NATIVE_BUILD}/read.bc -O2 -o ${ENZYME_NATIVE_BUILD}/ba_enzyme

run-enzyme-native:
	${ENZYME_NATIVE_BUILD}/ba_enzyme ../benchmark/ba/1k/ba_d2_K5.txt


enzyme: build-enzyme run-enzyme

all: build-native build-impala build-enzyme-impala build-enzyme-native