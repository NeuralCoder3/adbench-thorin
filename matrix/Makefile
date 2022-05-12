makeSHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_MATRIX := ${BUILD}/matrix

NATIVE_IMPALA := impala/
NATIVE_IMPALA_BUILD := ${BUILD_MATRIX}

all: build-impala run-impala

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	source ../../project.sh && \
	mkdir -p ${NATIVE_IMPALA_BUILD} && \
	impala ${NATIVE_IMPALA}/matrix.impala -emit-c-interface -emit-thorin  -log-level error -emit-llvm -emit-c-interface -o ${NATIVE_IMPALA_BUILD}/matrix_impala&& \
	llvm-as ${NATIVE_IMPALA_BUILD}/matrix_impala.ll && \
	clang++ -L${RUNTIME} -lruntime -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/matrix_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/matrix_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	${NATIVE_IMPALA_BUILD}/matrix_impala