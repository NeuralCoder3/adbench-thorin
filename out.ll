; ModuleID = 'out'
source_filename = "out"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"%_31194" = global [14 x i8] c"gmm_d2_K5.txt\00"

define i32 @main() {
main_start:
  %"%out_31894" = alloca double, align 8
  %"%out_31887" = alloca double, align 8
  %"%semx_31774" = alloca double, align 8
  %"%m_31767" = alloca double, align 8
  %"%semx_32749" = alloca double, align 8
  %"%m_32743" = alloca double, align 8
  %"%Lparamsidx_33014" = alloca i32, align 4
  %"%slse_31803" = alloca double, align 8
  %"%wishartGamma_31333" = alloca double, align 8
  %"%wishartM_31325" = alloca i32, align 4
  %"%n_31152" = alloca i32, align 4
  %"%k_31141" = alloca i32, align 4
  %"%d_31130" = alloca i32, align 4
  br label %main

main:                                             ; preds = %main_start
  store i32 2, i32* %"%d_31130", align 4
  store i32 5, i32* %"%k_31141", align 4
  store i32 1000, i32* %"%n_31152", align 4
  call void @read_gmm_size([0 x i8]* bitcast ([14 x i8]* @"%_31194" to [0 x i8]*), i32* %"%d_31130", i32* %"%k_31141", i32* %"%n_31152")
  br label %read_gmm_size_cont

read_gmm_size_cont:                               ; preds = %main
  store i32 0, i32* %"%wishartM_31325", align 4
  store double 1.000000e+00, double* %"%wishartGamma_31333", align 8
  %0 = load i32, i32* %"%k_31141", align 4
  %1 = zext i32 %0 to i64
  %2 = mul i64 %1, 8
  %3 = add i64 0, %2
  %4 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %3)
  %5 = bitcast [0 x i8]* %4 to [0 x double]*
  %6 = load i32, i32* %"%d_31130", align 4
  %7 = load i32, i32* %"%k_31141", align 4
  %8 = mul nsw i32 %6, %7
  %9 = zext i32 %8 to i64
  %10 = mul i64 %9, 8
  %11 = add i64 0, %10
  %12 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %11)
  %13 = bitcast [0 x i8]* %12 to [0 x double]*
  %14 = load i32, i32* %"%k_31141", align 4
  %15 = load i32, i32* %"%d_31130", align 4
  %16 = load i32, i32* %"%d_31130", align 4
  %17 = load i32, i32* %"%d_31130", align 4
  %18 = add nsw i32 -1, %17
  %19 = mul nsw i32 %16, %18
  %20 = sdiv i32 %19, 2
  %21 = add nsw i32 %15, %20
  %22 = mul nsw i32 %14, %21
  %23 = zext i32 %22 to i64
  %24 = mul i64 %23, 8
  %25 = add i64 0, %24
  %26 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %25)
  %27 = bitcast [0 x i8]* %26 to [0 x double]*
  %28 = load i32, i32* %"%n_31152", align 4
  %29 = load i32, i32* %"%d_31130", align 4
  %30 = mul nsw i32 %28, %29
  %31 = zext i32 %30 to i64
  %32 = mul i64 %31, 8
  %33 = add i64 0, %32
  %34 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %33)
  %35 = bitcast [0 x i8]* %34 to [0 x double]*
  call void @read_gmm([0 x i8]* bitcast ([14 x i8]* @"%_31194" to [0 x i8]*), i32* %"%d_31130", i32* %"%k_31141", i32* %"%n_31152", i32* %"%wishartM_31325", double* %"%wishartGamma_31333", [0 x double]* %5, [0 x double]* %13, [0 x double]* %27, [0 x double]* %35)
  br label %read_gmm_cont

read_gmm_cont:                                    ; preds = %read_gmm_size_cont
  %36 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 0
  %37 = load double, double* %36, align 8
  call void @printDouble(double %37)
  br label %printDouble_cont

printDouble_cont:                                 ; preds = %read_gmm_cont
  %38 = load i32, i32* %"%d_31130", align 4
  call void @printInteger(i32 %38)
  br label %printInteger_cont

