makeSHELL := /bin/bash

RUNTIME := /opt/homebrew/Cellar/bdw-gc/8.0.6/lib

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

LLVM_BIN := /Users/chris/CLionProjects/anydsl/llvm_install/bin/
ENZYME_LIB := ../../Enzyme2/enzyme/build/Enzyme/LLVMEnzyme-12.dylib


LLVM_BIN := /opt/homebrew/Cellar/llvm/15.0.3/bin
ENZYME_LIB := /opt/homebrew/Cellar/enzyme/0.0.45/lib/LLVMEnzyme-15.dylib

IMPALA_EXE := ../../impala/build/bin/impala
CC := clang++

RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(RUN_ARGS):;@:)

build:
	mkdir -p ${ENZYME_NATIVE_BUILD}
	${CC} ${ENZYME_NATIVE}/network.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${LLVM_BIN}/opt ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -load=${ENZYME_LIB} -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enzyme-preopt=0 -enable-new-pm=0
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc
	${CC} ${SHARED}/mnist.cpp ${ENZYME_NATIVE_BUILD}/enzyme_output.bc -O3 -o ${ENZYME_NATIVE_BUILD}/nn_enzyme

build-enzyme-impala:
	mkdir -p ${ENZYME_IMPALA_BUILD}
	${IMPALA_EXE} ${ENZYME_IMPALA}/nn.impala -emit-c-interface -emit-thorin  -log-level error -emit-llvm -emit-c-interface -o ${ENZYME_IMPALA_BUILD}/nn_impala

run:
	${ENZYME_NATIVE_BUILD}/nn_enzyme

all: build-impala run-impala

build-impala:
	mkdir -p ${NATIVE_IMPALA_BUILD}
	${IMPALA_EXE} ${NATIVE_IMPALA}/nn.impala -autodiff --emit-llvm --emit-c-interface -o ${NATIVE_IMPALA_BUILD}/nn_impala
	${LLVM_BIN}/llvm-as ${NATIVE_IMPALA_BUILD}/nn_impala.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${SHARED}/mnist.cpp ${NATIVE_IMPALA_BUILD}/nn_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/nn_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME}
	${NATIVE_IMPALA_BUILD}/nn_impala $(RUN_ARGS)

build-enzyme-impala:
	mkdir -p ${ENZYME_IMPALA_BUILD}
	${IMPALA_EXE} ${ENZYME_IMPALA}/nn.impala -autodiff --emit-llvm --emit-c-interface -o ${ENZYME_IMPALA_BUILD}/nn_enzyme_impala
	${CC} ${ENZYME_IMPALA}/nn.cpp -S -emit-llvm -o ${ENZYME_IMPALA_BUILD}/nn_enzyme.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/nn_enzyme_impala.ll
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/nn_enzyme.ll
	${LLVM_BIN}/llvm-link ${ENZYME_IMPALA_BUILD}/nn_enzyme_impala.bc ${ENZYME_IMPALA_BUILD}/nn_enzyme.bc  -o ${ENZYME_IMPALA_BUILD}/bundle.bc
	${LLVM_BIN}/llvm-dis ${ENZYME_IMPALA_BUILD}/bundle.bc -o ${ENZYME_IMPALA_BUILD}/bundle.ll
	${LLVM_BIN}/opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -O2 -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enzyme-preopt=0 -enable-new-pm=0
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/out.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${SHARED}/mnist.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/nn_enzyme

build-enzyme-native:
	mkdir -p ${ENZYME_NATIVE_BUILD}
	${LLVM_BIN}/${CC} ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -ffast-math -fno-unroll-loops -Xclang -no-opaque-pointers
	${LLVM_BIN}/${CC} ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -Xclang -no-opaque-pointers
	${LLVM_BIN}/${CC} ${SHARED_ALL}/lib.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/lib.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops -Xclang -no-opaque-pointers
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_input.ll
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/lib.ll -o ${ENZYME_NATIVE_BUILD}/lib.bc
	${LLVM_BIN}/llvm-link ${ENZYME_NATIVE_BUILD}/enzyme_input.bc  ${ENZYME_NATIVE_BUILD}/lib.bc -o ${ENZYME_NATIVE_BUILD}/bundle.bc
	${LLVM_BIN}/llvm-dis ${ENZYME_NATIVE_BUILD}/bundle.bc -o ${ENZYME_NATIVE_BUILD}/bundle.ll
	${LLVM_BIN}/opt ${ENZYME_NATIVE_BUILD}/bundle.ll -load=${ENZYME_LIB}  -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 -enzyme-inline=1
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/read.ll -o ${ENZYME_NATIVE_BUILD}/read.bc
	${LLVM_BIN}/${CC} ${ENZYME_NATIVE_BUILD}/enzyme_output.bc ${ENZYME_NATIVE_BUILD}/read.bc -O3 -o ${ENZYME_NATIVE_BUILD}/nn_enzyme

run-enzyme-native:
	${ENZYME_NATIVE_BUILD}/nn_enzyme $(RUN_ARGS)

run-enzyme-impala:
	${ENZYME_IMPALA_BUILD}/nn_enzyme  $(RUN_ARGS)