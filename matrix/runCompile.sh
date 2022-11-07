#thorin2/build/bin/thorin example.thorin --emit ll -o out.ll -VVVV && clang out.ll -o out && ./out a b c d
#thorin2/build/bin/thorin thorin2/lit/autodiff/$1  -VVVV -d autodiff -d affine -d mem -d direct -d tool -d clos  --output-thorin out.thorin --output-ll out.ll && \
/Users/chris/CLionProjects/anydsl/llvm_install/bin/llvm-as ../build/matrix/matrix_impala.ll -o out && \
  clang++ lib.cpp out.bc -O0 -o out -lc  && \
  ./out $@