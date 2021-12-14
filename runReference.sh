#!/bin/bash
mkdir -p build/cpp
cd build/cpp
cmake ../../cpp
make
cd ../../
./build/cpp/main