printInteger_cont:                                ; preds = %printDouble_cont
  %39 = load i32, i32* %"%k_31141", align 4
  call void @printInteger(i32 %39)
  br label %printInteger_cont1

printInteger_cont1:                               ; preds = %printInteger_cont
  %40 = load i32, i32* %"%n_31152", align 4
  call void @printInteger(i32 %40)
  br label %printInteger_cont2

printInteger_cont2:                               ; preds = %printInteger_cont1
  %41 = load i32, i32* %"%d_31130", align 4
  %42 = load i32, i32* %"%k_31141", align 4
  %43 = load i32, i32* %"%n_31152", align 4
  %44 = load i32, i32* %"%wishartM_31325", align 4
  %45 = load double, double* %"%wishartGamma_31333", align 8
  %46 = call double @log(double 6.283180e+00)
  br label %log_cont

log_cont:                                         ; preds = %printInteger_cont2
  %log = phi double [ %46, %printInteger_cont2 ]
  %47 = zext i32 %42 to i64
  %48 = zext i32 %41 to i64
  %49 = add nsw i32 1, %41
  %50 = mul nsw i32 %41, %42
  %51 = zext i32 %50 to i64
  %52 = mul nsw i32 %41, %49
  %53 = sdiv i32 %52, 2
  %54 = mul i64 %51, 8
  %55 = add i64 0, %54
  %56 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %55)
  %57 = bitcast [0 x i8]* %56 to [0 x double]*
  %58 = mul i64 %47, 8
  %59 = add i64 0, %58
  %60 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %59)
  %61 = bitcast [0 x i8]* %60 to [0 x double]*
  %62 = mul i64 %48, 8
  %63 = add i64 0, %62
  %64 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %63)
  %65 = bitcast [0 x i8]* %64 to [0 x double]*
  %66 = mul i64 %48, 8
  %67 = add i64 0, %66
  %68 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %67)
  %69 = bitcast [0 x i8]* %68 to [0 x double]*
  %70 = mul i64 %47, 8
  %71 = add i64 0, %70
  %72 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %71)
  %73 = bitcast [0 x i8]* %72 to [0 x double]*
  %74 = sdiv i32 %52, 2
  br label %while_head

while_head:                                       ; preds = %while_body, %log_cont
  %75 = phi i32 [ %78, %while_body ], [ 0, %log_cont ]
  %76 = icmp slt i32 %75, %42
  br i1 %76, label %while_body, label %preprocess_qs_cont

while_body:                                       ; preds = %while_head
  %77 = zext i32 %75 to i64
  %78 = add nsw i32 1, %75
  %79 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %77
  store double 0.000000e+00, double* %79, align 8
  br label %while_head

preprocess_qs_cont:                               ; preds = %while_head
  %80 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 0
  store double 0.000000e+00, double* %"%slse_31803", align 8
  br label %while_head3

while_head3:                                      ; preds = %log_cont23, %preprocess_qs_cont
  %81 = phi i32 [ %176, %log_cont23 ], [ 0, %preprocess_qs_cont ]
  %82 = icmp slt i32 %81, %43
  br i1 %82, label %while_body4, label %break25

while_body4:                                      ; preds = %while_head3
  %83 = mul nsw i32 %41, %81
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds [0 x double], [0 x double]* %35, i64 0, i64 %84
  %86 = bitcast double* %85 to [0 x double]*
  br label %while_head5

while_head5:                                      ; preds = %sqnorm_cont, %while_body4
  %87 = phi i32 [ %146, %sqnorm_cont ], [ 0, %while_body4 ]
  %88 = icmp slt i32 %87, %42
  br i1 %88, label %while_body6, label %break15

while_body6:                                      ; preds = %while_head5
  %89 = mul nsw i32 %41, %87
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 %90
  %92 = bitcast double* %91 to [0 x double]*
  br label %while_head7

while_head7:                                      ; preds = %while_body8, %while_body6
  %93 = phi i32 [ %96, %while_body8 ], [ 0, %while_body6 ]
  %94 = icmp slt i32 %93, %41
  br i1 %94, label %while_body8, label %subtract_cont

