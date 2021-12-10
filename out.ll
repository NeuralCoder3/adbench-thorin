; ModuleID = 'out'
source_filename = "out"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main(float %"%a_2488") {
main_start:
  br label %main

main:                                             ; preds = %main_start
  call void @println(i32 2)
  br label %println_cont

println_cont:                                     ; preds = %main
  %0 = insertvalue [2 x float] undef, float %"%a_2488", 0
  %1 = insertvalue [2 x float] %0, float %"%a_2488", 1
  %2 = fmul float %"%a_2488", %"%a_2488"
  %3 = fadd float %"%a_2488", %2
  %4 = fptosi float %3 to i32
  call void @println(i32 %4)
  br label %println_cont1

println_cont1:                                    ; preds = %println_cont
  %5 = fmul float 1.000000e+00, %"%a_2488"
  %6 = insertvalue [2 x float] undef, float %5, 0
  %7 = insertvalue [2 x float] %6, float %5, 1
  %8 = fadd float %5, %5
  %9 = fadd float 1.000000e+00, %8
  %10 = fptosi float %9 to i32
  call void @println(i32 %10)
  br label %println_cont2

println_cont2:                                    ; preds = %println_cont1
  br label %return

return:                                           ; preds = %println_cont2
  %11 = phi i32 [ 0, %println_cont2 ]
  ret i32 %11
}

declare void @println(i32)
