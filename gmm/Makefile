SHELL := /bin/bash

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_GMM := ${BUILD}/gmm

NATIVE_MANUAL := native/
ENZYME_IMPALA := impala/enzyme/
ENZYME_NATIVE := enzyme/
NATIVE_IMPALA := impala/native/
ENZYME_IMPALA_BUILD := ${BUILD_GMM}/impala/enzyme
ENZYME_NATIVE_BUILD := ${BUILD_GMM}/enzyme
NATIVE_IMPALA_BUILD := ${BUILD_GMM}/impala/native
NATIVE_MANUAL_BUILD := ${BUILD_GMM}/manual

RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(RUN_ARGS):;@:)

LLVM_BIN := /Users/chris/CLionProjects/anydsl/llvm_install/bin/
ENZYME_LIB := ../../Enzyme2/enzyme/build/Enzyme/LLVMEnzyme-12.dylib
IMPALA_EXE := ../../impala/build/bin/impala
CC := clang++

build-native:
	source ../../project.sh
	mkdir -p ${NATIVE_MANUAL_BUILD}
	${CC} manual/main.cpp ${SHARED_ALL}/read.cpp ${SHARED}/gmm_d.cpp ${SHARED}/gmm.cpp -O2 -o ${NATIVE_MANUAL_BUILD}/gmm_manual

run-native:
	${NATIVE_MANUAL_BUILD}/gmm_manual $(RUN_ARGS)

native: build-native run-native

build-impala:
	mkdir -p ${NATIVE_IMPALA_BUILD}
	${IMPALA_EXE} ${NATIVE_IMPALA}/gmm.impala -autodiff --emit-llvm --emit-c-interface -o ${NATIVE_IMPALA_BUILD}/gmm_impala
	${LLVM_BIN}/llvm-as ${NATIVE_IMPALA_BUILD}/gmm_impala.ll
	${CC} -I/opt/homebrew/opt/openblas/include/ -L/opt/homebrew/opt/openblas/lib -lopenblas  -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/gmm_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/gmm_impala

run-impala:
	${NATIVE_IMPALA_BUILD}/gmm_impala $(RUN_ARGS)
# ../benchmark/ba/ba1_n49_m7776_p31843.txt

impala: build-impala run-impala

build-enzyme-impala:
	mkdir -p ${ENZYME_IMPALA_BUILD}
	${IMPALA_EXE} ${ENZYME_IMPALA}/gmm.impala -emit-llvm --emit-c-interface -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala
	${CC} ${ENZYME_IMPALA}/enzyme.cpp -S -emit-llvm -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala.ll
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/gmm_enzyme.ll
	${LLVM_BIN}/llvm-link ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala.bc ${ENZYME_IMPALA_BUILD}/gmm_enzyme.bc  -o ${ENZYME_IMPALA_BUILD}/bundle.bc
	${LLVM_BIN}/llvm-dis ${ENZYME_IMPALA_BUILD}/bundle.bc -o ${ENZYME_IMPALA_BUILD}/bundle.ll
	${LLVM_BIN}/opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enable-new-pm=0
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/out.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme

test:
	${LLVM_BIN}/opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enable-new-pm=0
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/out.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme

run-enzyme-impala:
	${ENZYME_IMPALA_BUILD}/gmm_enzyme $(RUN_ARGS)

build-enzyme-native:
	mkdir -p ${ENZYME_NATIVE_BUILD}
	${CC} ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${CC} ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${CC} ${SHARED}/gmm.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/gmm.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_input.ll
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/gmm.ll -o ${ENZYME_NATIVE_BUILD}/gmm.bc
	${LLVM_BIN}/llvm-link ${ENZYME_NATIVE_BUILD}/enzyme_input.bc ${ENZYME_NATIVE_BUILD}/gmm.bc  -o ${ENZYME_NATIVE_BUILD}/bundle.bc
	${LLVM_BIN}/llvm-dis ${ENZYME_NATIVE_BUILD}/bundle.bc -o ${ENZYME_NATIVE_BUILD}/bundle.ll
	${LLVM_BIN}/opt ${ENZYME_NATIVE_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/read.ll -o ${ENZYME_NATIVE_BUILD}/read.bc
	${CC} ${ENZYME_NATIVE_BUILD}/enzyme_output.bc ${ENZYME_NATIVE_BUILD}/read.bc -O2 -o ${ENZYME_NATIVE_BUILD}/gmm_enzyme

run-enzyme-native:
	${ENZYME_NATIVE_BUILD}/gmm_enzyme $(RUN_ARGS)

enzyme: build-enzyme run-enzyme

all: build-native build-impala build-enzyme-impala build-enzyme-native