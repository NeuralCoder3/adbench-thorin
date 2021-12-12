; ModuleID = 'out'
source_filename = "out"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"%_30392" = global [14 x i8] c"gmm_d2_K5.txt\00"

define i32 @main() {
main_start:
  %"%out_31100" = alloca double, align 8
  %"%out_31093" = alloca double, align 8
  %"%semx_30972" = alloca double, align 8
  %"%m_30965" = alloca double, align 8
  %"%semx_31821" = alloca double, align 8
  %"%m_31815" = alloca double, align 8
  %"%Lparamsidx_32089" = alloca i32, align 4
  %"%slse_31001" = alloca double, align 8
  %"%wishartGamma_30531" = alloca double, align 8
  %"%wishartM_30523" = alloca i32, align 4
  %"%n_30350" = alloca i32, align 4
  %"%k_30339" = alloca i32, align 4
  %"%d_30328" = alloca i32, align 4
  br label %main

main:                                             ; preds = %main_start
  store i32 2, i32* %"%d_30328", align 4
  store i32 5, i32* %"%k_30339", align 4
  store i32 1000, i32* %"%n_30350", align 4
  call void @read_gmm_size([0 x i8]* bitcast ([14 x i8]* @"%_30392" to [0 x i8]*), i32* %"%d_30328", i32* %"%k_30339", i32* %"%n_30350")
  br label %read_gmm_size_cont

read_gmm_size_cont:                               ; preds = %main
  store i32 0, i32* %"%wishartM_30523", align 4
  store double 1.000000e+00, double* %"%wishartGamma_30531", align 8
  %0 = load i32, i32* %"%k_30339", align 4
  %1 = zext i32 %0 to i64
  %2 = mul i64 %1, 8
  %3 = add i64 0, %2
  %4 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %3)
  %5 = bitcast [0 x i8]* %4 to [0 x double]*
  %6 = load i32, i32* %"%d_30328", align 4
  %7 = load i32, i32* %"%k_30339", align 4
  %8 = mul nsw i32 %6, %7
  %9 = zext i32 %8 to i64
  %10 = mul i64 %9, 8
  %11 = add i64 0, %10
  %12 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %11)
  %13 = bitcast [0 x i8]* %12 to [0 x double]*
  %14 = load i32, i32* %"%k_30339", align 4
  %15 = load i32, i32* %"%d_30328", align 4
  %16 = load i32, i32* %"%d_30328", align 4
  %17 = load i32, i32* %"%d_30328", align 4
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
  %28 = load i32, i32* %"%n_30350", align 4
  %29 = load i32, i32* %"%d_30328", align 4
  %30 = mul nsw i32 %28, %29
  %31 = zext i32 %30 to i64
  %32 = mul i64 %31, 8
  %33 = add i64 0, %32
  %34 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %33)
  %35 = bitcast [0 x i8]* %34 to [0 x double]*
  call void @read_gmm([0 x i8]* bitcast ([14 x i8]* @"%_30392" to [0 x i8]*), i32* %"%d_30328", i32* %"%k_30339", i32* %"%n_30350", i32* %"%wishartM_30523", double* %"%wishartGamma_30531", [0 x double]* %5, [0 x double]* %13, [0 x double]* %27, [0 x double]* %35)
  br label %read_gmm_cont

read_gmm_cont:                                    ; preds = %read_gmm_size_cont
  %36 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 0
  %37 = load double, double* %36, align 8
  call void @printDouble(double %37)
  br label %printDouble_cont

printDouble_cont:                                 ; preds = %read_gmm_cont
  %38 = load i32, i32* %"%d_30328", align 4
  call void @printInteger(i32 %38)
  br label %printInteger_cont

printInteger_cont:                                ; preds = %printDouble_cont
  %39 = load i32, i32* %"%k_30339", align 4
  call void @printInteger(i32 %39)
  br label %printInteger_cont1

