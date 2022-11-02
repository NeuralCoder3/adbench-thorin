SHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_GMM := ${BUILD}/gmm

FILE := example

RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(RUN_ARGS):;@:)

setup-ubuntu:
	sudo ldconfig ${RUNTIME}

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	source ../../project.sh && \
	impala ${FILE}.impala --emit-llvm --emit-thorin -Othorin -o ${FILE}&& \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ${FILE}.ll && \
	clang++ -I/opt/homebrew/opt/openblas/include/ -L/opt/homebrew/opt/openblas/lib -lopenblas lib.cpp ${FILE}.bc -O3 -o ${FILE}

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	./${FILE} $(RUN_ARGS)

all: build-impala run-impala




build-enzyme-native:
	source ../../project.sh && \
	clang product.cpp -S -emit-llvm -o product.ll -O0 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops && \
	opt product.ll -load=../../Enzyme/enzyme/build/Enzyme/LLVMEnzyme-12.dylib -enzyme -o out2.ll -S -enable-new-pm=0 && \
	/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as out2.ll -o out.bc && \
	clang++ out.bc -O0 -o prod