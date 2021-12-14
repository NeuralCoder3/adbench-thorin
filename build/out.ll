; ModuleID = 'build/out'
source_filename = "build/out"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin21.1.0"

@"%_32397" = global [24 x i8] c"benchmark/gmm_d2_K5.txt\00"

define i32 @main() {
main_start:
  %"%out_33353" = alloca double, align 8
  %"%out_33346" = alloca double, align 8
  %"%Lparamsidx_34149" = alloca i32, align 4
  %"%slse_33262" = alloca double, align 8
  %"%wishartGamma_32536" = alloca double, align 8
  %"%wishartM_32528" = alloca i32, align 4
  %"%n_32346" = alloca i32, align 4
  %"%k_32335" = alloca i32, align 4
  %"%d_32324" = alloca i32, align 4
  br label %main

main:                                             ; preds = %main_start
  store i32 2, i32* %"%d_32324", align 4
  store i32 5, i32* %"%k_32335", align 4
  store i32 1000, i32* %"%n_32346", align 4
  call void @read_gmm_size([0 x i8]* bitcast ([24 x i8]* @"%_32397" to [0 x i8]*), i32* %"%d_32324", i32* %"%k_32335", i32* %"%n_32346")
  br label %read_gmm_size_cont

read_gmm_size_cont:                               ; preds = %main
  store i32 0, i32* %"%wishartM_32528", align 4
  store double 1.000000e+00, double* %"%wishartGamma_32536", align 8
  %0 = load i32, i32* %"%k_32335", align 4
  %1 = zext i32 %0 to i64
  %2 = mul i64 %1, 8
  %3 = add i64 0, %2
  %4 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %3)
  %5 = bitcast [0 x i8]* %4 to [0 x double]*
  %6 = load i32, i32* %"%d_32324", align 4
  %7 = load i32, i32* %"%k_32335", align 4
  %8 = mul nsw i32 %6, %7
  %9 = zext i32 %8 to i64
  %10 = mul i64 %9, 8
  %11 = add i64 0, %10
  %12 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %11)
  %13 = bitcast [0 x i8]* %12 to [0 x double]*
  %14 = load i32, i32* %"%k_32335", align 4
  %15 = load i32, i32* %"%d_32324", align 4
  %16 = load i32, i32* %"%d_32324", align 4
  %17 = load i32, i32* %"%d_32324", align 4
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
  %28 = load i32, i32* %"%n_32346", align 4
  %29 = load i32, i32* %"%d_32324", align 4
  %30 = mul nsw i32 %28, %29
  %31 = zext i32 %30 to i64
  %32 = mul i64 %31, 8
  %33 = add i64 0, %32
  %34 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %33)
  %35 = bitcast [0 x i8]* %34 to [0 x double]*
  call void @read_gmm([0 x i8]* bitcast ([24 x i8]* @"%_32397" to [0 x i8]*), i32* %"%d_32324", i32* %"%k_32335", i32* %"%n_32346", i32* %"%wishartM_32528", double* %"%wishartGamma_32536", [0 x double]* %5, [0 x double]* %13, [0 x double]* %27, [0 x double]* %35)
  br label %read_gmm_cont

read_gmm_cont:                                    ; preds = %read_gmm_size_cont
  %36 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 0
  %37 = load double, double* %36, align 8
  call void @printDouble(double %37)
  br label %printDouble_cont

printDouble_cont:                                 ; preds = %read_gmm_cont
  %38 = load i32, i32* %"%d_32324", align 4
  call void @printInteger(i32 %38)
  br label %printInteger_cont

printInteger_cont:                                ; preds = %printDouble_cont
  %39 = load i32, i32* %"%k_32335", align 4
  call void @printInteger(i32 %39)
  br label %printInteger_cont1

printInteger_cont1:                               ; preds = %printInteger_cont
  %40 = load i32, i32* %"%n_32346", align 4
  call void @printInteger(i32 %40)
  br label %printInteger_cont2

printInteger_cont2:                               ; preds = %printInteger_cont1
  %41 = load i32, i32* %"%d_32324", align 4
  %42 = load i32, i32* %"%k_32335", align 4
  %43 = load i32, i32* %"%n_32346", align 4
  %44 = load i32, i32* %"%wishartM_32528", align 4
  %45 = load double, double* %"%wishartGamma_32536", align 8
  %46 = call double @log(double 6.283180e+00)
  br label %log_cont

