; ModuleID = 'out'
source_filename = "out"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"%_29037" = global [14 x i8] c"gmm_d2_K5.txt\00"

define i32 @main() {
main_start:
  %"%out_29737" = alloca double, align 8
  %"%out_29730" = alloca double, align 8
  %"%semx_29617" = alloca double, align 8
  %"%m_29610" = alloca double, align 8
  %"%semx_30592" = alloca double, align 8
  %"%m_30586" = alloca double, align 8
  %"%Lparamsidx_30857" = alloca i32, align 4
  %"%slse_29646" = alloca double, align 8
  %"%wishartGamma_29176" = alloca double, align 8
  %"%wishartM_29168" = alloca i32, align 4
  %"%n_28995" = alloca i32, align 4
  %"%k_28984" = alloca i32, align 4
  %"%d_28973" = alloca i32, align 4
  br label %main

main:                                             ; preds = %main_start
  store i32 2, i32* %"%d_28973", align 4
  store i32 5, i32* %"%k_28984", align 4
  store i32 1000, i32* %"%n_28995", align 4
  call void @read_gmm_size([0 x i8]* bitcast ([14 x i8]* @"%_29037" to [0 x i8]*), i32* %"%d_28973", i32* %"%k_28984", i32* %"%n_28995")
  br label %read_gmm_size_cont

read_gmm_size_cont:                               ; preds = %main
  store i32 0, i32* %"%wishartM_29168", align 4
  store double 1.000000e+00, double* %"%wishartGamma_29176", align 8
  %0 = load i32, i32* %"%k_28984", align 4
  %1 = zext i32 %0 to i64
  %2 = mul i64 %1, 8
  %3 = add i64 0, %2
  %4 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %3)
  %5 = bitcast [0 x i8]* %4 to [0 x double]*
  %6 = load i32, i32* %"%d_28973", align 4
  %7 = load i32, i32* %"%k_28984", align 4
  %8 = mul nsw i32 %6, %7
  %9 = zext i32 %8 to i64
  %10 = mul i64 %9, 8
  %11 = add i64 0, %10
  %12 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %11)
  %13 = bitcast [0 x i8]* %12 to [0 x double]*
  %14 = load i32, i32* %"%k_28984", align 4
  %15 = load i32, i32* %"%d_28973", align 4
  %16 = load i32, i32* %"%d_28973", align 4
  %17 = load i32, i32* %"%d_28973", align 4
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
  %28 = load i32, i32* %"%n_28995", align 4
  %29 = load i32, i32* %"%d_28973", align 4
  %30 = mul nsw i32 %28, %29
  %31 = zext i32 %30 to i64
  %32 = mul i64 %31, 8
  %33 = add i64 0, %32
  %34 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %33)
  %35 = bitcast [0 x i8]* %34 to [0 x double]*
  call void @read_gmm([0 x i8]* bitcast ([14 x i8]* @"%_29037" to [0 x i8]*), i32* %"%d_28973", i32* %"%k_28984", i32* %"%n_28995", i32* %"%wishartM_29168", double* %"%wishartGamma_29176", [0 x double]* %5, [0 x double]* %13, [0 x double]* %27, [0 x double]* %35)
  br label %read_gmm_cont

read_gmm_cont:                                    ; preds = %read_gmm_size_cont
  %36 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 0
  %37 = load double, double* %36, align 8
  call void @printDouble(double %37)
  br label %printDouble_cont

printDouble_cont:                                 ; preds = %read_gmm_cont
  %38 = load i32, i32* %"%d_28973", align 4
  call void @printInteger(i32 %38)
  br label %printInteger_cont

printInteger_cont:                                ; preds = %printDouble_cont
  %39 = load i32, i32* %"%k_28984", align 4
  call void @printInteger(i32 %39)
  br label %printInteger_cont1

printInteger_cont1:                               ; preds = %printInteger_cont
  %40 = load i32, i32* %"%n_28995", align 4
  call void @printInteger(i32 %40)
  br label %printInteger_cont2