printInteger_cont1:                               ; preds = %printInteger_cont
  %40 = load i32, i32* %"%n_30350", align 4
  call void @printInteger(i32 %40)
  br label %printInteger_cont2

printInteger_cont2:                               ; preds = %printInteger_cont1
  %41 = load i32, i32* %"%d_30328", align 4
  %42 = load i32, i32* %"%k_30339", align 4
  %43 = load i32, i32* %"%n_30350", align 4
  %44 = load i32, i32* %"%wishartM_30523", align 4
  %45 = load double, double* %"%wishartGamma_30531", align 8
  %46 = call double @log(double 6.283180e+00)
  br label %log_cont

log_cont:                                         ; preds = %printInteger_cont2
  %47 = phi double [ %46, %printInteger_cont2 ]
  %48 = zext i32 %41 to i64
  %49 = zext i32 %42 to i64
  %50 = add nsw i32 1, %41
  %51 = mul nsw i32 %41, %42
  %52 = zext i32 %51 to i64
  %53 = mul nsw i32 %41, %50
  %54 = sdiv i32 %53, 2
  %55 = mul i64 %52, 8
  %56 = add i64 0, %55
  %57 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %56)
  %58 = bitcast [0 x i8]* %57 to [0 x double]*
  %59 = mul i64 %49, 8
  %60 = add i64 0, %59
  %61 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %60)
  %62 = bitcast [0 x i8]* %61 to [0 x double]*
  %63 = mul i64 %48, 8
  %64 = add i64 0, %63
  %65 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %64)
  %66 = bitcast [0 x i8]* %65 to [0 x double]*
  %67 = mul i64 %48, 8
  %68 = add i64 0, %67
  %69 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %68)
  %70 = bitcast [0 x i8]* %69 to [0 x double]*
  %71 = mul i64 %49, 8
  %72 = add i64 0, %71
  %73 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %72)
  %74 = bitcast [0 x i8]* %73 to [0 x double]*
  %75 = sdiv i32 %53, 2
  br label %while_head

while_head:                                       ; preds = %while_body, %log_cont
  %76 = phi i32 [ %79, %while_body ], [ 0, %log_cont ]
  %77 = icmp slt i32 %76, %42
  br i1 %77, label %while_body, label %preprocess_qs_cont

while_body:                                       ; preds = %while_head
  %78 = zext i32 %76 to i64
  %79 = add nsw i32 1, %76
  %80 = getelementptr inbounds [0 x double], [0 x double]* %62, i64 0, i64 %78
  store double 0.000000e+00, double* %80, align 8
  br label %while_head

preprocess_qs_cont:                               ; preds = %while_head
  store double 0.000000e+00, double* %"%slse_31001", align 8
  %81 = getelementptr inbounds [0 x double], [0 x double]* %74, i64 0, i64 0
  br label %while_head3

while_head3:                                      ; preds = %log_cont23, %preprocess_qs_cont
  %82 = phi i32 [ %175, %log_cont23 ], [ 0, %preprocess_qs_cont ]
  %83 = icmp slt i32 %82, %43
  br i1 %83, label %while_body4, label %break24

while_body4:                                      ; preds = %while_head3
  %84 = mul nsw i32 %41, %82
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [0 x double], [0 x double]* %35, i64 0, i64 %85
  %87 = bitcast double* %86 to [0 x double]*
  br label %while_head5

while_head5:                                      ; preds = %sqnorm_cont, %while_body4
  %88 = phi i32 [ %147, %sqnorm_cont ], [ 0, %while_body4 ]
  %89 = icmp slt i32 %88, %42
  br i1 %89, label %while_body6, label %break15

while_body6:                                      ; preds = %while_head5
  %90 = mul nsw i32 %41, %88
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 %91
  %93 = bitcast double* %92 to [0 x double]*
  br label %while_head7

while_head7:                                      ; preds = %while_body8, %while_body6
  %94 = phi i32 [ %99, %while_body8 ], [ 0, %while_body6 ]
  %95 = icmp slt i32 %94, %41
  br i1 %95, label %while_body8, label %subtract_cont