log_cont:                                         ; preds = %printInteger_cont2
  %log = phi double [ %46, %printInteger_cont2 ]
  %47 = zext i32 %42 to i64
  %48 = zext i32 %41 to i64
  %49 = mul nsw i32 %42, %41
  %50 = zext i32 %49 to i64
  %51 = add nsw i32 1, %41
  %52 = mul nsw i32 %41, %51
  %53 = sdiv i32 %52, 2
  %54 = mul i64 %50, 8
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

while_head:                                       ; preds = %eta_while_head, %log_cont
  %75 = phi i32 [ %94, %eta_while_head ], [ 0, %log_cont ]
  %76 = icmp slt i32 %75, %42
  br i1 %76, label %while_body, label %preprocess_qs_cont

while_body:                                       ; preds = %while_head
  %77 = zext i32 %75 to i64
  %78 = mul nsw i32 %75, %74
  %79 = mul nsw i32 %41, %75
  %80 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %77
  store double 0.000000e+00, double* %80, align 8
  br label %while_head3

while_head3:                                      ; preds = %exp_cont, %while_body
  %81 = phi i32 [ %92, %exp_cont ], [ 0, %while_body ]
  %82 = icmp slt i32 %81, %41
  br i1 %82, label %while_body4, label %eta_while_head

while_body4:                                      ; preds = %while_head3
  %83 = add nsw i32 %81, %78
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %84
  %86 = load double, double* %85, align 8
  %87 = load double, double* %80, align 8
  %88 = fadd double %86, %87
  store double %88, double* %80, align 8
  %89 = call double @exp(double %86)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body4
  %exp = phi double [ %89, %while_body4 ]
  %90 = add nsw i32 %81, %79
  %91 = zext i32 %90 to i64
  %92 = add nsw i32 1, %81
  %93 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %91
  store double %exp, double* %93, align 8
  br label %while_head3

eta_while_head:                                   ; preds = %while_head3
  %94 = add nsw i32 1, %75
  br label %while_head

preprocess_qs_cont:                               ; preds = %while_head
  store double 0.000000e+00, double* %"%slse_33262", align 8
  br label %while_head5

while_head5:                                      ; preds = %logsumexp_cont, %preprocess_qs_cont
  %95 = phi i32 [ %166, %logsumexp_cont ], [ 0, %preprocess_qs_cont ]
  %96 = icmp slt i32 %95, %43
  br i1 %96, label %while_body6, label %break19

while_body6:                                      ; preds = %while_head5
  %97 = mul nsw i32 %41, %95
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds [0 x double], [0 x double]* %35, i64 0, i64 %98
  %100 = bitcast double* %99 to [0 x double]*
  br label %while_head7

while_head7:                                      ; preds = %sqnorm_cont, %while_body6
  %101 = phi i32 [ %161, %sqnorm_cont ], [ 0, %while_body6 ]
  %102 = icmp slt i32 %101, %42
  br i1 %102, label %while_body8, label %break18

while_body8:                                      ; preds = %while_head7
  %103 = mul nsw i32 %41, %101
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 %104
  %106 = bitcast double* %105 to [0 x double]*
  br label %while_head9

while_head9:                                      ; preds = %while_body10, %while_body8
  %107 = phi i32 [ %110, %while_body10 ], [ 0, %while_body8 ]
  %108 = icmp slt i32 %107, %41
  br i1 %108, label %while_body10, label %subtract_cont

while_body10:                                     ; preds = %while_head9
  %109 = zext i32 %107 to i64
  %110 = add nsw i32 1, %107
  %111 = getelementptr inbounds [0 x double], [0 x double]* %100, i64 0, i64 %109
  %112 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %109
  %113 = getelementptr inbounds [0 x double], [0 x double]* %106, i64 0, i64 %109
  %114 = load double, double* %111, align 8
  %115 = load double, double* %113, align 8
  %116 = fsub double %114, %115
  store double %116, double* %112, align 8
  br label %while_head9

subtract_cont:                                    ; preds = %while_head9
  %117 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %104
  %118 = bitcast double* %117 to [0 x double]*
  br label %while_head11

while_head11:                                     ; preds = %while_body12, %subtract_cont
  %119 = phi i32 [ %125, %while_body12 ], [ 0, %subtract_cont ]
  %120 = icmp slt i32 %119, %41
  br i1 %120, label %while_body12, label %break

while_body12:                                     ; preds = %while_head11
  %121 = zext i32 %119 to i64
  %122 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %121
  %123 = getelementptr inbounds [0 x double], [0 x double]* %118, i64 0, i64 %121
  %124 = getelementptr inbounds [0 x double], [0 x double]* %69, i64 0, i64 %121
  %125 = add nsw i32 1, %119
  %126 = load double, double* %123, align 8
  %127 = load double, double* %122, align 8
  %128 = fmul double %126, %127
  store double %128, double* %124, align 8
  br label %while_head11