printInteger_cont2:                               ; preds = %printInteger_cont1
  %41 = load i32, i32* %"%d_28973", align 4
  %42 = load i32, i32* %"%k_28984", align 4
  %43 = load i32, i32* %"%n_28995", align 4
  %44 = load i32, i32* %"%wishartM_29168", align 4
  %45 = load double, double* %"%wishartGamma_29176", align 8
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

while_head:                                       ; preds = %eta_while_head, %log_cont
  %75 = phi i32 [ %94, %eta_while_head ], [ 0, %log_cont ]
  %76 = icmp slt i32 %75, %42
  br i1 %76, label %while_body, label %preprocess_qs_cont

while_body:                                       ; preds = %while_head
  %77 = zext i32 %75 to i64
  %78 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %77
  %79 = mul nsw i32 %75, %74
  %80 = mul nsw i32 %41, %75
  store double 0.000000e+00, double* %78, align 8
  br label %while_head3

while_head3:                                      ; preds = %exp_cont, %while_body
  %81 = phi i32 [ %91, %exp_cont ], [ 0, %while_body ]
  %82 = icmp slt i32 %81, %41
  br i1 %82, label %while_body4, label %eta_while_head

while_body4:                                      ; preds = %while_head3
  %83 = add nsw i32 %81, %79
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %84
  %86 = load double, double* %85, align 8
  %87 = load double, double* %78, align 8
  %88 = fadd double %86, %87
  store double %88, double* %78, align 8
  %89 = call double @exp(double %86)
  br label %exp_cont

exp_cont:                                         ; preds = %while_body4
  %exp = phi double [ %89, %while_body4 ]
  %90 = add nsw i32 %81, %80
  %91 = add nsw i32 1, %81
  %92 = zext i32 %90 to i64
  %93 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %92
  store double %exp, double* %93, align 8
  br label %while_head3

eta_while_head:                                   ; preds = %while_head3
  %94 = add nsw i32 1, %75
  br label %while_head

preprocess_qs_cont:                               ; preds = %while_head
  %95 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 0
  store double 0.000000e+00, double* %"%slse_29646", align 8
  br label %while_head5

while_head5:                                      ; preds = %log_cont28, %preprocess_qs_cont
  %96 = phi i32 [ %190, %log_cont28 ], [ 0, %preprocess_qs_cont ]
  %97 = icmp slt i32 %96, %43
  br i1 %97, label %while_body6, label %break30

while_body6:                                      ; preds = %while_head5
  %98 = mul nsw i32 %41, %96
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds [0 x double], [0 x double]* %35, i64 0, i64 %99
  %101 = bitcast double* %100 to [0 x double]*
  br label %while_head7

while_head7:                                      ; preds = %sqnorm_cont, %while_body6
  %102 = phi i32 [ %162, %sqnorm_cont ], [ 0, %while_body6 ]
  %103 = icmp slt i32 %102, %42
  br i1 %103, label %while_body8, label %break18

while_body8:                                      ; preds = %while_head7
  %104 = mul nsw i32 %41, %102
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds [0 x double], [0 x double]* %13, i64 0, i64 %105
  %107 = bitcast double* %106 to [0 x double]*
  br label %while_head9

while_head9:                                      ; preds = %while_body10, %while_body8
  %108 = phi i32 [ %112, %while_body10 ], [ 0, %while_body8 ]
  %109 = icmp slt i32 %108, %41
  br i1 %109, label %while_body10, label %subtract_cont

while_body10:                                     ; preds = %while_head9
  %110 = zext i32 %108 to i64
  %111 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %110
  %112 = add nsw i32 1, %108
  %113 = getelementptr inbounds [0 x double], [0 x double]* %107, i64 0, i64 %110
  %114 = getelementptr inbounds [0 x double], [0 x double]* %101, i64 0, i64 %110
  %115 = load double, double* %114, align 8
  %116 = load double, double* %113, align 8
  %117 = fsub double %115, %116
  store double %117, double* %111, align 8
  br label %while_head9

