; ModuleID = 'out'
source_filename = "out"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() {
main_start:
  %"%out_27612" = alloca double, align 8
  %"%out_27605" = alloca double, align 8
  %"%Lparamsidx_28326" = alloca i32, align 4
  %"%slse_27521" = alloca double, align 8
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
  %log = phi double [ %6, %main ]
  %7 = bitcast [15 x double]* %5 to [0 x double]*
  %8 = call [0 x i8]* @anydsl_alloc(i32 0, i64 160)
  %9 = bitcast [0 x i8]* %8 to [10 x double]*
  %10 = bitcast [10 x double]* %9 to [0 x double]*
  %11 = call [0 x i8]* @anydsl_alloc(i32 0, i64 80)
  %12 = bitcast [0 x i8]* %11 to [5 x double]*
  %13 = bitcast [5 x double]* %12 to [0 x double]*
  %14 = call [0 x i8]* @anydsl_alloc(i32 0, i64 32)
  %15 = bitcast [0 x i8]* %14 to [2 x double]*
  %16 = call [0 x i8]* @anydsl_alloc(i32 0, i64 32)
  %17 = bitcast [0 x i8]* %16 to [2 x double]*
  %18 = call [0 x i8]* @anydsl_alloc(i32 0, i64 80)
  %19 = bitcast [0 x i8]* %18 to [5 x double]*
  %20 = call [0 x i8]* @anydsl_alloc(i32 0, i64 32000)
  %21 = bitcast [0 x i8]* %20 to [2000 x double]*
  br label %while_head

while_head:                                       ; preds = %eta_while_head, %log_cont
  %22 = phi i32 [ %41, %eta_while_head ], [ 0, %log_cont ]
  %23 = icmp slt i32 %22, 5
  br i1 %23, label %while_body, label %preprocess_qs_cont

while_body:                                       ; preds = %while_head
  %24 = zext i32 %22 to i64
  %25 = mul nsw i32 2, %22
  %26 = mul nsw i32 3, %22
  %27 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 %24
  store double 0.000000e+00, double* %27, align 8
  br label %while_head1

while_head1:                                      ; preds = %exp_cont, %while_body
  %28 = phi i32 [ %37, %exp_cont ], [ 0, %while_body ]
  %29 = icmp slt i32 %28, 2
  br i1 %29, label %while_body2, label %eta_while_head

while_body2:                                      ; preds = %while_head1
  %30 = add nsw i32 %28, %26
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds [0 x double], [0 x double]* %7, i64 0, i64 %31
  %33 = load double, double* %32, align 8
  %34 = load double, double* %27, align 8
  %35 = fadd double %33, %34
  store double %35, double* %27, align 8
  %36 = call double @exp(double %33)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body2
  %exp = phi double [ %36, %while_body2 ]
  %37 = add nsw i32 1, %28
  %38 = add nsw i32 %28, %25
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [0 x double], [0 x double]* %10, i64 0, i64 %39
  store double %exp, double* %40, align 8
  br label %while_head1

eta_while_head:                                   ; preds = %while_head1
  %41 = add nsw i32 1, %22
  br label %while_head

preprocess_qs_cont:                               ; preds = %while_head
  %42 = bitcast [2 x double]* %17 to [0 x double]*
  %43 = bitcast [2 x double]* %15 to [0 x double]*
  %44 = bitcast [5 x double]* %19 to [0 x double]*
  %45 = bitcast [5 x double]* %1 to [0 x double]*
  %46 = bitcast [10 x double]* %3 to [0 x double]*
  %47 = bitcast [2000 x double]* %21 to [0 x double]*
  store double 0.000000e+00, double* %"%slse_27521", align 8
  br label %while_head3

while_head3:                                      ; preds = %logsumexp_cont, %preprocess_qs_cont
  %48 = phi i32 [ %119, %logsumexp_cont ], [ 0, %preprocess_qs_cont ]
  %49 = icmp slt i32 %48, 1000
  br i1 %49, label %while_body4, label %break17

while_body4:                                      ; preds = %while_head3
  %50 = mul nsw i32 2, %48
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds [0 x double], [0 x double]* %47, i64 0, i64 %51
  %53 = bitcast double* %52 to [0 x double]*
  br label %while_head5

while_head5:                                      ; preds = %sqnorm_cont, %while_body4
  %54 = phi i32 [ %115, %sqnorm_cont ], [ 0, %while_body4 ]
  %55 = icmp slt i32 %54, 5
  br i1 %55, label %while_body6, label %break16

while_body6:                                      ; preds = %while_head5
  %56 = mul nsw i32 2, %54
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds [0 x double], [0 x double]* %46, i64 0, i64 %57
  %59 = bitcast double* %58 to [0 x double]*
  br label %while_head7

while_head7:                                      ; preds = %while_body8, %while_body6
  %60 = phi i32 [ %63, %while_body8 ], [ 0, %while_body6 ]
  %61 = icmp slt i32 %60, 2
  br i1 %61, label %while_body8, label %subtract_cont

while_body8:                                      ; preds = %while_head7
  %62 = zext i32 %60 to i64
  %63 = add nsw i32 1, %60
  %64 = getelementptr inbounds [0 x double], [0 x double]* %43, i64 0, i64 %62
  %65 = getelementptr inbounds [0 x double], [0 x double]* %53, i64 0, i64 %62
  %66 = getelementptr inbounds [0 x double], [0 x double]* %59, i64 0, i64 %62
  %67 = load double, double* %65, align 8
  %68 = load double, double* %66, align 8
  %69 = fsub double %67, %68
  store double %69, double* %64, align 8
  br label %while_head7

subtract_cont:                                    ; preds = %while_head7
  %70 = getelementptr inbounds [0 x double], [0 x double]* %10, i64 0, i64 %57
  %71 = bitcast double* %70 to [0 x double]*
  br label %while_head9

while_head9:                                      ; preds = %while_body10, %subtract_cont
  %72 = phi i32 [ %76, %while_body10 ], [ 0, %subtract_cont ]
  %73 = icmp slt i32 %72, 2
  br i1 %73, label %while_body10, label %break

while_body10:                                     ; preds = %while_head9
  %74 = zext i32 %72 to i64
  %75 = getelementptr inbounds [0 x double], [0 x double]* %43, i64 0, i64 %74
  %76 = add nsw i32 1, %72
  %77 = getelementptr inbounds [0 x double], [0 x double]* %42, i64 0, i64 %74
  %78 = getelementptr inbounds [0 x double], [0 x double]* %71, i64 0, i64 %74
  %79 = load double, double* %78, align 8
  %80 = load double, double* %75, align 8
  %81 = fmul double %79, %80
  store double %81, double* %77, align 8
  br label %while_head9

break:                                            ; preds = %while_head9
  %82 = mul nsw i32 3, %54
  %83 = add nsw i32 2, %82
  %84 = zext i32 %83 to i64
  store i32 0, i32* %"%Lparamsidx_28326", align 4
  %85 = getelementptr inbounds [0 x double], [0 x double]* %7, i64 0, i64 %84
  %86 = bitcast double* %85 to [0 x double]*
  br label %while_head11

while_head11:                                     ; preds = %eta_while_head15, %break
  %87 = phi i32 [ %90, %eta_while_head15 ], [ 0, %break ]
  %88 = icmp slt i32 %87, 2
  br i1 %88, label %while_body12, label %Qtimesx_cont

while_body12:                                     ; preds = %while_head11
  %89 = zext i32 %87 to i64
  %90 = add nsw i32 1, %87
  %91 = getelementptr inbounds [0 x double], [0 x double]* %43, i64 0, i64 %89
  br label %while_head13

while_head13:                                     ; preds = %while_body14, %while_body12
  %92 = phi i32 [ %95, %while_body14 ], [ %90, %while_body12 ]
  %93 = icmp slt i32 %92, 2
  br i1 %93, label %while_body14, label %eta_while_head15

while_body14:                                     ; preds = %while_head13
  %94 = zext i32 %92 to i64
  %95 = add nsw i32 1, %92
  %96 = getelementptr inbounds [0 x double], [0 x double]* %42, i64 0, i64 %94
  %97 = load double, double* %96, align 8
  %98 = load i32, i32* %"%Lparamsidx_28326", align 4
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds [0 x double], [0 x double]* %86, i64 0, i64 %99
  %101 = load double, double* %100, align 8
  %102 = load double, double* %91, align 8
  %103 = fmul double %101, %102
  %104 = fadd double %97, %103
  store double %104, double* %96, align 8
  %105 = load i32, i32* %"%Lparamsidx_28326", align 4
  %106 = add nsw i32 1, %105
  store i32 %106, i32* %"%Lparamsidx_28326", align 4
  br label %while_head13

eta_while_head15:                                 ; preds = %while_head13
  br label %while_head11

Qtimesx_cont:                                     ; preds = %while_head11
  %107 = zext i32 %54 to i64
  %108 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 %107
  %109 = getelementptr inbounds [0 x double], [0 x double]* %45, i64 0, i64 %107
  %110 = load double, double* %109, align 8
  %111 = load double, double* %108, align 8
  %112 = call double @sqnorm_27749(i32 2, [0 x double]* %42)
  br label %sqnorm_cont

sqnorm_cont:                                      ; preds = %Qtimesx_cont
  %sqnorm = phi double [ %112, %Qtimesx_cont ]
  %113 = getelementptr inbounds [0 x double], [0 x double]* %44, i64 0, i64 %107
  %114 = fadd double %110, %111
  %115 = add nsw i32 1, %54
  %116 = fmul double 5.000000e-01, %sqnorm
  %117 = fsub double %114, %116
  store double %117, double* %113, align 8
  br label %while_head5

break16:                                          ; preds = %while_head5
  %118 = call double @logsumexp_27088([0 x double]* %44)
  br label %logsumexp_cont

logsumexp_cont:                                   ; preds = %break16
  %logsumexp = phi double [ %118, %break16 ]
  %119 = add nsw i32 1, %48
  %120 = load double, double* %"%slse_27521", align 8
  %121 = fadd double %logsumexp, %120
  store double %121, double* %"%slse_27521", align 8
  br label %while_head3

break17:                                          ; preds = %while_head3
  %122 = call double @logsumexp_27088([0 x double]* %45)
  br label %logsumexp_cont18

logsumexp_cont18:                                 ; preds = %break17
  %logsumexp19 = phi double [ %122, %break17 ]
  %123 = load double, double* %"%slse_27521", align 8
  %124 = call double @log(double 1.000000e+00)
  br label %log_cont20

log_cont20:                                       ; preds = %logsumexp_cont18
  %log21 = phi double [ %124, %logsumexp_cont18 ]
  %125 = call double @log(double 2.000000e+00)
  br label %log_cont22

log_cont22:                                       ; preds = %log_cont20
  %log23 = phi double [ %125, %log_cont20 ]
  %126 = call double @log(double 3.141590e+00)
  br label %log_cont24

log_cont24:                                       ; preds = %log_cont22
  %log25 = phi double [ %126, %log_cont22 ]
  %127 = fmul double 5.000000e-01, %log25
  store double %127, double* %"%out_27605", align 8
  br label %while_head26

while_head26:                                     ; preds = %lgamma_cont, %log_cont24
  %128 = phi i32 [ %135, %lgamma_cont ], [ 1, %log_cont24 ]
  %129 = icmp slt i32 %128, 3
  br i1 %129, label %while_body27, label %break28

while_body27:                                     ; preds = %while_head26
  %130 = sub nsw i32 1, %128
  %131 = sitofp i32 %130 to double
  %132 = fmul double 5.000000e-01, %131
  %133 = fadd double 1.500000e+00, %132
  %134 = call double @lgamma(double %133)
  br label %lgamma_cont

lgamma_cont:                                      ; preds = %while_body27
  %lgamma = phi double [ %134, %while_body27 ]
  %135 = add nsw i32 1, %128
  %136 = load double, double* %"%out_27605", align 8
  %137 = fadd double %lgamma, %136
  store double %137, double* %"%out_27605", align 8
  br label %while_head26

break28:                                          ; preds = %while_head26
  %138 = load double, double* %"%out_27605", align 8
  store double 0.000000e+00, double* %"%out_27612", align 8
  br label %while_head29

while_head29:                                     ; preds = %sqnorm_cont33, %break28
  %139 = phi i32 [ %152, %sqnorm_cont33 ], [ 0, %break28 ]
  %140 = icmp slt i32 %139, 5
  br i1 %140, label %while_body30, label %break35

while_body30:                                     ; preds = %while_head29
  %141 = mul nsw i32 2, %139
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds [0 x double], [0 x double]* %10, i64 0, i64 %142
  %144 = bitcast double* %143 to [0 x double]*
  %145 = call double @sqnorm_27749(i32 2, [0 x double]* %144)
  br label %sqnorm_cont31

sqnorm_cont31:                                    ; preds = %while_body30
  %sqnorm32 = phi double [ %145, %while_body30 ]
  %146 = mul nsw i32 3, %139
  %147 = add nsw i32 2, %146
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds [0 x double], [0 x double]* %7, i64 0, i64 %148
  %150 = bitcast double* %149 to [0 x double]*
  %151 = call double @sqnorm_27749(i32 1, [0 x double]* %150)
  br label %sqnorm_cont33

sqnorm_cont33:                                    ; preds = %sqnorm_cont31
  %sqnorm34 = phi double [ %151, %sqnorm_cont31 ]
  %152 = add nsw i32 1, %139
  %153 = zext i32 %139 to i64
  %154 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 %153
  %155 = load double, double* %154, align 8
  %156 = fadd double %sqnorm32, %sqnorm34
  %157 = fmul double 5.000000e-01, %156
  %158 = load double, double* %"%out_27612", align 8
  %159 = fmul double 0.000000e+00, %155
  %160 = fsub double %157, %159
  %161 = fadd double %160, %158
  store double %161, double* %"%out_27612", align 8
  br label %while_head29

break35:                                          ; preds = %while_head29
  %162 = fmul double 1.000000e+03, %logsumexp19
  %163 = fmul double -1.000000e+03, %log
  %164 = fmul double 5.000000e-01, %log23
  %165 = load double, double* %"%out_27612", align 8
  %166 = fadd double %163, %123
  %167 = fsub double %log21, %164
  %168 = fsub double %166, %162
  %169 = fmul double 6.000000e+00, %167
  %170 = fsub double %169, %138
  %171 = fmul double 5.000000e+00, %170
  %172 = fsub double %165, %171
  %173 = fadd double %168, %172
  call void @printDouble(double %173)
  br label %printDouble_cont

printDouble_cont:                                 ; preds = %break35
  br label %return

return:                                           ; preds = %printDouble_cont
  %174 = phi i32 [ 2, %printDouble_cont ]
  ret i32 %174
}