break:                                            ; preds = %while_head11
  %129 = mul nsw i32 %101, %53
  %130 = add nsw i32 %41, %129
  %131 = zext i32 %130 to i64
  store i32 0, i32* %"%Lparamsidx_34149", align 4
  %132 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %131
  %133 = bitcast double* %132 to [0 x double]*
  br label %while_head13

while_head13:                                     ; preds = %eta_while_head17, %break
  %134 = phi i32 [ %138, %eta_while_head17 ], [ 0, %break ]
  %135 = icmp slt i32 %134, %41
  br i1 %135, label %while_body14, label %Qtimesx_cont

while_body14:                                     ; preds = %while_head13
  %136 = zext i32 %134 to i64
  %137 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %136
  %138 = add nsw i32 1, %134
  br label %while_head15

while_head15:                                     ; preds = %while_body16, %while_body14
  %139 = phi i32 [ %141, %while_body16 ], [ %138, %while_body14 ]
  %140 = icmp slt i32 %139, %41
  br i1 %140, label %while_body16, label %eta_while_head17

while_body16:                                     ; preds = %while_head15
  %141 = add nsw i32 1, %139
  %142 = zext i32 %139 to i64
  %143 = getelementptr inbounds [0 x double], [0 x double]* %69, i64 0, i64 %142
  %144 = load double, double* %143, align 8
  %145 = load i32, i32* %"%Lparamsidx_34149", align 4
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds [0 x double], [0 x double]* %133, i64 0, i64 %146
  %148 = load double, double* %147, align 8
  %149 = load double, double* %137, align 8
  %150 = fmul double %148, %149
  %151 = fadd double %144, %150
  store double %151, double* %143, align 8
  %152 = load i32, i32* %"%Lparamsidx_34149", align 4
  %153 = add nsw i32 1, %152
  store i32 %153, i32* %"%Lparamsidx_34149", align 4
  br label %while_head15

eta_while_head17:                                 ; preds = %while_head15
  br label %while_head13

Qtimesx_cont:                                     ; preds = %while_head13
  %154 = zext i32 %101 to i64
  %155 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %154
  %156 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %154
  %157 = load double, double* %156, align 8
  %158 = load double, double* %155, align 8
  %159 = call double @sqnorm_33536(i32 %41, [0 x double]* %69)
  br label %sqnorm_cont

sqnorm_cont:                                      ; preds = %Qtimesx_cont
  %sqnorm = phi double [ %159, %Qtimesx_cont ]
  %160 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 %154
  %161 = add nsw i32 1, %101
  %162 = fadd double %157, %158
  %163 = fmul double 5.000000e-01, %sqnorm
  %164 = fsub double %162, %163
  store double %164, double* %160, align 8
  br label %while_head7

break18:                                          ; preds = %while_head7
  %165 = call double @logsumexp_32940(i32 %42, [0 x double]* %73)
  br label %logsumexp_cont

logsumexp_cont:                                   ; preds = %break18
  %logsumexp = phi double [ %165, %break18 ]
  %166 = add nsw i32 1, %95
  %167 = load double, double* %"%slse_33262", align 8
  %168 = fadd double %logsumexp, %167
  store double %168, double* %"%slse_33262", align 8
  br label %while_head5

break19:                                          ; preds = %while_head5
  %169 = call double @logsumexp_32940(i32 %42, [0 x double]* %5)
  br label %logsumexp_cont20

logsumexp_cont20:                                 ; preds = %break19
  %logsumexp21 = phi double [ %169, %break19 ]
  %170 = load double, double* %"%slse_33262", align 8
  %171 = sdiv i32 %52, 2
  %172 = call double @log(double %45)
  br label %log_cont22

log_cont22:                                       ; preds = %logsumexp_cont20
  %log23 = phi double [ %172, %logsumexp_cont20 ]
  %173 = call double @log(double 2.000000e+00)
  br label %log_cont24

log_cont24:                                       ; preds = %log_cont22
  %log25 = phi double [ %173, %log_cont22 ]
  %174 = call double @log(double 3.141590e+00)
  br label %log_cont26