subtract_cont:                                    ; preds = %while_head9
  %118 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %105
  %119 = bitcast double* %118 to [0 x double]*
  br label %while_head11

while_head11:                                     ; preds = %while_body12, %subtract_cont
  %120 = phi i32 [ %122, %while_body12 ], [ 0, %subtract_cont ]
  %121 = icmp slt i32 %120, %41
  br i1 %121, label %while_body12, label %break

while_body12:                                     ; preds = %while_head11
  %122 = add nsw i32 1, %120
  %123 = zext i32 %120 to i64
  %124 = getelementptr inbounds [0 x double], [0 x double]* %69, i64 0, i64 %123
  %125 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %123
  %126 = getelementptr inbounds [0 x double], [0 x double]* %119, i64 0, i64 %123
  %127 = load double, double* %126, align 8
  %128 = load double, double* %125, align 8
  %129 = fmul double %127, %128
  store double %129, double* %124, align 8
  br label %while_head11

break:                                            ; preds = %while_head11
  %130 = mul nsw i32 %102, %53
  store i32 0, i32* %"%Lparamsidx_30857", align 4
  %131 = add nsw i32 %41, %130
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %132
  %134 = bitcast double* %133 to [0 x double]*
  br label %while_head13

while_head13:                                     ; preds = %eta_while_head17, %break
  %135 = phi i32 [ %138, %eta_while_head17 ], [ 0, %break ]
  %136 = icmp slt i32 %135, %41
  br i1 %136, label %while_body14, label %Qtimesx_cont

while_body14:                                     ; preds = %while_head13
  %137 = zext i32 %135 to i64
  %138 = add nsw i32 1, %135
  %139 = getelementptr inbounds [0 x double], [0 x double]* %65, i64 0, i64 %137
  br label %while_head15

while_head15:                                     ; preds = %while_body16, %while_body14
  %140 = phi i32 [ %143, %while_body16 ], [ %138, %while_body14 ]
  %141 = icmp slt i32 %140, %41
  br i1 %141, label %while_body16, label %eta_while_head17

while_body16:                                     ; preds = %while_head15
  %142 = zext i32 %140 to i64
  %143 = add nsw i32 1, %140
  %144 = getelementptr inbounds [0 x double], [0 x double]* %69, i64 0, i64 %142
  %145 = load double, double* %144, align 8
  %146 = load i32, i32* %"%Lparamsidx_30857", align 4
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds [0 x double], [0 x double]* %134, i64 0, i64 %147
  %149 = load double, double* %148, align 8
  %150 = load double, double* %139, align 8
  %151 = fmul double %149, %150
  %152 = fadd double %145, %151
  store double %152, double* %144, align 8
  %153 = load i32, i32* %"%Lparamsidx_30857", align 4
  %154 = add nsw i32 1, %153
  store i32 %154, i32* %"%Lparamsidx_30857", align 4
  br label %while_head15

eta_while_head17:                                 ; preds = %while_head15
  br label %while_head13

Qtimesx_cont:                                     ; preds = %while_head13
  %155 = zext i32 %102 to i64
  %156 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %155
  %157 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %155
  %158 = load double, double* %156, align 8
  %159 = load double, double* %157, align 8
  %160 = call double @sqnorm_29957(i32 %41, [0 x double]* %69)
  br label %sqnorm_cont

sqnorm_cont:                                      ; preds = %Qtimesx_cont
  %sqnorm = phi double [ %160, %Qtimesx_cont ]
  %161 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 %155
  %162 = add nsw i32 1, %102
  %163 = fadd double %158, %159
  %164 = fmul double 5.000000e-01, %sqnorm
  %165 = fsub double %163, %164
  store double %165, double* %161, align 8
  br label %while_head7

break18:                                          ; preds = %while_head7
  %166 = load double, double* %95, align 8
  store double %166, double* %"%m_30586", align 8
  br label %while_head19

while_head19:                                     ; preds = %eta_while_head21, %break18
  %167 = phi i32 [ %175, %eta_while_head21 ], [ 1, %break18 ]
  %168 = icmp slt i32 %167, %42
  br i1 %168, label %while_body20, label %break22

