makeSHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_NN := ${BUILD}/nn

NATIVE_MANUAL := native/
ENZYME_IMPALA := impala/enzyme/
ENZYME_NATIVE := enzyme/
NATIVE_IMPALA := impala/native/
ENZYME_IMPALA_BUILD := ${BUILD_NN}/impala/enzyme
ENZYME_NATIVE_BUILD := ${BUILD_NN}/enzyme
NATIVE_IMPALA_BUILD := ${BUILD_NN}/impala/native
NATIVE_MANUAL_BUILD := ${BUILD_NN}/manual

build:
	mkdir -p ${ENZYME_NATIVE_BUILD} && \
	source ../../project.sh && \
	clang++ ${ENZYME_NATIVE}/network.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	opt ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 && \
	llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc && \
	clang++ ${SHARED}/mnist.cpp ${ENZYME_NATIVE_BUILD}/enzyme_output.bc -O0 -o ${ENZYME_NATIVE_BUILD}/nn_enzyme

build-enzyme-impala:
	mkdir -p ${ENZYME_IMPALA_BUILD} && \
	source ../../project.sh && \
	impala ${ENZYME_IMPALA}/nn.impala -emit-c-interface -emit-thorin  -log-level error -emit-llvm -emit-c-interface -o ${ENZYME_IMPALA_BUILD}/nn_impala


run:
	${ENZYME_NATIVE_BUILD}/nn_enzyme

all: build-impala run-impala

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	source ../../project.sh && \
	mkdir -p ${NATIVE_IMPALA_BUILD} && \
	impala ${NATIVE_IMPALA}/nn.impala -emit-c-interface -emit-thorin  -log-level error -emit-llvm -emit-c-interface -o ${NATIVE_IMPALA_BUILD}/nn_impala&& \
	llvm-as ${NATIVE_IMPALA_BUILD}/nn_impala.ll && \
	clang++ -L${RUNTIME} -lruntime -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${SHARED}/mnist.cpp ${NATIVE_IMPALA_BUILD}/nn_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/nn_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	${NATIVE_IMPALA_BUILD}/nn_impala xx