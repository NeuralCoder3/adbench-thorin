SHELL := /bin/bash

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

RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(RUN_ARGS):;@:)

LLVM_BIN := /Users/chris/CLionProjects/anydsl/llvm_install/bin/
ENZYME_LIB := ../../Enzyme2/enzyme/build/Enzyme/LLVMEnzyme-12.dylib
IMPALA_EXE := ../../impala/build/bin/impala
CC := clang++

build:
	mkdir -p ${ENZYME_NATIVE_BUILD}
	${CC} ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${IMPALA_EXE}/opt ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0
	${IMPALA_EXE}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc
	${CC}  ${SHARED_ALL}/read.cpp  ${ENZYME_NATIVE_BUILD}/enzyme_output.bc -O0 -o ${ENZYME_NATIVE_BUILD}/lstm_enzyme

run:
	${ENZYME_NATIVE_BUILD}/lstm_enzyme ../benchmark/lstm/lstm_l2_c1024.txt

build-native:
	mkdir -p ${NATIVE_MANUAL_BUILD} 
	${CC} ${NATIVE_MANUAL_BUILD_CPP} -O2 -std=c++11  -o ${NATIVE_MANUAL_BUILD}/lstm_manual

run-native:
	${NATIVE_MANUAL_BUILD}/lstm_manual $(RUN_ARGS)
#../benchmark/lstm/lstm_l2_c1024.txt

native: build-native run-native

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME}
	mkdir -p ${NATIVE_IMPALA_BUILD}
	${IMPALA_EXE} ${NATIVE_IMPALA}/lstm.impala -autodiff --emit-llvm --emit-c-interface -o ${NATIVE_IMPALA_BUILD}/lstm_impala
	${LLVM_BIN}/llvm-as ${NATIVE_IMPALA_BUILD}/lstm_impala.ll 
	${LLVM_BIN}/${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/lstm_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/lstm_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} 
	${NATIVE_IMPALA_BUILD}/lstm_impala $(RUN_ARGS)

impala: build-impala run-impala

build-enzyme-impala:
	mkdir -p ${ENZYME_IMPALA_BUILD} 
	${IMPALA_EXE} ${ENZYME_IMPALA}/lstm.impala --emit-llvm -O0 --emit-c-interface -o ${ENZYME_IMPALA_BUILD}/lstm_enzyme_impala -Othorin
	${CC} ${ENZYME_IMPALA}/enzyme.cpp -S -emit-llvm -o ${ENZYME_IMPALA_BUILD}/lstm_enzyme.ll -O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${LLVM_BIN}llvm-as ${ENZYME_IMPALA_BUILD}/lstm_enzyme_impala.ll 
	${LLVM_BIN}llvm-as ${ENZYME_IMPALA_BUILD}/lstm_enzyme.ll 
	${LLVM_BIN}llvm-link ${ENZYME_IMPALA_BUILD}/lstm_enzyme_impala.bc ${ENZYME_IMPALA_BUILD}/lstm_enzyme.bc  -o ${ENZYME_IMPALA_BUILD}/bundle.bc 
	${LLVM_BIN}llvm-dis ${ENZYME_IMPALA_BUILD}/bundle.bc -o ${ENZYME_IMPALA_BUILD}/bundle.ll 
	${LLVM_BIN}opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enable-new-pm=0
	${LLVM_BIN}llvm-as ${ENZYME_IMPALA_BUILD}/out.ll 
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/lstm_enzyme

run-enzyme-impala:
	${ENZYME_IMPALA_BUILD}/lstm_enzyme $(RUN_ARGS)

build-enzyme-native:
	mkdir -p ${ENZYME_NATIVE_BUILD} 
	${CC} ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${CC} ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${CC} ${SHARED}/lstm.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/lstm.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_input.ll 
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/lstm.ll -o ${ENZYME_NATIVE_BUILD}/lstm.bc 
	${LLVM_BIN}/llvm-link ${ENZYME_NATIVE_BUILD}/enzyme_input.bc ${ENZYME_NATIVE_BUILD}/lstm.bc  -o ${ENZYME_NATIVE_BUILD}/bundle.bc 
	${LLVM_BIN}/llvm-dis ${ENZYME_NATIVE_BUILD}/bundle.bc -o ${ENZYME_NATIVE_BUILD}/bundle.ll 
	${LLVM_BIN}/opt ${ENZYME_NATIVE_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc 
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/read.ll -o ${ENZYME_NATIVE_BUILD}/read.bc 
	${CC} ${ENZYME_NATIVE_BUILD}/enzyme_output.bc ${ENZYME_NATIVE_BUILD}/read.bc -O2 -o ${ENZYME_NATIVE_BUILD}/lstm_enzyme

run-enzyme-native:
	${ENZYME_NATIVE_BUILD}/lstm_enzyme $(RUN_ARGS)


enzyme: build-enzyme run-enzyme

all: build-native build-impala build-enzyme-impala build-enzyme-native