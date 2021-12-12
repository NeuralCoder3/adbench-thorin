; ModuleID = 'out'
source_filename = "out"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() {
main_start:
  %"%wishartGamma_6079" = alloca double, align 8
  %"%wishartM_6071" = alloca i32, align 4
  %"%n2_6059" = alloca i32, align 4
  %"%k2_6048" = alloca i32, align 4
  %"%d2_6037" = alloca i32, align 4
  br label %main

main:                                             ; preds = %main_start
  store i32 2, i32* %"%d2_6037", align 4
  store i32 5, i32* %"%k2_6048", align 4
  store i32 1000, i32* %"%n2_6059", align 4
  store i32 0, i32* %"%wishartM_6071", align 4
  store double 1.000000e+00, double* %"%wishartGamma_6079", align 8
  %0 = call [0 x i8]* @anydsl_alloc(i32 0, i64 80)
  %1 = bitcast [0 x i8]* %0 to [5 x double]*
  %2 = bitcast [5 x double]* %1 to [0 x double]*
  %3 = call [0 x i8]* @anydsl_alloc(i32 0, i64 160)
  %4 = bitcast [0 x i8]* %3 to [10 x double]*
  %5 = bitcast [10 x double]* %4 to [0 x double]*
  %6 = call [0 x i8]* @anydsl_alloc(i32 0, i64 240)
  %7 = bitcast [0 x i8]* %6 to [15 x double]*
  %8 = bitcast [15 x double]* %7 to [0 x double]*
  %9 = call [0 x i8]* @anydsl_alloc(i32 0, i64 32000)
  %10 = bitcast [0 x i8]* %9 to [2000 x double]*
  %11 = bitcast [2000 x double]* %10 to [0 x double]*
  call void @read_gmm(i32* %"%d2_6037", i32* %"%k2_6048", i32* %"%n2_6059", i32* %"%wishartM_6071", double* %"%wishartGamma_6079", [0 x double]* %2, [0 x double]* %5, [0 x double]* %8, [0 x double]* %11)
  br label %read_gmm_cont

read_gmm_cont:                                    ; preds = %main
  %12 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 0
  %13 = load double, double* %12, align 8
  call void @printDouble(double %13)
  br label %printDouble_cont

printDouble_cont:                                 ; preds = %read_gmm_cont
  %14 = load i32, i32* %"%d2_6037", align 4
  call void @printInteger(i32 %14)
  br label %printInteger_cont

printInteger_cont:                                ; preds = %printDouble_cont
  %15 = load i32, i32* %"%k2_6048", align 4
  call void @printInteger(i32 %15)
  br label %printInteger_cont1

printInteger_cont1:                               ; preds = %printInteger_cont
  %16 = load i32, i32* %"%n2_6059", align 4
  call void @printInteger(i32 %16)
  br label %printInteger_cont2

printInteger_cont2:                               ; preds = %printInteger_cont1
  br label %return

return:                                           ; preds = %printInteger_cont2
  %17 = phi i32 [ 2, %printInteger_cont2 ]
  ret i32 %17
}

declare [0 x i8]* @anydsl_alloc(i32, i64)

declare void @read_gmm(i32*, i32*, i32*, i32*, double*, [0 x double]*, [0 x double]*, [0 x double]*, [0 x double]*)

declare void @printDouble(double)

declare void @printInteger(i32)
