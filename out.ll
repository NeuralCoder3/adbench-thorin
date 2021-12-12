; ModuleID = 'out'
source_filename = "out"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() {
main_start:
  %"%sum_20566" = alloca double, align 8
  %"%Lparamsidx_20738" = alloca i32, align 4
  %"%slse_20391" = alloca double, align 8
  br label %main

main:                                             ; preds = %main_start
  %0 = call [0 x i8]* @anydsl_alloc(i32 0, i64 80)
  %1 = bitcast [0 x i8]* %0 to [5 x double]*
  %2 = call [0 x i8]* @anydsl_alloc(i32 0, i64 160)
  %3 = bitcast [0 x i8]* %2 to [10 x double]*
  %4 = call [0 x i8]* @anydsl_alloc(i32 0, i64 240)
  %5 = bitcast [0 x i8]* %4 to [15 x double]*
  %6 = call double @log(double 6.283180e+00)
  br label %log_cont

log_cont:                                         ; preds = %main
  %7 = phi double [ %6, %main ]
  %8 = call [0 x i8]* @anydsl_alloc(i32 0, i64 160)
  %9 = bitcast [0 x i8]* %8 to [10 x double]*
  %10 = bitcast [15 x double]* %5 to [0 x double]*
  %11 = bitcast [10 x double]* %9 to [0 x double]*
  %12 = call [0 x i8]* @anydsl_alloc(i32 0, i64 80)
  %13 = bitcast [0 x i8]* %12 to [5 x double]*
  %14 = bitcast [5 x double]* %13 to [0 x double]*
  %15 = call [0 x i8]* @anydsl_alloc(i32 0, i64 32)
  %16 = bitcast [0 x i8]* %15 to [2 x double]*
  %17 = call [0 x i8]* @anydsl_alloc(i32 0, i64 32)
  %18 = bitcast [0 x i8]* %17 to [2 x double]*
  %19 = call [0 x i8]* @anydsl_alloc(i32 0, i64 80)
  %20 = bitcast [0 x i8]* %19 to [5 x double]*
  %21 = call [0 x i8]* @anydsl_alloc(i32 0, i64 32000)
  %22 = bitcast [0 x i8]* %21 to [2000 x double]*
  br label %while_head

while_head:                                       ; preds = %eta_while_head, %log_cont
  %23 = phi i32 [ %42, %eta_while_head ], [ 0, %log_cont ]
  %24 = icmp slt i32 %23, 5
  br i1 %24, label %while_body, label %preprocess_qs_cont

while_body:                                       ; preds = %while_head
  %25 = zext i32 %23 to i64
  %26 = mul nsw i32 3, %23
  %27 = mul nsw i32 2, %23
  %28 = getelementptr inbounds [0 x double], [0 x double]* %14, i64 0, i64 %25
  store double 0.000000e+00, double* %28, align 8
  br label %while_head1

while_head1:                                      ; preds = %exp_cont, %while_body
  %29 = phi i32 [ %39, %exp_cont ], [ 0, %while_body ]
  %30 = icmp slt i32 %29, 2
  br i1 %30, label %while_body2, label %eta_while_head

while_body2:                                      ; preds = %while_head1
  %31 = add nsw i32 %29, %26
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds [0 x double], [0 x double]* %10, i64 0, i64 %32
  %34 = load double, double* %33, align 8
  %35 = load double, double* %28, align 8
  %36 = fadd double %34, %35
  store double %36, double* %28, align 8
  %37 = call double @exp(double %34)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body2
  %exp = phi double [ %37, %while_body2 ]
  %38 = add nsw i32 %29, %27
  %39 = add nsw i32 1, %29
  %40 = zext i32 %38 to i64
  %41 = getelementptr inbounds [0 x double], [0 x double]* %11, i64 0, i64 %40
  store double %exp, double* %41, align 8
  br label %while_head1

eta_while_head:                                   ; preds = %while_head1
  %42 = add nsw i32 1, %23
  br label %while_head

preprocess_qs_cont:                               ; preds = %while_head
  %43 = bitcast [5 x double]* %1 to [0 x double]*
  %44 = bitcast [2000 x double]* %22 to [0 x double]*
  %45 = bitcast [5 x double]* %20 to [0 x double]*
  %46 = bitcast [2 x double]* %18 to [0 x double]*
  %47 = bitcast [2 x double]* %16 to [0 x double]*
  %48 = bitcast [10 x double]* %3 to [0 x double]*
  store double 0.000000e+00, double* %"%slse_20391", align 8
  br label %while_head3

while_head3:                                      ; preds = %logsumexp_cont, %preprocess_qs_cont
  %49 = phi i32 [ %130, %logsumexp_cont ], [ 0, %preprocess_qs_cont ]
  %50 = icmp slt i32 %49, 1000
  br i1 %50, label %while_body4, label %break20

while_body4:                                      ; preds = %while_head3
  %51 = mul nsw i32 2, %49
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds [0 x double], [0 x double]* %44, i64 0, i64 %52
  %54 = bitcast double* %53 to [0 x double]*
  br label %while_head5

while_head5:                                      ; preds = %break18, %while_body4
  %55 = phi i32 [ %123, %break18 ], [ 0, %while_body4 ]
  %56 = icmp slt i32 %55, 5
  br i1 %56, label %while_body6, label %break19

while_body6:                                      ; preds = %while_head5
  %57 = mul nsw i32 2, %55
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds [0 x double], [0 x double]* %48, i64 0, i64 %58
  %60 = bitcast double* %59 to [0 x double]*
  br label %while_head7

while_head7:                                      ; preds = %while_body8, %while_body6
  %61 = phi i32 [ %64, %while_body8 ], [ 0, %while_body6 ]
  %62 = icmp slt i32 %61, 2
  br i1 %62, label %while_body8, label %subtract_cont

while_body8:                                      ; preds = %while_head7
  %63 = zext i32 %61 to i64
  %64 = add nsw i32 1, %61
  %65 = getelementptr inbounds [0 x double], [0 x double]* %47, i64 0, i64 %63
  %66 = getelementptr inbounds [0 x double], [0 x double]* %60, i64 0, i64 %63
  %67 = getelementptr inbounds [0 x double], [0 x double]* %54, i64 0, i64 %63
  %68 = load double, double* %67, align 8
  %69 = load double, double* %66, align 8
  %70 = fsub double %68, %69
  store double %70, double* %65, align 8
  br label %while_head7

subtract_cont:                                    ; preds = %while_head7
  %71 = getelementptr inbounds [0 x double], [0 x double]* %11, i64 0, i64 %58
  %72 = bitcast double* %71 to [0 x double]*
  br label %while_head9

while_head9:                                      ; preds = %while_body10, %subtract_cont
  %73 = phi i32 [ %76, %while_body10 ], [ 0, %subtract_cont ]
  %74 = icmp slt i32 %73, 2
  br i1 %74, label %while_body10, label %break

while_body10:                                     ; preds = %while_head9
  %75 = zext i32 %73 to i64
  %76 = add nsw i32 1, %73
  %77 = getelementptr inbounds [0 x double], [0 x double]* %46, i64 0, i64 %75
  %78 = getelementptr inbounds [0 x double], [0 x double]* %47, i64 0, i64 %75
  %79 = getelementptr inbounds [0 x double], [0 x double]* %72, i64 0, i64 %75
  %80 = load double, double* %79, align 8
  %81 = load double, double* %78, align 8
  %82 = fmul double %80, %81
  store double %82, double* %77, align 8
  br label %while_head9

break:                                            ; preds = %while_head9
  %83 = mul nsw i32 3, %55
  %84 = add nsw i32 2, %83
  store i32 0, i32* %"%Lparamsidx_20738", align 4
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [0 x double], [0 x double]* %10, i64 0, i64 %85
  %87 = bitcast double* %86 to [0 x double]*
  br label %while_head11

while_head11:                                     ; preds = %eta_while_head15, %break
  %88 = phi i32 [ %91, %eta_while_head15 ], [ 0, %break ]
  %89 = icmp slt i32 %88, 2
  br i1 %89, label %while_body12, label %Qtimesx_cont

while_body12:                                     ; preds = %while_head11
  %90 = zext i32 %88 to i64
  %91 = add nsw i32 1, %88
  %92 = getelementptr inbounds [0 x double], [0 x double]* %47, i64 0, i64 %90
  br label %while_head13

while_head13:                                     ; preds = %while_body14, %while_body12
  %93 = phi i32 [ %96, %while_body14 ], [ %91, %while_body12 ]
  %94 = icmp slt i32 %93, 2
  br i1 %94, label %while_body14, label %eta_while_head15

while_body14:                                     ; preds = %while_head13
  %95 = zext i32 %93 to i64
  %96 = add nsw i32 1, %93
  %97 = getelementptr inbounds [0 x double], [0 x double]* %46, i64 0, i64 %95
  %98 = load double, double* %97, align 8
  %99 = load i32, i32* %"%Lparamsidx_20738", align 4
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds [0 x double], [0 x double]* %87, i64 0, i64 %100
  %102 = load double, double* %101, align 8
  %103 = load double, double* %92, align 8
  %104 = fmul double %102, %103
  %105 = fadd double %98, %104
  store double %105, double* %97, align 8
  %106 = load i32, i32* %"%Lparamsidx_20738", align 4
  %107 = add nsw i32 1, %106
  store i32 %107, i32* %"%Lparamsidx_20738", align 4
  br label %while_head13

eta_while_head15:                                 ; preds = %while_head13
  br label %while_head11

Qtimesx_cont:                                     ; preds = %while_head11
  %108 = zext i32 %55 to i64
  %109 = getelementptr inbounds [0 x double], [0 x double]* %14, i64 0, i64 %108
  %110 = getelementptr inbounds [0 x double], [0 x double]* %43, i64 0, i64 %108
  %111 = load double, double* %110, align 8
  %112 = load double, double* %109, align 8
  store double 0.000000e+00, double* %"%sum_20566", align 8
  br label %while_head16

while_head16:                                     ; preds = %while_body17, %Qtimesx_cont
  %113 = phi i32 [ %116, %while_body17 ], [ 0, %Qtimesx_cont ]
  %114 = icmp slt i32 %113, 2
  br i1 %114, label %while_body17, label %break18

while_body17:                                     ; preds = %while_head16
  %115 = zext i32 %113 to i64
  %116 = add nsw i32 1, %113
  %117 = getelementptr inbounds [0 x double], [0 x double]* %46, i64 0, i64 %115
  %118 = load double, double* %117, align 8
  %119 = load double, double* %117, align 8
  %120 = load double, double* %"%sum_20566", align 8
  %121 = fmul double %118, %119
  %122 = fadd double %121, %120
  store double %122, double* %"%sum_20566", align 8
  br label %while_head16

break18:                                          ; preds = %while_head16
  %123 = add nsw i32 1, %55
  %124 = load double, double* %"%sum_20566", align 8
  %125 = getelementptr inbounds [0 x double], [0 x double]* %45, i64 0, i64 %108
  %126 = fadd double %111, %112
  %127 = fmul double 5.000000e-01, %124
  %128 = fsub double %126, %127
  store double %128, double* %125, align 8
  br label %while_head5

break19:                                          ; preds = %while_head5
  %129 = call double @logsumexp_19946([0 x double]* %45)
  br label %logsumexp_cont

logsumexp_cont:                                   ; preds = %break19
  %logsumexp = phi double [ %129, %break19 ]
  %130 = add nsw i32 1, %49
  %131 = load double, double* %"%slse_20391", align 8
  %132 = fadd double %logsumexp, %131
  store double %132, double* %"%slse_20391", align 8
  br label %while_head3

break20:                                          ; preds = %while_head3
  %133 = call double @logsumexp_19946([0 x double]* %43)
  br label %logsumexp_cont21

logsumexp_cont21:                                 ; preds = %break20
  %134 = phi double [ %133, %break20 ]
  %135 = load double, double* %"%slse_20391", align 8
  call void @printDouble(double 1.000000e+00)
  br label %printDouble_cont

printDouble_cont:                                 ; preds = %logsumexp_cont21
  br label %return

return:                                           ; preds = %printDouble_cont
  %136 = phi i32 [ 2, %printDouble_cont ]
  ret i32 %136
}