log_cont26:                                       ; preds = %log_cont24
  %log27 = phi double [ %174, %log_cont24 ]
  %175 = add nsw i32 -1, %41
  %176 = add nsw i32 %41, %44
  %177 = mul nsw i32 %41, %175
  %178 = add nsw i32 1, %176
  %179 = sitofp i32 %177 to double
  %180 = sitofp i32 %178 to double
  %181 = fmul double 2.500000e-01, %179
  %182 = fmul double 5.000000e-01, %180
  %183 = fmul double %181, %log27
  store double %183, double* %"%out_33346", align 8
  br label %while_head28

while_head28:                                     ; preds = %lgamma_cont, %log_cont26
  %184 = phi i32 [ %191, %lgamma_cont ], [ 1, %log_cont26 ]
  %185 = icmp slt i32 %184, %51
  br i1 %185, label %while_body29, label %break30

while_body29:                                     ; preds = %while_head28
  %186 = sub nsw i32 1, %184
  %187 = sitofp i32 %186 to double
  %188 = fmul double 5.000000e-01, %187
  %189 = fadd double %182, %188
  %190 = call double @lgamma(double %189)
  br label %lgamma_cont

lgamma_cont:                                      ; preds = %while_body29
  %lgamma = phi double [ %190, %while_body29 ]
  %191 = add nsw i32 1, %184
  %192 = load double, double* %"%out_33346", align 8
  %193 = fadd double %lgamma, %192
  store double %193, double* %"%out_33346", align 8
  br label %while_head28

break30:                                          ; preds = %while_head28
  %194 = sitofp i32 %44 to double
  %195 = fmul double 5.000000e-01, %45
  %196 = fmul double %45, %195
  %197 = load double, double* %"%out_33346", align 8
  %198 = sub nsw i32 %171, %41
  store double 0.000000e+00, double* %"%out_33353", align 8
  br label %while_head31

while_head31:                                     ; preds = %sqnorm_cont35, %break30
  %199 = phi i32 [ %213, %sqnorm_cont35 ], [ 0, %break30 ]
  %200 = icmp slt i32 %199, %42
  br i1 %200, label %while_body32, label %break37

while_body32:                                     ; preds = %while_head31
  %201 = mul nsw i32 %41, %199
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %202
  %204 = bitcast double* %203 to [0 x double]*
  %205 = call double @sqnorm_33536(i32 %41, [0 x double]* %204)
  br label %sqnorm_cont33

sqnorm_cont33:                                    ; preds = %while_body32
  %sqnorm34 = phi double [ %205, %while_body32 ]
  %206 = mul nsw i32 %199, %171
  %207 = add nsw i32 %41, %206
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %208
  %210 = bitcast double* %209 to [0 x double]*
  %211 = call double @sqnorm_33536(i32 %198, [0 x double]* %210)
  br label %sqnorm_cont35

sqnorm_cont35:                                    ; preds = %sqnorm_cont33
  %sqnorm36 = phi double [ %211, %sqnorm_cont33 ]
  %212 = zext i32 %199 to i64
  %213 = add nsw i32 1, %199
  %214 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %212
  %215 = fadd double %sqnorm34, %sqnorm36
  %216 = load double, double* %214, align 8
  %217 = fmul double %196, %215
  %218 = load double, double* %"%out_33353", align 8
  %219 = fmul double %194, %216
  %220 = fsub double %217, %219
  %221 = fadd double %220, %218
  store double %221, double* %"%out_33353", align 8
  br label %while_head31

break37:                                          ; preds = %while_head31
  %222 = sitofp i32 %41 to double
  %223 = sitofp i32 %42 to double
  %224 = sitofp i32 %43 to double
  %225 = fmul double %222, %180
  %226 = fmul double %224, %logsumexp21
  %227 = fsub double -0.000000e+00, %224
  %228 = load double, double* %"%out_33353", align 8
  %229 = fmul double 5.000000e-01, %log25
  %230 = fmul double %227, %222
  %231 = fsub double %log23, %229
  %232 = fmul double 5.000000e-01, %230
  %233 = fmul double %225, %231
  %234 = fmul double %232, %log
  %235 = fsub double %233, %197
  %236 = fadd double %234, %170
  %237 = fmul double %223, %235
  %238 = fsub double %236, %226
  %239 = fsub double %228, %237
  %240 = fadd double %238, %239
  call void @printDouble(double %240)
  br label %runGmmBenchmark_cont

runGmmBenchmark_cont:                             ; preds = %break37
  br label %return

return:                                           ; preds = %runGmmBenchmark_cont
  %241 = phi i32 [ 0, %runGmmBenchmark_cont ]
  ret i32 %241
}

declare void @read_gmm_size([0 x i8]*, i32*, i32*, i32*)

declare [0 x i8]* @anydsl_alloc(i32, i64)

