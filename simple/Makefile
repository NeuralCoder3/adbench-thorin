SHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

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

setup-ubuntu:
	sudo ldconfig ${RUNTIME}

build-native:
	source ../../project.sh && \
	mkdir -p ${NATIVE_MANUAL_BUILD} && \
	clang++ manual/main.cpp ${SHARED_ALL}/read.cpp ${SHARED}/gmm_d.cpp ${SHARED}/gmm.cpp -O2 -o ${NATIVE_MANUAL_BUILD}/gmm_manual

run-native:
	${NATIVE_MANUAL_BUILD}/gmm_manual ../benchmark/gmm/1k/gmm_d2_K5.txt

native: build-native run-native

build-impala:
	source ../../project.sh && \
	mkdir -p ${NATIVE_IMPALA_BUILD} && \
	impala ${NATIVE_IMPALA}/gmm.impala --emit-llvm --emit-c-interface -o ${NATIVE_IMPALA_BUILD}/gmm_impala&& \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${NATIVE_IMPALA_BUILD}/gmm_impala.ll
	clang++ -I/opt/homebrew/opt/openblas/include/ -L/opt/homebrew/opt/openblas/lib -lopenblas  -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/gmm_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/gmm_impala

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	${NATIVE_IMPALA_BUILD}/gmm_impala ../benchmark/gmm/1k/gmm_d10_K5.txt

impala: build-impala run-impala

build-enzyme-impala:
	source ../../project.sh && \
	mkdir -p ${ENZYME_IMPALA_BUILD} && \
	impala ${ENZYME_IMPALA}/gmm.impala --emit-thorin --emit-llvm -O0 --emit-c-interface -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala -Othorin && \
	clang++ ${ENZYME_IMPALA}/enzyme.cpp -S -emit-llvm -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme.ll -O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala.ll && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_IMPALA_BUILD}/gmm_enzyme.ll && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-link ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala.bc ${ENZYME_IMPALA_BUILD}/gmm_enzyme.bc  -o ${ENZYME_IMPALA_BUILD}/bundle.bc && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-dis ${ENZYME_IMPALA_BUILD}/bundle.bc -o ${ENZYME_IMPALA_BUILD}/bundle.ll && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.so -enzyme -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enable-new-pm=0 && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_IMPALA_BUILD}/out.ll && \
	clang++ -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme


run-enzyme-impala:
	${ENZYME_IMPALA_BUILD}/gmm_enzyme 5

build-enzyme-native:
	mkdir -p ${ENZYME_NATIVE_BUILD} && \
	source ../../project.sh && \
	clang ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	clang ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	clang ${SHARED}/gmm.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/gmm.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_input.ll && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_NATIVE_BUILD}/gmm.ll -o ${ENZYME_NATIVE_BUILD}/gmm.bc && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-link ${ENZYME_NATIVE_BUILD}/enzyme_input.bc ${ENZYME_NATIVE_BUILD}/gmm.bc  -o ${ENZYME_NATIVE_BUILD}/bundle.bc && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-dis ${ENZYME_NATIVE_BUILD}/bundle.bc -o ${ENZYME_NATIVE_BUILD}/bundle.ll && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/opt ${ENZYME_NATIVE_BUILD}/bundle.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.dylib -enzyme -O2 -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S -enable-new-pm=0 && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${ENZYME_NATIVE_BUILD}/read.ll -o ${ENZYME_NATIVE_BUILD}/read.bc && \
	clang++ ${ENZYME_NATIVE_BUILD}/enzyme_output.bc ${ENZYME_NATIVE_BUILD}/read.bc -O2 -o ${ENZYME_NATIVE_BUILD}/gmm_enzyme

run-enzyme-native:
	${ENZYME_NATIVE_BUILD}/gmm_enzyme 10


enzyme: build-enzyme run-enzyme

all: build-native build-impala build-enzyme-impala build-enzyme-native