while_body20:                                     ; preds = %while_head19
  %169 = zext i32 %167 to i64
  %170 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 %169
  %171 = load double, double* %"%m_30586", align 8
  %172 = load double, double* %170, align 8
  %173 = fcmp olt double %171, %172
  br i1 %173, label %if_then, label %eta_while_head21

if_then:                                          ; preds = %while_body20
  %174 = load double, double* %170, align 8
  store double %174, double* %"%m_30586", align 8
  br label %eta_while_head21

eta_while_head21:                                 ; preds = %if_then, %while_body20
  %175 = add nsw i32 1, %167
  br label %while_head19

break22:                                          ; preds = %while_head19
  %176 = load double, double* %"%m_30586", align 8
  store double 0.000000e+00, double* %"%semx_30592", align 8
  br label %while_head23

while_head23:                                     ; preds = %exp_cont25, %break22
  %177 = phi i32 [ %184, %exp_cont25 ], [ 0, %break22 ]
  %178 = icmp slt i32 %177, %42
  br i1 %178, label %while_body24, label %break27

while_body24:                                     ; preds = %while_head23
  %179 = zext i32 %177 to i64
  %180 = getelementptr inbounds [0 x double], [0 x double]* %73, i64 0, i64 %179
  %181 = load double, double* %180, align 8
  %182 = fsub double %181, %176
  %183 = call double @exp(double %182)
  br label %exp_cont25

exp_cont25:                                       ; preds = %while_body24
  %exp26 = phi double [ %183, %while_body24 ]
  %184 = add nsw i32 1, %177
  %185 = load double, double* %"%semx_30592", align 8
  %186 = fadd double %exp26, %185
  store double %186, double* %"%semx_30592", align 8
  br label %while_head23

break27:                                          ; preds = %while_head23
  %187 = load double, double* %"%semx_30592", align 8
  %188 = call double @log(double %187)
  br label %log_cont28

log_cont28:                                       ; preds = %break27
  %log29 = phi double [ %188, %break27 ]
  %189 = fadd double %176, %log29
  %190 = add nsw i32 1, %96
  %191 = load double, double* %"%slse_29646", align 8
  %192 = fadd double %189, %191
  store double %192, double* %"%slse_29646", align 8
  br label %while_head5

break30:                                          ; preds = %while_head5
  %193 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 0
  %194 = load double, double* %193, align 8
  store double %194, double* %"%m_29610", align 8
  br label %while_head31

while_head31:                                     ; preds = %eta_while_head34, %break30
  %195 = phi i32 [ %203, %eta_while_head34 ], [ 1, %break30 ]
  %196 = icmp slt i32 %195, %42
  br i1 %196, label %while_body32, label %break35

while_body32:                                     ; preds = %while_head31
  %197 = zext i32 %195 to i64
  %198 = load double, double* %"%m_29610", align 8
  %199 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %197
  %200 = load double, double* %199, align 8
  %201 = fcmp olt double %198, %200
  br i1 %201, label %if_then33, label %eta_while_head34

if_then33:                                        ; preds = %while_body32
  %202 = load double, double* %199, align 8
  store double %202, double* %"%m_29610", align 8
  br label %eta_while_head34

eta_while_head34:                                 ; preds = %if_then33, %while_body32
  %203 = add nsw i32 1, %195
  br label %while_head31

break35:                                          ; preds = %while_head31
  %204 = load double, double* %"%m_29610", align 8
  store double 0.000000e+00, double* %"%semx_29617", align 8
  br label %while_head36

while_head36:                                     ; preds = %exp_cont38, %break35
  %205 = phi i32 [ %212, %exp_cont38 ], [ 0, %break35 ]
  %206 = icmp slt i32 %205, %42
  br i1 %206, label %while_body37, label %break40

