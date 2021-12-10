; ModuleID = 'test2'
source_filename = "test2"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main(float %"%_1130") {
main_start:
  br label %main

main:                                             ; preds = %main_start
  call void @println(i32 0)
  br label %println_cont

println_cont:                                     ; preds = %main
  br label %return

return:                                           ; preds = %println_cont
  %0 = phi i32 [ 0, %println_cont ]
  ret i32 %0
}

declare void @println(i32)