while_body8:                                      ; preds = %while_head7
  %96 = zext i32 %94 to i64
  %97 = getelementptr inbounds [0 x double], [0 x double]* %66, i64 0, i64 %96
  %98 = getelementptr inbounds [0 x double], [0 x double]* %87, i64 0, i64 %96
  %99 = add nsw i32 1, %94
  %100 = getelementptr inbounds [0 x double], [0 x double]* %93, i64 0, i64 %96
  %101 = load double, double* %98, align 8
  %102 = load double, double* %100, align 8
  %103 = fsub double %101, %102
  store double %103, double* %97, align 8
  br label %while_head7

subtract_cont:                                    ; preds = %while_head7
  %104 = getelementptr inbounds [0 x double], [0 x double]* %58, i64 0, i64 %91
  %105 = bitcast double* %104 to [0 x double]*
  br label %while_head9

while_head9:                                      ; preds = %while_body10, %subtract_cont
  %106 = phi i32 [ %109, %while_body10 ], [ 0, %subtract_cont ]
  %107 = icmp slt i32 %106, %41
  br i1 %107, label %while_body10, label %break

while_body10:                                     ; preds = %while_head9
  %108 = zext i32 %106 to i64
  %109 = add nsw i32 1, %106
  %110 = getelementptr inbounds [0 x double], [0 x double]* %70, i64 0, i64 %108
  %111 = getelementptr inbounds [0 x double], [0 x double]* %66, i64 0, i64 %108
  %112 = getelementptr inbounds [0 x double], [0 x double]* %105, i64 0, i64 %108
  %113 = load double, double* %112, align 8
  %114 = load double, double* %111, align 8
  %115 = fmul double %113, %114
  store double %115, double* %110, align 8
  br label %while_head9

break:                                            ; preds = %while_head9
  %116 = mul nsw i32 %88, %54
  %117 = add nsw i32 %41, %116
  store i32 0, i32* %"%Lparamsidx_32089", align 4
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %118
  %120 = bitcast double* %119 to [0 x double]*
  br label %while_head11

while_head11:                                     ; preds = %eta_while_head, %break
  %121 = phi i32 [ %125, %eta_while_head ], [ 0, %break ]
  %122 = icmp slt i32 %121, %41
  br i1 %122, label %while_body12, label %Qtimesx_cont

while_body12:                                     ; preds = %while_head11
  %123 = zext i32 %121 to i64
  %124 = getelementptr inbounds [0 x double], [0 x double]* %66, i64 0, i64 %123
  %125 = add nsw i32 1, %121
  br label %while_head13

while_head13:                                     ; preds = %while_body14, %while_body12
  %126 = phi i32 [ %129, %while_body14 ], [ %125, %while_body12 ]
  %127 = icmp slt i32 %126, %41
  br i1 %127, label %while_body14, label %eta_while_head

while_body14:                                     ; preds = %while_head13
  %128 = zext i32 %126 to i64
  %129 = add nsw i32 1, %126
  %130 = getelementptr inbounds [0 x double], [0 x double]* %70, i64 0, i64 %128
  %131 = load double, double* %130, align 8
  %132 = load i32, i32* %"%Lparamsidx_32089", align 4
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds [0 x double], [0 x double]* %120, i64 0, i64 %133
  %135 = load double, double* %134, align 8
  %136 = load double, double* %124, align 8
  %137 = fmul double %135, %136
  %138 = fadd double %131, %137
  store double %138, double* %130, align 8
  %139 = load i32, i32* %"%Lparamsidx_32089", align 4
  %140 = add nsw i32 1, %139
  store i32 %140, i32* %"%Lparamsidx_32089", align 4
  br label %while_head13

eta_while_head:                                   ; preds = %while_head13
  br label %while_head11

