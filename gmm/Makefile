

thorin:



enzyme:
	. ../../project.sh
	mkdir -p ../../build/gmm
	#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../../runtime/build/lib
	impala gmm.impala --emit-llvm -O0 --emit-c-interface -o ../build/gmm/gmm_impala
	clang++ enzyme.cpp -S -emit-llvm -o ../build/gmm/gmm_enzyme.ll -O3 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops

	llvm-as ../build/gmm/gmm_impala.ll
	llvm-as ../build/gmm/gmm_enzyme.ll
	llvm-link ../build/gmm/gmm_impala.bc ../build/gmm/gmm_enzyme.bc -o ../build/gmm/bundle.bc

	llvm-dis ../build/gmm/bundle.bc -o ../build/gmm/bundle.ll

	/opt/homebrew/Cellar/llvm/13.0.0_2/bin/opt ../build/gmm/bundle.ll -load=/opt/homebrew/Cellar/enzyme/0.0.26/lib/LLVMEnzyme-13.dylib -enzyme -o ../build/gmm/out.ll -S -enable-new-pm=0
	llvm-as ../build/gmm/out.ll
	clang++ -L../../runtime/build/lib -lruntime -lm ../cpp/print_lib.cpp ../cpp/read.cpp ../build/gmm/out.bc -O3 -o ../build/gmm/prog_enzyme


run-enzyme: enzyme
	cd ..
	./build/gmm/prog_enzyme benchmark/gmm/1k/gmm_d2_K5.txt