while_body8:                                      ; preds = %while_head7
  %95 = zext i32 %93 to i64
  %96 = add nsw i32 1, %93
  %97 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %95
  %98 = getelementptr inbounds [0 x double], [0 x double]* %86, i64 0, i64 %95
  %99 = getelementptr inbounds [0 x double], [0 x double]* %92, i64 0, i64 %95
  %100 = load double, double* %98, align 8
  %101 = load double, double* %99, align 8
  %102 = fsub double %100, %101
  store double %102, double* %97, align 8
  br label %while_head7

subtract_cont:                                    ; preds = %while_head7
  %103 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %90
  %104 = bitcast double* %103 to [0 x double]*
  br label %while_head9

while_head9:                                      ; preds = %while_body10, %subtract_cont
  %105 = phi i32 [ %108, %while_body10 ], [ 0, %subtract_cont ]
  %106 = icmp slt i32 %105, %41
  br i1 %106, label %while_body10, label %break

while_body10:                                     ; preds = %while_head9
  %107 = zext i32 %105 to i64
  %108 = add nsw i32 1, %105
  %109 = getelementptr inbounds [0 x double], [0 x double]* %69, i64 0, i64 %107
  %110 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %107
  %111 = getelementptr inbounds [0 x double], [0 x double]* %104, i64 0, i64 %107
  %112 = load double, double* %111, align 8
  %113 = load double, double* %110, align 8
  %114 = fmul double %112, %113
  store double %114, double* %109, align 8
  br label %while_head9

break:                                            ; preds = %while_head9
  %115 = mul nsw i32 %87, %53
  %116 = add nsw i32 %41, %115
  %117 = zext i32 %116 to i64
  store i32 0, i32* %"%Lparamsidx_33014", align 4
  %118 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %117
  %119 = bitcast double* %118 to [0 x double]*
  br label %while_head11

while_head11:                                     ; preds = %eta_while_head, %break
  %120 = phi i32 [ %122, %eta_while_head ], [ 0, %break ]
  %121 = icmp slt i32 %120, %41
  br i1 %121, label %while_body12, label %Qtimesx_cont

while_body12:                                     ; preds = %while_head11
  %122 = add nsw i32 1, %120
  %123 = zext i32 %120 to i64
  %124 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %123
  br label %while_head13

while_head13:                                     ; preds = %while_body14, %while_body12
  %125 = phi i32 [ %127, %while_body14 ], [ %122, %while_body12 ]
  %126 = icmp slt i32 %125, %41
  br i1 %126, label %while_body14, label %eta_while_head

while_body14:                                     ; preds = %while_head13
  %127 = add nsw i32 1, %125
  %128 = zext i32 %125 to i64
  %129 = getelementptr inbounds [0 x double], [0 x double]* %69, i64 0, i64 %128
  %130 = load double, double* %129, align 8
  %131 = load i32, i32* %"%Lparamsidx_33014", align 4
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds [0 x double], [0 x double]* %119, i64 0, i64 %132
  %134 = load double, double* %133, align 8
  %135 = load double, double* %124, align 8
  %136 = fmul double %134, %135
  %137 = fadd double %130, %136
  store double %137, double* %129, align 8
  %138 = load i32, i32* %"%Lparamsidx_33014", align 4
  %139 = add nsw i32 1, %138
  store i32 %139, i32* %"%Lparamsidx_33014", align 4
  br label %while_head13

eta_while_head:                                   ; preds = %while_head13
  br label %while_head11

Qtimesx_cont:                                     ; preds = %while_head11
  %140 = zext i32 %87 to i64
  %141 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %140
  %142 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %140
  %143 = load double, double* %142, align 8
  %144 = load double, double* %141, align 8
  %145 = call double @sqnorm_32114(i32 %41, [0 x double]* %69)
  br label %sqnorm_cont