while_body37:                                     ; preds = %while_head36
  %207 = zext i32 %205 to i64
  %208 = getelementptr inbounds [0 x double], [0 x double]* %5, i64 0, i64 %207
  %209 = load double, double* %208, align 8
  %210 = fsub double %209, %204
  %211 = call double @exp(double %210)
  br label %exp_cont38

exp_cont38:                                       ; preds = %while_body37
  %exp39 = phi double [ %211, %while_body37 ]
  %212 = add nsw i32 1, %205
  %213 = load double, double* %"%semx_29617", align 8
  %214 = fadd double %exp39, %213
  store double %214, double* %"%semx_29617", align 8
  br label %while_head36

break40:                                          ; preds = %while_head36
  %215 = load double, double* %"%semx_29617", align 8
  %216 = call double @log(double %215)
  br label %log_cont41

log_cont41:                                       ; preds = %break40
  %log42 = phi double [ %216, %break40 ]
  %217 = load double, double* %"%slse_29646", align 8
  %218 = sdiv i32 %52, 2
  %219 = call double @log(double %45)
  br label %log_cont43

log_cont43:                                       ; preds = %log_cont41
  %log44 = phi double [ %219, %log_cont41 ]
  %220 = call double @log(double 2.000000e+00)
  br label %log_cont45

log_cont45:                                       ; preds = %log_cont43
  %log46 = phi double [ %220, %log_cont43 ]
  %221 = call double @log(double 3.141590e+00)
  br label %log_cont47

log_cont47:                                       ; preds = %log_cont45
  %log48 = phi double [ %221, %log_cont45 ]
  %222 = add nsw i32 -1, %41
  %223 = mul nsw i32 %41, %222
  %224 = sitofp i32 %223 to double
  %225 = add nsw i32 %41, %44
  %226 = fmul double 2.500000e-01, %224
  %227 = add nsw i32 1, %225
  %228 = sitofp i32 %227 to double
  %229 = fmul double %226, %log48
  %230 = fmul double 5.000000e-01, %228
  store double %229, double* %"%out_29730", align 8
  br label %while_head49

while_head49:                                     ; preds = %lgamma_cont, %log_cont47
  %231 = phi i32 [ %238, %lgamma_cont ], [ 1, %log_cont47 ]
  %232 = icmp slt i32 %231, %49
  br i1 %232, label %while_body50, label %break51

while_body50:                                     ; preds = %while_head49
  %233 = sub nsw i32 1, %231
  %234 = sitofp i32 %233 to double
  %235 = fmul double 5.000000e-01, %234
  %236 = fadd double %230, %235
  %237 = call double @lgamma(double %236)
  br label %lgamma_cont

lgamma_cont:                                      ; preds = %while_body50
  %lgamma = phi double [ %237, %while_body50 ]
  %238 = add nsw i32 1, %231
  %239 = load double, double* %"%out_29730", align 8
  %240 = fadd double %lgamma, %239
  store double %240, double* %"%out_29730", align 8
  br label %while_head49

break51:                                          ; preds = %while_head49
  %241 = sitofp i32 %44 to double
  %242 = fmul double 5.000000e-01, %45
  %243 = load double, double* %"%out_29730", align 8
  %244 = sub nsw i32 %218, %41
  %245 = fmul double %45, %242
  store double 0.000000e+00, double* %"%out_29737", align 8
  br label %while_head52

while_head52:                                     ; preds = %sqnorm_cont56, %break51
  %246 = phi i32 [ %260, %sqnorm_cont56 ], [ 0, %break51 ]
  %247 = icmp slt i32 %246, %42
  br i1 %247, label %while_body53, label %break58

while_body53:                                     ; preds = %while_head52
  %248 = mul nsw i32 %41, %246
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %249
  %251 = bitcast double* %250 to [0 x double]*
  %252 = call double @sqnorm_29957(i32 %41, [0 x double]* %251)
  br label %sqnorm_cont54