Qtimesx_cont:                                     ; preds = %while_head11
  %141 = zext i32 %88 to i64
  %142 = getelementptr inbounds [0 x double], [0 x double]* %62, i64 0, i64 %141
  %143 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %141
  %144 = load double, double* %143, align 8
  %145 = load double, double* %142, align 8
  %146 = call double @sqnorm_31124(i32 %41, [0 x double]* %70)
  br label %sqnorm_cont

sqnorm_cont:                                      ; preds = %Qtimesx_cont
  %sqnorm = phi double [ %146, %Qtimesx_cont ]
  %147 = add nsw i32 1, %88
  %148 = getelementptr inbounds [0 x double], [0 x double]* %74, i64 0, i64 %141
  %149 = fadd double %144, %145
  %150 = fmul double 5.000000e-01, %sqnorm
  %151 = fsub double %149, %150
  store double %151, double* %148, align 8
  br label %while_head5

break15:                                          ; preds = %while_head5
  %152 = load double, double* %81, align 8
  store double %152, double* %"%m_31815", align 8
  br label %while_head16

while_head16:                                     ; preds = %eta_while_head18, %break15
  %153 = phi i32 [ %161, %eta_while_head18 ], [ 1, %break15 ]
  %154 = icmp slt i32 %153, %42
  br i1 %154, label %while_body17, label %break19

while_body17:                                     ; preds = %while_head16
  %155 = zext i32 %153 to i64
  %156 = getelementptr inbounds [0 x double], [0 x double]* %74, i64 0, i64 %155
  %157 = load double, double* %"%m_31815", align 8
  %158 = load double, double* %156, align 8
  %159 = fcmp olt double %157, %158
  br i1 %159, label %if_then, label %eta_while_head18

if_then:                                          ; preds = %while_body17
  %160 = load double, double* %156, align 8
  store double %160, double* %"%m_31815", align 8
  br label %eta_while_head18

eta_while_head18:                                 ; preds = %if_then, %while_body17
  %161 = add nsw i32 1, %153
  br label %while_head16

break19:                                          ; preds = %while_head16
  %162 = load double, double* %"%m_31815", align 8
  store double 0.000000e+00, double* %"%semx_31821", align 8
  br label %while_head20

while_head20:                                     ; preds = %exp_cont, %break19
  %163 = phi i32 [ %170, %exp_cont ], [ 0, %break19 ]
  %164 = icmp slt i32 %163, %42
  br i1 %164, label %while_body21, label %break22

while_body21:                                     ; preds = %while_head20
  %165 = zext i32 %163 to i64
  %166 = getelementptr inbounds [0 x double], [0 x double]* %74, i64 0, i64 %165
  %167 = load double, double* %166, align 8
  %168 = fsub double %167, %162
  %169 = call double @exp(double %168)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body21
  %exp = phi double [ %169, %while_body21 ]
  %170 = add nsw i32 1, %163
  %171 = load double, double* %"%semx_31821", align 8
  %172 = fadd double %exp, %171
  store double %172, double* %"%semx_31821", align 8
  br label %while_head20

break22:                                          ; preds = %while_head20
  %173 = load double, double* %"%semx_31821", align 8
  %174 = call double @log(double %173)
  br label %log_cont23

log_cont23:                                       ; preds = %break22
  %log = phi double [ %174, %break22 ]
  %175 = add nsw i32 1, %82
  %176 = fadd double %162, %log
  %177 = load double, double* %"%slse_31001", align 8
  %178 = fadd double %176, %177
  store double %178, double* %"%slse_31001", align 8
  br label %while_head3

break24:                                          ; preds = %while_head3
  %179 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 0
  %180 = load double, double* %179, align 8
  store double %180, double* %"%m_30965", align 8
  br label %while_head25

while_head25:                                     ; preds = %eta_while_head28, %break24
  %181 = phi i32 [ %189, %eta_while_head28 ], [ 1, %break24 ]
  %182 = icmp slt i32 %181, %42
  br i1 %182, label %while_body26, label %break29

while_body26:                                     ; preds = %while_head25
  %183 = zext i32 %181 to i64
  %184 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %183
  %185 = load double, double* %"%m_30965", align 8
  %186 = load double, double* %184, align 8
  %187 = fcmp olt double %185, %186
  br i1 %187, label %if_then27, label %eta_while_head28

