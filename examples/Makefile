SHELL := /bin/bash

RUNTIME := $(realpath ../../runtime/build/lib)

SHARED_ALL := ../cpp/
SHARED := shared/
BUILD := ../build

BUILD_GMM := ${BUILD}/gmm

FILE := example2

setup-ubuntu:
	sudo ldconfig ${RUNTIME}

build-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	source ../../project.sh && \
	impala ${FILE}.impala --emit-llvm -o ${FILE}&& \
	llvm-as ${FILE}.ll && \
	clang++ lib.cpp ${FILE}.bc -O3 -o ${FILE}

run-impala:
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${RUNTIME} && \
	./${FILE}

all: build-impala run-impala