declare [0 x i8]* @anydsl_alloc(i32, i64)

declare double @log(double)

declare double @exp(double)

define internal double @sqnorm_27749(i32 %"%d_27841", [0 x double]* %"%v_27805") {
sqnorm_27749_start:
  %"%sum_27782" = alloca double, align 8
  br label %sqnorm

sqnorm:                                           ; preds = %sqnorm_27749_start
  store double 0.000000e+00, double* %"%sum_27782", align 8
  br label %while_head

while_head:                                       ; preds = %while_body, %sqnorm
  %0 = phi i32 [ %3, %while_body ], [ 0, %sqnorm ]
  %1 = icmp slt i32 %0, %"%d_27841"
  br i1 %1, label %while_body, label %break

while_body:                                       ; preds = %while_head
  %2 = zext i32 %0 to i64
  %3 = add nsw i32 1, %0
  %4 = getelementptr inbounds [0 x double], [0 x double]* %"%v_27805", i64 0, i64 %2
  %5 = load double, double* %4, align 8
  %6 = load double, double* %4, align 8
  %7 = load double, double* %"%sum_27782", align 8
  %8 = fmul double %5, %6
  %9 = fadd double %8, %7
  store double %9, double* %"%sum_27782", align 8
  br label %while_head

break:                                            ; preds = %while_head
  %10 = load double, double* %"%sum_27782", align 8
  br label %return

return:                                           ; preds = %break
  %11 = phi double [ %10, %break ]
  ret double %11
}