if_then27:                                        ; preds = %while_body26
  %188 = load double, double* %184, align 8
  store double %188, double* %"%m_30965", align 8
  br label %eta_while_head28

eta_while_head28:                                 ; preds = %if_then27, %while_body26
  %189 = add nsw i32 1, %181
  br label %while_head25

break29:                                          ; preds = %while_head25
  %190 = load double, double* %"%m_30965", align 8
  store double 0.000000e+00, double* %"%semx_30972", align 8
  br label %while_head30

while_head30:                                     ; preds = %exp_cont32, %break29
  %191 = phi i32 [ %198, %exp_cont32 ], [ 0, %break29 ]
  %192 = icmp slt i32 %191, %42
  br i1 %192, label %while_body31, label %break34

while_body31:                                     ; preds = %while_head30
  %193 = zext i32 %191 to i64
  %194 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %193
  %195 = load double, double* %194, align 8
  %196 = fsub double %195, %190
  %197 = call double @exp(double %196)
  br label %exp_cont32

exp_cont32:                                       ; preds = %while_body31
  %exp33 = phi double [ %197, %while_body31 ]
  %198 = add nsw i32 1, %191
  %199 = load double, double* %"%semx_30972", align 8
  %200 = fadd double %exp33, %199
  store double %200, double* %"%semx_30972", align 8
  br label %while_head30

break34:                                          ; preds = %while_head30
  %201 = load double, double* %"%semx_30972", align 8
  %202 = call double @log(double %201)
  br label %log_cont35

log_cont35:                                       ; preds = %break34
  %203 = phi double [ %202, %break34 ]
  %204 = load double, double* %"%slse_31001", align 8
  %205 = sdiv i32 %53, 2
  %206 = call double @log(double %45)
  br label %log_cont36

log_cont36:                                       ; preds = %log_cont35
  %207 = phi double [ %206, %log_cont35 ]
  %208 = call double @log(double 2.000000e+00)
  br label %log_cont37

log_cont37:                                       ; preds = %log_cont36
  %209 = phi double [ %208, %log_cont36 ]
  %210 = call double @log(double 3.141590e+00)
  br label %log_cont38

log_cont38:                                       ; preds = %log_cont37
  %log39 = phi double [ %210, %log_cont37 ]
  %211 = add nsw i32 -1, %41
  %212 = add nsw i32 %41, %44
  %213 = mul nsw i32 %41, %211
  %214 = sitofp i32 %213 to double
  %215 = add nsw i32 1, %212
  %216 = sitofp i32 %215 to double
  %217 = fmul double 2.500000e-01, %214
  %218 = fmul double 5.000000e-01, %216
  %219 = fmul double %217, %log39
  store double %219, double* %"%out_31093", align 8
  br label %while_head40

while_head40:                                     ; preds = %lgamma_cont, %log_cont38
  %220 = phi i32 [ %227, %lgamma_cont ], [ 1, %log_cont38 ]
  %221 = icmp slt i32 %220, %50
  br i1 %221, label %while_body41, label %break42

while_body41:                                     ; preds = %while_head40
  %222 = sub nsw i32 1, %220
  %223 = sitofp i32 %222 to double
  %224 = fmul double 5.000000e-01, %223
  %225 = fadd double %218, %224
  %226 = call double @lgamma(double %225)
  br label %lgamma_cont

lgamma_cont:                                      ; preds = %while_body41
  %lgamma = phi double [ %226, %while_body41 ]
  %227 = add nsw i32 1, %220
  %228 = load double, double* %"%out_31093", align 8
  %229 = fadd double %lgamma, %228
  store double %229, double* %"%out_31093", align 8
  br label %while_head40

