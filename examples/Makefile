SHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_GMM := ${BUILD}/gmm


setup-ubuntu:
	sudo ldconfig ${RUNTIME}

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	source ../../project.sh && \
	impala example.impala --emit-llvm -o example -O0&& \
	llvm-as example.ll && \
	clang++ lib.cpp example.bc -O3 -o example

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	./example

all: build-impala run-impala