sqnorm_cont54:                                    ; preds = %while_body53
  %sqnorm55 = phi double [ %252, %while_body53 ]
  %253 = mul nsw i32 %246, %218
  %254 = add nsw i32 %41, %253
  %255 = zext i32 %254 to i64
  %256 = getelementptr inbounds [0 x double], [0 x double]* %27, i64 0, i64 %255
  %257 = bitcast double* %256 to [0 x double]*
  %258 = call double @sqnorm_29957(i32 %244, [0 x double]* %257)
  br label %sqnorm_cont56

sqnorm_cont56:                                    ; preds = %sqnorm_cont54
  %sqnorm57 = phi double [ %258, %sqnorm_cont54 ]
  %259 = zext i32 %246 to i64
  %260 = add nsw i32 1, %246
  %261 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %259
  %262 = fadd double %sqnorm55, %sqnorm57
  %263 = load double, double* %261, align 8
  %264 = fmul double %245, %262
  %265 = load double, double* %"%out_29737", align 8
  %266 = fmul double %241, %263
  %267 = fsub double %264, %266
  %268 = fadd double %267, %265
  store double %268, double* %"%out_29737", align 8
  br label %while_head52

break58:                                          ; preds = %while_head52
  %269 = sitofp i32 %42 to double
  %270 = sitofp i32 %41 to double
  %271 = sitofp i32 %43 to double
  %272 = fmul double %270, %228
  %273 = load double, double* %"%out_29737", align 8
  %274 = fmul double 5.000000e-01, %log46
  %275 = fadd double %204, %log42
  %276 = fsub double -0.000000e+00, %271
  %277 = fsub double %log44, %274
  %278 = fmul double %271, %275
  %279 = fmul double %276, %270
  %280 = fmul double %272, %277
  %281 = fmul double 5.000000e-01, %279
  %282 = fsub double %280, %243
  %283 = fmul double %281, %log
  %284 = fmul double %269, %282
  %285 = fadd double %283, %217
  %286 = fsub double %273, %284
  %287 = fsub double %285, %278
  %288 = fadd double %287, %286
  call void @printDouble(double %288)
  br label %runGmmBenchmark_cont

runGmmBenchmark_cont:                             ; preds = %break58
  br label %return

return:                                           ; preds = %runGmmBenchmark_cont
  %289 = phi i32 [ 0, %runGmmBenchmark_cont ]
  ret i32 %289
}

declare void @read_gmm_size([0 x i8]*, i32*, i32*, i32*)

declare [0 x i8]* @anydsl_alloc(i32, i64)

declare void @read_gmm([0 x i8]*, i32*, i32*, i32*, i32*, double*, [0 x double]*, [0 x double]*, [0 x double]*, [0 x double]*)

declare void @printDouble(double)

declare void @printInteger(i32)

declare double @log(double)

declare double @exp(double)

define internal double @sqnorm_29957(i32 %"%d_30065", [0 x double]* %"%v_30013") {
sqnorm_29957_start:
  %"%sum_29990" = alloca double, align 8
  br label %sqnorm

sqnorm:                                           ; preds = %sqnorm_29957_start
  store double 0.000000e+00, double* %"%sum_29990", align 8
  br label %while_head

while_head:                                       ; preds = %while_body, %sqnorm
  %0 = phi i32 [ %2, %while_body ], [ 0, %sqnorm ]
  %1 = icmp slt i32 %0, %"%d_30065"
  br i1 %1, label %while_body, label %break

while_body:                                       ; preds = %while_head
  %2 = add nsw i32 1, %0
  %3 = zext i32 %0 to i64
  %4 = getelementptr inbounds [0 x double], [0 x double]* %"%v_30013", i64 0, i64 %3
  %5 = load double, double* %4, align 8
  %6 = load double, double* %4, align 8
  %7 = load double, double* %"%sum_29990", align 8
  %8 = fmul double %5, %6
  %9 = fadd double %8, %7
  store double %9, double* %"%sum_29990", align 8
  br label %while_head

break:                                            ; preds = %while_head
  %10 = load double, double* %"%sum_29990", align 8
  br label %return

return:                                           ; preds = %break
  %11 = phi double [ %10, %break ]
  ret double %11
}

declare double @lgamma(double)
