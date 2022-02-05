
all:
	. ../../project.sh
	mkdir -p ../build/gradient_descend
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../runtime/../build/lib
	clang -shared -undefined dynamic_lookup -o ../build/libadbench.so ../cpp/read.cpp ../cpp/gmm_d.cpp
	impala gradient_descend.impala --emit-llvm -o ../build/gradient_descend/out
	llvm-as ../build/gradient_descend/out.ll
	clang -L../../runtime/build/lib -L../build -lruntime -lm -ladbench ../cpp/print_lib.cpp ../build/gradient_descend/out.bc -o ../build/gradient_descend/prog

run: all
	../build/gradient_descend/prog