declare void @read_gmm([0 x i8]*, i32*, i32*, i32*, i32*, double*, [0 x double]*, [0 x double]*, [0 x double]*, [0 x double]*)

declare void @printDouble(double)

declare void @printInteger(i32)

declare double @log(double)

declare double @exp(double)

define internal double @sqnorm_33536(i32 %"%d_33623", [0 x double]* %"%v_33588") {
sqnorm_33536_start:
  %"%sum_33566" = alloca double, align 8
  br label %sqnorm

sqnorm:                                           ; preds = %sqnorm_33536_start
  store double 0.000000e+00, double* %"%sum_33566", align 8
  br label %while_head

while_head:                                       ; preds = %while_body, %sqnorm
  %0 = phi i32 [ %3, %while_body ], [ 0, %sqnorm ]
  %1 = icmp slt i32 %0, %"%d_33623"
  br i1 %1, label %while_body, label %break

while_body:                                       ; preds = %while_head
  %2 = zext i32 %0 to i64
  %3 = add nsw i32 1, %0
  %4 = getelementptr inbounds [0 x double], [0 x double]* %"%v_33588", i64 0, i64 %2
  %5 = load double, double* %4, align 8
  %6 = load double, double* %4, align 8
  %7 = load double, double* %"%sum_33566", align 8
  %8 = fmul double %5, %6
  %9 = fadd double %8, %7
  store double %9, double* %"%sum_33566", align 8
  br label %while_head

break:                                            ; preds = %while_head
  %10 = load double, double* %"%sum_33566", align 8
  br label %return

return:                                           ; preds = %break
  %11 = phi double [ %10, %break ]
  ret double %11
}

define internal double @logsumexp_32940(i32 %"%n_33133", [0 x double]* %"%x_32986") {
logsumexp_32940_start:
  %"%semx_33001" = alloca double, align 8
  %"%m_32994" = alloca double, align 8
  br label %logsumexp

logsumexp:                                        ; preds = %logsumexp_32940_start
  %0 = getelementptr inbounds [0 x double], [0 x double]* %"%x_32986", i64 0, i64 0
  %1 = load double, double* %0, align 8
  store double %1, double* %"%m_32994", align 8
  br label %while_head

while_head:                                       ; preds = %eta_while_head, %logsumexp
  %2 = phi i32 [ %10, %eta_while_head ], [ 1, %logsumexp ]
  %3 = icmp slt i32 %2, %"%n_33133"
  br i1 %3, label %while_body, label %break

while_body:                                       ; preds = %while_head
  %4 = zext i32 %2 to i64
  %5 = load double, double* %"%m_32994", align 8
  %6 = getelementptr inbounds [0 x double], [0 x double]* %"%x_32986", i64 0, i64 %4
  %7 = load double, double* %6, align 8
  %8 = fcmp olt double %5, %7
  br i1 %8, label %if_then, label %eta_while_head

if_then:                                          ; preds = %while_body
  %9 = load double, double* %6, align 8
  store double %9, double* %"%m_32994", align 8
  br label %eta_while_head

eta_while_head:                                   ; preds = %if_then, %while_body
  %10 = add nsw i32 1, %2
  br label %while_head

break:                                            ; preds = %while_head
  %11 = load double, double* %"%m_32994", align 8
  store double 0.000000e+00, double* %"%semx_33001", align 8
  br label %while_head1

while_head1:                                      ; preds = %exp_cont, %break
  %12 = phi i32 [ %19, %exp_cont ], [ 0, %break ]
  %13 = icmp slt i32 %12, %"%n_33133"
  br i1 %13, label %while_body2, label %break3

while_body2:                                      ; preds = %while_head1
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds [0 x double], [0 x double]* %"%x_32986", i64 0, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fsub double %16, %11
  %18 = call double @exp(double %17)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body2
  %exp = phi double [ %18, %while_body2 ]
  %19 = add nsw i32 1, %12
  %20 = load double, double* %"%semx_33001", align 8
  %21 = fadd double %exp, %20
  store double %21, double* %"%semx_33001", align 8
  br label %while_head1

break3:                                           ; preds = %while_head1
  %22 = load double, double* %"%semx_33001", align 8
  %23 = call double @log(double %22)
  br label %log_cont

log_cont:                                         ; preds = %break3
  %log = phi double [ %23, %break3 ]
  %24 = fadd double %11, %log
  br label %return

return:                                           ; preds = %log_cont
  %25 = phi double [ %24, %log_cont ]
  ret double %25
}

declare double @lgamma(double)
