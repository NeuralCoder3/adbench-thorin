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

# LLVM_BIN := /opt/homebrew/Cellar/llvm/15.0.3/bin
# #LLVM_BIN := /Users/chris/CLionProjects/anydsl/llvm_install/bin/
# ENZYME_LIB := /opt/homebrew/Cellar/enzyme/0.0.45/lib/LLVMEnzyme-15.dylib
# #ENZYME_LIB := ../../Enzyme2/enzyme/build/Enzyme/LLVMEnzyme-12.dylib
IMPALA_EXE := ../../impala/build/bin/impala



# LLVM_BIN := /opt/homebrew/Cellar/llvm/15.0.3/bin
# ENZYME_LIB := /opt/homebrew/Cellar/enzyme/0.0.45/lib/LLVMEnzyme-15.dylib
LLVM_BIN := /usr/bin
ENZYME_LIB := /Enzyme/enzyme/build/Enzyme/LLVMEnzyme-14.so

CC := clang++

build-native:
	mkdir -p ${NATIVE_MANUAL_BUILD}
	${CC} manual/main.cpp ${SHARED_ALL}/read.cpp ${SHARED_ALL}/lib.cpp ${SHARED}/gmm_d.cpp ${SHARED}/gmm.cpp -O2 -o ${NATIVE_MANUAL_BUILD}/gmm_manual

run-native:
	${NATIVE_MANUAL_BUILD}/gmm_manual $(RUN_ARGS)

native: build-native run-native

build-impala:
	mkdir -p ${NATIVE_IMPALA_BUILD}
	${IMPALA_EXE} ${NATIVE_IMPALA}/gmm.impala -autodiff --emit-llvm --emit-c-interface -o ${NATIVE_IMPALA_BUILD}/gmm_impala
	${LLVM_BIN}/llvm-as ${NATIVE_IMPALA_BUILD}/gmm_impala.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/gmm_impala.bc -O3 -o ${NATIVE_IMPALA_BUILD}/gmm_impala

build-llvm-impala:
	${LLVM_BIN}/llvm-as ${NATIVE_IMPALA_BUILD}/gmm_impala_fix.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${NATIVE_IMPALA_BUILD}/gmm_impala_fix.bc -O3 -o ${NATIVE_IMPALA_BUILD}/gmm_impala_fix

run-impala:
	${NATIVE_IMPALA_BUILD}/gmm_impala $(RUN_ARGS)
# ../benchmark/ba/ba1_n49_m7776_p31843.txt

impala: build-impala run-impala

build-enzyme-impala:
	mkdir -p ${ENZYME_IMPALA_BUILD}
	${IMPALA_EXE} ${ENZYME_IMPALA}/gmm.impala -emit-llvm --emit-c-interface -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala
	${CC} ${ENZYME_IMPALA}/enzyme.cpp -S -emit-llvm -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala.ll
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/gmm_enzyme.ll
	${LLVM_BIN}/llvm-link ${ENZYME_IMPALA_BUILD}/gmm_enzyme_impala.bc ${ENZYME_IMPALA_BUILD}/gmm_enzyme.bc  -o ${ENZYME_IMPALA_BUILD}/bundle.bc
	${LLVM_BIN}/llvm-dis ${ENZYME_IMPALA_BUILD}/bundle.bc -o ${ENZYME_IMPALA_BUILD}/bundle.ll
	${LLVM_BIN}/opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -O2 -o ${ENZYME_IMPALA_BUILD}/enzyme_output.ll -S -enable-new-pm=0
	${LLVM_BIN}/opt ${ENZYME_IMPALA_BUILD}/enzyme_output.ll -O2 -o ${ENZYME_IMPALA_BUILD}/enzyme_output_optimized.ll -S
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/enzyme_output_optimized.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/enzyme_output_optimized.bc -O2 -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme

test:
	${LLVM_BIN}/opt ${ENZYME_IMPALA_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -o ${ENZYME_IMPALA_BUILD}/out.ll -S -enable-new-pm=0
	${LLVM_BIN}/llvm-as ${ENZYME_IMPALA_BUILD}/out.ll
	${CC} -lm ${SHARED_ALL}/lib.cpp ${SHARED_ALL}/read.cpp ${ENZYME_IMPALA_BUILD}/out.bc -O3 -o ${ENZYME_IMPALA_BUILD}/gmm_enzyme

run-enzyme-impala:
	${ENZYME_IMPALA_BUILD}/gmm_enzyme $(RUN_ARGS)

# ${LLVM_BIN}/${CC} ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops  -Xclang -no-opaque-pointers
# ${LLVM_BIN}/${CC} ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops  -Xclang -no-opaque-pointers
# ${LLVM_BIN}/${CC} ${SHARED}/gmm.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/gmm.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops  -Xclang -no-opaque-pointers
# ${LLVM_BIN}/${CC} ${SHARED_ALL}/lib.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/lib.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops  -Xclang -no-opaque-pointers
build-enzyme-native:
	mkdir -p ${ENZYME_NATIVE_BUILD}
	${LLVM_BIN}/${CC} ${ENZYME_NATIVE}/enzyme.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/enzyme_input.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops  
	${LLVM_BIN}/${CC} ${SHARED_ALL}/read.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/read.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops  
	${LLVM_BIN}/${CC} ${SHARED}/gmm.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/gmm.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops  
	${LLVM_BIN}/${CC} ${SHARED_ALL}/lib.cpp -S -emit-llvm -o ${ENZYME_NATIVE_BUILD}/lib.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops  
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_input.ll
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/gmm.ll -o ${ENZYME_NATIVE_BUILD}/gmm.bc
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/lib.ll -o ${ENZYME_NATIVE_BUILD}/lib.bc
	${LLVM_BIN}/llvm-link ${ENZYME_NATIVE_BUILD}/enzyme_input.bc ${ENZYME_NATIVE_BUILD}/gmm.bc ${ENZYME_NATIVE_BUILD}/lib.bc  -o ${ENZYME_NATIVE_BUILD}/bundle.bc
	${LLVM_BIN}/llvm-dis ${ENZYME_NATIVE_BUILD}/bundle.bc -o ${ENZYME_NATIVE_BUILD}/bundle.ll
	${LLVM_BIN}/opt ${ENZYME_NATIVE_BUILD}/bundle.ll -load=${ENZYME_LIB} -enzyme -enzyme-inline=1 -o ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -S --enable-new-pm=0
	${LLVM_BIN}/opt ${ENZYME_NATIVE_BUILD}/enzyme_output.ll -O2 -o ${ENZYME_NATIVE_BUILD}/enzyme_output_optimized.ll -S
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/enzyme_output_optimized.ll -o ${ENZYME_NATIVE_BUILD}/enzyme_output.bc
	${LLVM_BIN}/llvm-as ${ENZYME_NATIVE_BUILD}/read.ll -o ${ENZYME_NATIVE_BUILD}/read.bc
	${LLVM_BIN}/${CC} ${ENZYME_NATIVE_BUILD}/enzyme_output.bc ${ENZYME_NATIVE_BUILD}/read.bc -O3 -o ${ENZYME_NATIVE_BUILD}/gmm_enzyme

run-enzyme-native:
	${ENZYME_NATIVE_BUILD}/gmm_enzyme $(RUN_ARGS)

enzyme: build-enzyme __restrict__run-enzyme

all: build-native build-impala build-enzyme-impala build-enzyme-native