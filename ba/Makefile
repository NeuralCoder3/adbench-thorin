SHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_BA := ${BUILD}/ba

NATIVE_MANUAL := native/
ENZYME_IMPALA := impala/enzyme/
ENZYME_NATIVE := enzyme/
NATIVE_IMPALA := impala/native/
ENZYME_IMPALA_BUILD := ${BUILD_BA}/impala/enzyme
ENZYME_NATIVE_BUILD := ${BUILD_BA}/enzyme
NATIVE_IMPALA_BUILD := ${BUILD_BA}/impala/native
NATIVE_MANUAL_BUILD := ${BUILD_BA}/manual

RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(RUN_ARGS):;@:)

LLVM_BIN := /Users/chris/CLionProjects/anydsl/llvm_install/bin/
ENZYME_LIB := ../../Enzyme2/enzyme/build/Enzyme/LLVMEnzyme-12.dylib
IMPALA_EXE := ../../impala/build/bin/impala
CC := clang++

build:
	mkdir -p ${ENZYME_NATIVE_BUILD} 
	${CC} ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	opt ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc
	${CC}  ${SHARED_ALL}/read.cpp  ${ENZYME_NATIVE_BUILD}/enzyme_output.bc -O0 -o ${ENZYME_NATIVE_BUILD}/ba_enzyme

run:
	${ENZYME_NATIVE_BUILD}/ba_enzyme $(RUN_ARGS)
#../benchmark/ba/ba1_n49_m7776_p31843.txt

build-native:
	mkdir -p ${NATIVE_MANUAL_BUILD}
	${CC} manual/main.cpp ${SHARED_ALL}/read.cpp ${SHARED}/ba_d.cpp ${SHARED}/ba.cpp -O2 -o ${NATIVE_MANUAL_BUILD}/ba_manual

run-native:
	${NATIVE_MANUAL_BUILD}/ba_manual $(RUN_ARGS)

native: build-native run-native

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} 
	mkdir -p ${NATIVE_IMPALA_BUILD}
	${IMPALA_EXE} ${NATIVE_IMPALA}/ba.impala -autodiff --emit-llvm --emit-c-interface -o ${NATIVE_IMPALA_BUILD}/ba_impala
	${LLVM_BIN}/llvm-as ${NATIVE_IMPALA_BUILD}/ba_impala.ll
	${CC} -L${RUNTIME} -lruntime -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/ba_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/ba_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} 
	${NATIVE_IMPALA_BUILD}/ba_impala $(RUN_ARGS)

impala: build-impala run-impala

build-enzyme-impala:
	mkdir -p ${ENZYME_IMPALA_BUILD}
	${IMPALA_EXE} ${ENZYME_IMPALA}/ba.impala --emit-llvm -O0 --emit-c-interface -o ${ENZYME_IMPALA_BUILD}/ba_enzyme_impala -Othorin
	${CC} ${ENZYME_IMPALA}/enzyme.cpp -S -emit-llvm -o ${ENZYME_IMPALA_BUILD}/ba_enzyme.ll -O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops 
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/ba_enzyme_impala.ll
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/ba_enzyme.ll
	${LLVM_BIN}/llvm-link ${ENZYME_IMPALA_BUILD}/ba_enzyme_impala.bc ${ENZYME_IMPALA_BUILD}/ba_enzyme.bc  -o ${ENZYME_IMPALA_BUILD}/bundle.bc
	${LLVM_BIN}/llvm-dis ${ENZYME_IMPALA_BUILD}/bundle.bc -o ${ENZYME_IMPALA_BUILD}/bundle.ll
	${LLVM_BIN}/opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enable-new-pm=0
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/out.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/ba_enzyme


run-enzyme-impala:
	${ENZYME_IMPALA_BUILD}/ba_enzyme $(RUN_ARGS)

build-enzyme-native:
	mkdir -p ${ENZYME_NATIVE_BUILD} 
	${CC} ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${CC} ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops 
	${CC} ${SHARED}/ba.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/ba.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops 
	${LLVM_BIN}llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_input.ll 
	${LLVM_BIN}llvm-as ${ENZYME_NATIVE_BUILD}/ba.ll -o ${ENZYME_NATIVE_BUILD}/ba.bc 
	${LLVM_BIN}llvm-link ${ENZYME_NATIVE_BUILD}/enzyme_input.bc ${ENZYME_NATIVE_BUILD}/ba.bc  -o ${ENZYME_NATIVE_BUILD}/bundle.bc 
	${LLVM_BIN}llvm-dis ${ENZYME_NATIVE_BUILD}/bundle.bc -o ${ENZYME_NATIVE_BUILD}/bundle.ll 
	${LLVM_BIN}opt ${ENZYME_NATIVE_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 
	${LLVM_BIN}llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc 
	${LLVM_BIN}llvm-as ${ENZYME_NATIVE_BUILD}/read.ll -o ${ENZYME_NATIVE_BUILD}/read.bc 
	${LLVM_BIN}${CC} ${ENZYME_NATIVE_BUILD}/enzyme_output.bc ${ENZYME_NATIVE_BUILD}/read.bc -O2 -o ${ENZYME_NATIVE_BUILD}/ba_enzyme

run-enzyme-native:
	${ENZYME_NATIVE_BUILD}/ba_enzyme $(RUN_ARGS)


enzyme: build-enzyme run-enzyme

all: build-native build-impala build-enzyme-impala build-enzyme-native