sqnorm_cont:                                      ; preds = %Qtimesx_cont
  %sqnorm = phi double [ %145, %Qtimesx_cont ]
  %146 = add nsw i32 1, %87
  %147 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 %140
  %148 = fadd double %143, %144
  %149 = fmul double 5.000000e-01, %sqnorm
  %150 = fsub double %148, %149
  store double %150, double* %147, align 8
  br label %while_head5

break15:                                          ; preds = %while_head5
  %151 = load double, double* %80, align 8
  store double %151, double* %"%m_32743", align 8
  br label %while_head16

while_head16:                                     ; preds = %eta_while_head18, %break15
  %152 = phi i32 [ %160, %eta_while_head18 ], [ 1, %break15 ]
  %153 = icmp slt i32 %152, %42
  br i1 %153, label %while_body17, label %break19

while_body17:                                     ; preds = %while_head16
  %154 = zext i32 %152 to i64
  %155 = load double, double* %"%m_32743", align 8
  %156 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 %154
  %157 = load double, double* %156, align 8
  %158 = fcmp olt double %155, %157
  br i1 %158, label %if_then, label %eta_while_head18

if_then:                                          ; preds = %while_body17
  %159 = load double, double* %156, align 8
  store double %159, double* %"%m_32743", align 8
  br label %eta_while_head18

eta_while_head18:                                 ; preds = %if_then, %while_body17
  %160 = add nsw i32 1, %152
  br label %while_head16

break19:                                          ; preds = %while_head16
  %161 = load double, double* %"%m_32743", align 8
  store double 0.000000e+00, double* %"%semx_32749", align 8
  br label %while_head20

while_head20:                                     ; preds = %exp_cont, %break19
  %162 = phi i32 [ %169, %exp_cont ], [ 0, %break19 ]
  %163 = icmp slt i32 %162, %42
  br i1 %163, label %while_body21, label %break22

while_body21:                                     ; preds = %while_head20
  %164 = zext i32 %162 to i64
  %165 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 %164
  %166 = load double, double* %165, align 8
  %167 = fsub double %166, %161
  %168 = call double @exp(double %167)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body21
  %exp = phi double [ %168, %while_body21 ]
  %169 = add nsw i32 1, %162
  %170 = load double, double* %"%semx_32749", align 8
  %171 = fadd double %exp, %170
  store double %171, double* %"%semx_32749", align 8
  br label %while_head20

break22:                                          ; preds = %while_head20
  %172 = load double, double* %"%semx_32749", align 8
  %173 = call double @log(double %172)
  br label %log_cont23

log_cont23:                                       ; preds = %break22
  %log24 = phi double [ %173, %break22 ]
  %174 = fadd double %161, %log24
  %175 = load double, double* %"%slse_31803", align 8
  %176 = add nsw i32 1, %81
  %177 = fadd double %174, %175
  store double %177, double* %"%slse_31803", align 8
  br label %while_head3

break25:                                          ; preds = %while_head3
  %178 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 0
  %179 = load double, double* %178, align 8
  store double %179, double* %"%m_31767", align 8
  br label %while_head26

while_head26:                                     ; preds = %eta_while_head29, %break25
  %180 = phi i32 [ %188, %eta_while_head29 ], [ 1, %break25 ]
  %181 = icmp slt i32 %180, %42
  br i1 %181, label %while_body27, label %break30

while_body27:                                     ; preds = %while_head26
  %182 = zext i32 %180 to i64
  %183 = load double, double* %"%m_31767", align 8
  %184 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %182
  %185 = load double, double* %184, align 8
  %186 = fcmp olt double %183, %185
  br i1 %186, label %if_then28, label %eta_while_head29

if_then28:                                        ; preds = %while_body27
  %187 = load double, double* %184, align 8
  store double %187, double* %"%m_31767", align 8
  br label %eta_while_head29

eta_while_head29:                                 ; preds = %if_then28, %while_body27
  %188 = add nsw i32 1, %180
  br label %while_head26

break30:                                          ; preds = %while_head26
  %189 = load double, double* %"%m_31767", align 8
  store double 0.000000e+00, double* %"%semx_31774", align 8
  br label %while_head31