define internal double @logsumexp_27088([0 x double]* %"%_27206") {
logsumexp_27088_start:
  %"%semx_27236" = alloca double, align 8
  %"%m_27229" = alloca double, align 8
  br label %logsumexp

logsumexp:                                        ; preds = %logsumexp_27088_start
  %0 = getelementptr inbounds [0 x double], [0 x double]* %"%_27206", i64 0, i64 0
  %1 = load double, double* %0, align 8
  store double %1, double* %"%m_27229", align 8
  br label %while_head

while_head:                                       ; preds = %eta_while_head, %logsumexp
  %2 = phi i32 [ %10, %eta_while_head ], [ 1, %logsumexp ]
  %3 = icmp slt i32 %2, 5
  br i1 %3, label %while_body, label %break

while_body:                                       ; preds = %while_head
  %4 = zext i32 %2 to i64
  %5 = load double, double* %"%m_27229", align 8
  %6 = getelementptr inbounds [0 x double], [0 x double]* %"%_27206", i64 0, i64 %4
  %7 = load double, double* %6, align 8
  %8 = fcmp olt double %5, %7
  br i1 %8, label %if_then, label %eta_while_head

if_then:                                          ; preds = %while_body
  %9 = load double, double* %6, align 8
  store double %9, double* %"%m_27229", align 8
  br label %eta_while_head

eta_while_head:                                   ; preds = %if_then, %while_body
  %10 = add nsw i32 1, %2
  br label %while_head

break:                                            ; preds = %while_head
  %11 = load double, double* %"%m_27229", align 8
  store double 0.000000e+00, double* %"%semx_27236", align 8
  br label %while_head1

while_head1:                                      ; preds = %exp_cont, %break
  %12 = phi i32 [ %19, %exp_cont ], [ 0, %break ]
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %while_body2, label %break3

while_body2:                                      ; preds = %while_head1
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds [0 x double], [0 x double]* %"%_27206", i64 0, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fsub double %16, %11
  %18 = call double @exp(double %17)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body2
  %exp = phi double [ %18, %while_body2 ]
  %19 = add nsw i32 1, %12
  %20 = load double, double* %"%semx_27236", align 8
  %21 = fadd double %exp, %20
  store double %21, double* %"%semx_27236", align 8
  br label %while_head1

break3:                                           ; preds = %while_head1
  %22 = load double, double* %"%semx_27236", align 8
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

declare double @lgamma(double)

declare void @printDouble(double)