break42:                                          ; preds = %while_head40
  %230 = sitofp i32 %44 to double
  %231 = fmul double 5.000000e-01, %45
  %232 = sub nsw i32 %205, %41
  %233 = fmul double %45, %231
  %234 = load double, double* %"%out_31093", align 8
  store double 0.000000e+00, double* %"%out_31100", align 8
  br label %while_head43

while_head43:                                     ; preds = %sqnorm_cont47, %break42
  %235 = phi i32 [ %248, %sqnorm_cont47 ], [ 0, %break42 ]
  %236 = icmp slt i32 %235, %42
  br i1 %236, label %while_body44, label %break49

while_body44:                                     ; preds = %while_head43
  %237 = mul nsw i32 %41, %235
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds [0 x double], [0 x double]* %58, i64 0, i64 %238
  %240 = bitcast double* %239 to [0 x double]*
  %241 = call double @sqnorm_31124(i32 %41, [0 x double]* %240)
  br label %sqnorm_cont45

sqnorm_cont45:                                    ; preds = %while_body44
  %sqnorm46 = phi double [ %241, %while_body44 ]
  %242 = mul nsw i32 %235, %205
  %243 = add nsw i32 %41, %242
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %244
  %246 = bitcast double* %245 to [0 x double]*
  %247 = call double @sqnorm_31124(i32 %232, [0 x double]* %246)
  br label %sqnorm_cont47

sqnorm_cont47:                                    ; preds = %sqnorm_cont45
  %sqnorm48 = phi double [ %247, %sqnorm_cont45 ]
  %248 = add nsw i32 1, %235
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds [0 x double], [0 x double]* %62, i64 0, i64 %249
  %251 = load double, double* %250, align 8
  %252 = fadd double %sqnorm46, %sqnorm48
  %253 = fmul double %233, %252
  %254 = load double, double* %"%out_31100", align 8
  %255 = fmul double %230, %251
  %256 = fsub double %253, %255
  %257 = fadd double %256, %254
  store double %257, double* %"%out_31100", align 8
  br label %while_head43

break49:                                          ; preds = %while_head43
  %258 = load double, double* %"%out_31100", align 8
  br label %return

return:                                           ; preds = %break49
  %259 = phi i32 [ 0, %break49 ]
  ret i32 %259
}

declare void @read_gmm_size([0 x i8]*, i32*, i32*, i32*)

declare [0 x i8]* @anydsl_alloc(i32, i64)

declare void @read_gmm([0 x i8]*, i32*, i32*, i32*, i32*, double*, [0 x double]*, [0 x double]*, [0 x double]*, [0 x double]*)

declare void @printDouble(double)

declare void @printInteger(i32)

declare double @log(double)

define internal double @sqnorm_31124(i32 %"%d_31248", [0 x double]* %"%v_31180") {
sqnorm_31124_start:
  %"%sum_31157" = alloca double, align 8
  br label %sqnorm

sqnorm:                                           ; preds = %sqnorm_31124_start
  store double 0.000000e+00, double* %"%sum_31157", align 8
  br label %while_head

while_head:                                       ; preds = %while_body, %sqnorm
  %0 = phi i32 [ %2, %while_body ], [ 0, %sqnorm ]
  %1 = icmp slt i32 %0, %"%d_31248"
  br i1 %1, label %while_body, label %break

while_body:                                       ; preds = %while_head
  %2 = add nsw i32 1, %0
  %3 = zext i32 %0 to i64
  %4 = getelementptr inbounds [0 x double], [0 x double]* %"%v_31180", i64 0, i64 %3
  %5 = load double, double* %4, align 8
  %6 = load double, double* %4, align 8
  %7 = load double, double* %"%sum_31157", align 8
  %8 = fmul double %5, %6
  %9 = fadd double %8, %7
  store double %9, double* %"%sum_31157", align 8
  br label %while_head

break:                                            ; preds = %while_head
  %10 = load double, double* %"%sum_31157", align 8
  br label %return

return:                                           ; preds = %break
  %11 = phi double [ %10, %break ]
  ret double %11
}

declare double @exp(double)

declare double @lgamma(double)