while_head31:                                     ; preds = %exp_cont33, %break30
  %190 = phi i32 [ %197, %exp_cont33 ], [ 0, %break30 ]
  %191 = icmp slt i32 %190, %42
  br i1 %191, label %while_body32, label %break35

while_body32:                                     ; preds = %while_head31
  %192 = zext i32 %190 to i64
  %193 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %192
  %194 = load double, double* %193, align 8
  %195 = fsub double %194, %189
  %196 = call double @exp(double %195)
  br label %exp_cont33

exp_cont33:                                       ; preds = %while_body32
  %exp34 = phi double [ %196, %while_body32 ]
  %197 = add nsw i32 1, %190
  %198 = load double, double* %"%semx_31774", align 8
  %199 = fadd double %exp34, %198
  store double %199, double* %"%semx_31774", align 8
  br label %while_head31

break35:                                          ; preds = %while_head31
  %200 = load double, double* %"%semx_31774", align 8
  %201 = call double @log(double %200)
  br label %log_cont36

log_cont36:                                       ; preds = %break35
  %log37 = phi double [ %201, %break35 ]
  %202 = load double, double* %"%slse_31803", align 8
  %203 = sdiv i32 %52, 2
  %204 = call double @log(double %45)
  br label %log_cont38

log_cont38:                                       ; preds = %log_cont36
  %log39 = phi double [ %204, %log_cont36 ]
  %205 = call double @log(double 2.000000e+00)
  br label %log_cont40

log_cont40:                                       ; preds = %log_cont38
  %log41 = phi double [ %205, %log_cont38 ]
  %206 = call double @log(double 3.141590e+00)
  br label %log_cont42

log_cont42:                                       ; preds = %log_cont40
  %log43 = phi double [ %206, %log_cont40 ]
  %207 = add nsw i32 -1, %41
  %208 = add nsw i32 %41, %44
  %209 = mul nsw i32 %41, %207
  %210 = add nsw i32 1, %208
  %211 = sitofp i32 %209 to double
  %212 = sitofp i32 %210 to double
  %213 = fmul double 2.500000e-01, %211
  %214 = fmul double 5.000000e-01, %212
  %215 = fmul double %213, %log43
  store double %215, double* %"%out_31887", align 8
  br label %while_head44

while_head44:                                     ; preds = %lgamma_cont, %log_cont42
  %216 = phi i32 [ %223, %lgamma_cont ], [ 1, %log_cont42 ]
  %217 = icmp slt i32 %216, %49
  br i1 %217, label %while_body45, label %break46

while_body45:                                     ; preds = %while_head44
  %218 = sub nsw i32 1, %216
  %219 = sitofp i32 %218 to double
  %220 = fmul double 5.000000e-01, %219
  %221 = fadd double %214, %220
  %222 = call double @lgamma(double %221)
  br label %lgamma_cont

lgamma_cont:                                      ; preds = %while_body45
  %lgamma = phi double [ %222, %while_body45 ]
  %223 = add nsw i32 1, %216
  %224 = load double, double* %"%out_31887", align 8
  %225 = fadd double %lgamma, %224
  store double %225, double* %"%out_31887", align 8
  br label %while_head44

break46:                                          ; preds = %while_head44
  %226 = sitofp i32 %44 to double
  %227 = fmul double 5.000000e-01, %45
  %228 = fmul double %45, %227
  %229 = load double, double* %"%out_31887", align 8
  %230 = sub nsw i32 %203, %41
  store double 0.000000e+00, double* %"%out_31894", align 8
  br label %while_head47

while_head47:                                     ; preds = %sqnorm_cont51, %break46
  %231 = phi i32 [ %245, %sqnorm_cont51 ], [ 0, %break46 ]
  %232 = icmp slt i32 %231, %42
  br i1 %232, label %while_body48, label %break53

while_body48:                                     ; preds = %while_head47
  %233 = mul nsw i32 %41, %231
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %234
  %236 = bitcast double* %235 to [0 x double]*
  %237 = call double @sqnorm_32114(i32 %41, [0 x double]* %236)
  br label %sqnorm_cont49

