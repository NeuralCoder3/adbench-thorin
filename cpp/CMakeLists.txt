project(impala-benchmark)

set(CMAKE_CXX_FLAGS_RELEASE "-O2")

add_executable(main main.cpp read.cpp gmm_d.cpp)