declare [0 x i8]* @anydsl_alloc(i32, i64)

declare double @log(double)

declare double @exp(double)

define internal double @logsumexp_19946([0 x double]* %"%_20064") {
logsumexp_19946_start:
  %"%semx_20094" = alloca double, align 8
  %"%m_20087" = alloca double, align 8
  br label %logsumexp

logsumexp:                                        ; preds = %logsumexp_19946_start
  %0 = getelementptr inbounds [0 x double], [0 x double]* %"%_20064", i64 0, i64 0
  %1 = load double, double* %0, align 8
  store double %1, double* %"%m_20087", align 8
  br label %while_head

while_head:                                       ; preds = %eta_while_head, %logsumexp
  %2 = phi i32 [ %10, %eta_while_head ], [ 1, %logsumexp ]
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %while_body, label %break

while_body:                                       ; preds = %while_head
  %4 = zext i32 %2 to i64
  %5 = getelementptr inbounds [0 x double], [0 x double]* %"%_20064", i64 0, i64 %4
  %6 = load double, double* %"%m_20087", align 8
  %7 = load double, double* %5, align 8
  %8 = fcmp olt double %6, %7
  br i1 %8, label %if_then, label %eta_while_head

if_then:                                          ; preds = %while_body
  %9 = load double, double* %5, align 8
  store double %9, double* %"%m_20087", align 8
  br label %eta_while_head

eta_while_head:                                   ; preds = %if_then, %while_body
  %10 = add nsw i32 1, %2
  br label %while_head

break:                                            ; preds = %while_head
  %11 = load double, double* %"%m_20087", align 8
  store double 0.000000e+00, double* %"%semx_20094", align 8
  br label %while_head1

while_head1:                                      ; preds = %exp_cont, %break
  %12 = phi i32 [ %19, %exp_cont ], [ 0, %break ]
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %while_body2, label %break3

while_body2:                                      ; preds = %while_head1
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds [0 x double], [0 x double]* %"%_20064", i64 0, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fsub double %16, %11
  %18 = call double @exp(double %17)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body2
  %exp = phi double [ %18, %while_body2 ]
  %19 = add nsw i32 1, %12
  %20 = load double, double* %"%semx_20094", align 8
  %21 = fadd double %exp, %20
  store double %21, double* %"%semx_20094", align 8
  br label %while_head1

break3:                                           ; preds = %while_head1
  %22 = load double, double* %"%semx_20094", align 8
  %23 = call double @log(double %22)
  br label %log_cont

log_cont:                                         ; preds = %break3
  %log = phi double [ %23, %break3 ]
  %24 = fadd double %11, %log
  br label %25

25:                                               ; preds = %log_cont
  %26 = phi double [ %24, %log_cont ]
  ret double %26
}

declare void @printDouble(double)