sqnorm_cont49:                                    ; preds = %while_body48
  %sqnorm50 = phi double [ %237, %while_body48 ]
  %238 = mul nsw i32 %231, %203
  %239 = add nsw i32 %41, %238
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %240
  %242 = bitcast double* %241 to [0 x double]*
  %243 = call double @sqnorm_32114(i32 %230, [0 x double]* %242)
  br label %sqnorm_cont51

sqnorm_cont51:                                    ; preds = %sqnorm_cont49
  %sqnorm52 = phi double [ %243, %sqnorm_cont49 ]
  %244 = zext i32 %231 to i64
  %245 = add nsw i32 1, %231
  %246 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %244
  %247 = fadd double %sqnorm50, %sqnorm52
  %248 = load double, double* %246, align 8
  %249 = fmul double %228, %247
  %250 = load double, double* %"%out_31894", align 8
  %251 = fmul double %226, %248
  %252 = fsub double %249, %251
  %253 = fadd double %252, %250
  store double %253, double* %"%out_31894", align 8
  br label %while_head47

break53:                                          ; preds = %while_head47
  %254 = sitofp i32 %42 to double
  %255 = sitofp i32 %43 to double
  %256 = load double, double* %"%out_31894", align 8
  %257 = sitofp i32 %41 to double
  %258 = fsub double -0.000000e+00, %255
  %259 = fadd double %189, %log37
  %260 = fmul double 5.000000e-01, %log41
  %261 = fmul double %258, %257
  %262 = fmul double %257, %212
  %263 = fmul double %255, %259
  %264 = fsub double %log39, %260
  %265 = fmul double 5.000000e-01, %261
  %266 = fmul double %262, %264
  %267 = fmul double %265, %log
  %268 = fsub double %266, %229
  %269 = fadd double %267, %202
  %270 = fmul double %254, %268
  %271 = fsub double %269, %263
  %272 = fsub double %256, %270
  %273 = fadd double %271, %272
  call void @printDouble(double %273)
  br label %runGmmBenchmark_cont

runGmmBenchmark_cont:                             ; preds = %break53
  br label %return

return:                                           ; preds = %runGmmBenchmark_cont
  %274 = phi i32 [ 0, %runGmmBenchmark_cont ]
  ret i32 %274
}

declare void @read_gmm_size([0 x i8]*, i32*, i32*, i32*)

declare [0 x i8]* @anydsl_alloc(i32, i64)

declare void @read_gmm([0 x i8]*, i32*, i32*, i32*, i32*, double*, [0 x double]*, [0 x double]*, [0 x double]*, [0 x double]*)

declare void @printDouble(double)

declare void @printInteger(i32)

declare double @log(double)

define internal double @sqnorm_32114(i32 %"%d_32222", [0 x double]* %"%v_32170") {
sqnorm_32114_start:
  %"%sum_32147" = alloca double, align 8
  br label %sqnorm

sqnorm:                                           ; preds = %sqnorm_32114_start
  store double 0.000000e+00, double* %"%sum_32147", align 8
  br label %while_head

while_head:                                       ; preds = %while_body, %sqnorm
  %0 = phi i32 [ %3, %while_body ], [ 0, %sqnorm ]
  %1 = icmp slt i32 %0, %"%d_32222"
  br i1 %1, label %while_body, label %break

while_body:                                       ; preds = %while_head
  %2 = zext i32 %0 to i64
  %3 = add nsw i32 1, %0
  %4 = getelementptr inbounds [0 x double], [0 x double]* %"%v_32170", i64 0, i64 %2
  %5 = load double, double* %4, align 8
  %6 = load double, double* %4, align 8
  %7 = load double, double* %"%sum_32147", align 8
  %8 = fmul double %5, %6
  %9 = fadd double %8, %7
  store double %9, double* %"%sum_32147", align 8
  br label %while_head

break:                                            ; preds = %while_head
  %10 = load double, double* %"%sum_32147", align 8
  br label %return

return:                                           ; preds = %break
  %11 = phi double [ %10, %break ]
  ret double %11
}

declare double @exp(double)

declare double @lgamma(double)
