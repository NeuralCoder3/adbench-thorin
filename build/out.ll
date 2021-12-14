; ModuleID = 'build/out'
source_filename = "build/out"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-darwin21.1.0"

@_17793 = internal constant [24 x i8] c"benchmark/gmm_d2_K5.txt\00"

define i32 @main() local_unnamed_addr {
main:
  %b_17930 = alloca i32, align 4
  %b_18085 = alloca i32, align 4
  %b_18078 = alloca i32, align 4
  %Lparamsidx_18099 = alloca i32, align 4
  %b_18046 = alloca i32, align 4
  %b_18004 = alloca i32, align 4
  %b_17997 = alloca i32, align 4
  %b_18370 = alloca i32, align 4
  %out_18398 = alloca double, align 8
  %b_18334 = alloca i32, align 4
  %out_18361 = alloca double, align 8
  %err_18307 = alloca double, align 8
  %b_17989 = alloca i32, align 4
  %slse_18291 = alloca double, align 8
  %b_17922 = alloca i32, align 4
  %wishartGammap_17813 = alloca double, align 8
  %wishartMp_17810 = alloca i32, align 4
  %np_17769 = alloca i32, align 4
  %kp_17766 = alloca i32, align 4
  %dp_17763 = alloca i32, align 4
  store i32 2, i32* %dp_17763, align 4
  store i32 5, i32* %kp_17766, align 4
  store i32 1000, i32* %np_17769, align 4
  call void @read_gmm_size([0 x i8]* bitcast ([24 x i8]* @_17793 to [0 x i8]*), i32* nonnull %dp_17763, i32* nonnull %kp_17766, i32* nonnull %np_17769)
  store i32 0, i32* %wishartMp_17810, align 4
  store double 1.000000e+00, double* %wishartGammap_17813, align 8
  %0 = load i32, i32* %kp_17766, align 4
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %2)
  %4 = bitcast [0 x i8]* %3 to [0 x double]*
  %5 = load i32, i32* %dp_17763, align 4
  %6 = load i32, i32* %kp_17766, align 4
  %7 = mul nsw i32 %5, %6
  %8 = zext i32 %7 to i64
  %9 = shl nuw nsw i64 %8, 3
  %10 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %9)
  %11 = bitcast [0 x i8]* %10 to [0 x double]*
  %12 = load i32, i32* %kp_17766, align 4
  %13 = load i32, i32* %dp_17763, align 4
  %14 = add nsw i32 %13, -1
  %15 = mul nsw i32 %13, %14
  %16 = sdiv i32 %15, 2
  %17 = add nsw i32 %13, %16
  %18 = mul nsw i32 %12, %17
  %19 = zext i32 %18 to i64
  %20 = shl nuw nsw i64 %19, 3
  %21 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %20)
  %22 = bitcast [0 x i8]* %21 to [0 x double]*
  %23 = load i32, i32* %np_17769, align 4
  %24 = load i32, i32* %dp_17763, align 4
  %25 = mul nsw i32 %23, %24
  %26 = zext i32 %25 to i64
  %27 = shl nuw nsw i64 %26, 3
  %28 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %27)
  %29 = bitcast [0 x i8]* %28 to [0 x double]*
  call void @read_gmm([0 x i8]* bitcast ([24 x i8]* @_17793 to [0 x i8]*), i32* nonnull %dp_17763, i32* nonnull %kp_17766, i32* nonnull %np_17769, i32* nonnull %wishartMp_17810, double* nonnull %wishartGammap_17813, [0 x double]* %4, [0 x double]* %11, [0 x double]* %22, [0 x double]* %29)
  %30 = bitcast [0 x i8]* %10 to double*
  %31 = load double, double* %30, align 8
  call void @printDouble(double %31)
  %32 = load i32, i32* %dp_17763, align 4
  call void @printInteger(i32 %32)
  %33 = load i32, i32* %kp_17766, align 4
  call void @printInteger(i32 %33)
  %34 = load i32, i32* %np_17769, align 4
  call void @printInteger(i32 %34)
  %35 = load i32, i32* %dp_17763, align 4
  %36 = load i32, i32* %kp_17766, align 4
  %37 = load i32, i32* %np_17769, align 4
  %38 = load i32, i32* %wishartMp_17810, align 4
  %39 = load double, double* %wishartGammap_17813, align 8
  %40 = call double @log(double 6.283180e+00)
  %41 = mul nsw i32 %35, %36
  %42 = zext i32 %41 to i64
  %43 = shl nuw nsw i64 %42, 3
  %44 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %43)
  %45 = bitcast [0 x i8]* %44 to [0 x double]*
  %46 = zext i32 %36 to i64
  %47 = shl nuw nsw i64 %46, 3
  %48 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %47)
  %49 = bitcast [0 x i8]* %48 to [0 x double]*
  %50 = zext i32 %35 to i64
  %51 = shl nuw nsw i64 %50, 3
  %52 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %51)
  %53 = bitcast [0 x i8]* %52 to [0 x double]*
  %54 = zext i32 %35 to i64
  %55 = shl nuw nsw i64 %54, 3
  %56 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %55)
  %57 = bitcast [0 x i8]* %56 to [0 x double]*
  %58 = zext i32 %36 to i64
  %59 = shl nuw nsw i64 %58, 3
  %60 = call [0 x i8]* @anydsl_alloc(i32 0, i64 %59)
  %61 = bitcast [0 x i8]* %60 to [0 x double]*
  store i32 0, i32* %b_17922, align 4
  %62 = add nsw i32 %35, 1
  %63 = mul nsw i32 %35, %62
  %icf_sz = sdiv i32 %63, 2
  %64 = icmp sgt i32 %36, 0
  br i1 %64, label %expr_true40.preheader, label %expr_false

expr_true40.preheader:                            ; preds = %main
  %65 = icmp sgt i32 %35, 0
  br label %expr_true40

expr_false:                                       ; preds = %expr_false42, %main
  store double 0.000000e+00, double* %slse_18291, align 8
  store i32 0, i32* %b_17989, align 4
  %66 = icmp sgt i32 %37, 0
  br i1 %66, label %expr_true20.preheader, label %expr_false4

expr_true20.preheader:                            ; preds = %expr_false
  %67 = icmp sgt i32 %36, 0
  %68 = icmp sgt i32 %35, 0
  %69 = icmp sgt i32 %35, 0
  %70 = icmp sgt i32 %35, 0
  br label %expr_true20

expr_false4:                                      ; preds = %expr_false22, %expr_false
  %71 = call fastcc double @logsumexp_18203(i32 %36, [0 x double]* %4)
  %72 = load double, double* %slse_18291, align 8
  %73 = sitofp i32 %37 to double
  %74 = fneg double %73
  %75 = sitofp i32 %35 to double
  %76 = fmul double %74, %75
  %77 = fmul double %76, 5.000000e-01
  %CONSTANT = fmul double %77, 0x3FFD67F0E5A7DC92
  %78 = fadd double %CONSTANT, %72
  %79 = fmul double %71, %73
  %err = fsub double %78, %79
  store double %err, double* %err_18307, align 8
  %80 = call double @log(double %39)
  %81 = call double @log(double 2.000000e+00)
  %82 = call double @log(double 3.141590e+00)
  %83 = add nsw i32 %35, -1
  %84 = mul nsw i32 %35, %83
  %85 = sitofp i32 %84 to double
  %86 = fmul double %85, 2.500000e-01
  %out = fmul double %86, 0x3FF250CF662ABF9A
  store double %out, double* %out_18361, align 8
  store i32 1, i32* %b_18334, align 4
  %87 = add nsw i32 %35, %38
  %n = add nsw i32 %87, 1
  %88 = sitofp i32 %n to double
  %89 = fmul double %88, 5.000000e-01
  %90 = icmp sgt i32 %35, 0
  br i1 %90, label %expr_true18, label %expr_false12

expr_false12:                                     ; preds = %expr_true18, %expr_false4
  %91 = load double, double* %out_18361, align 8
  store double 0.000000e+00, double* %out_18398, align 8
  store i32 0, i32* %b_18370, align 4
  %92 = sub nsw i32 %icf_sz, %35
  %93 = fmul double %39, 5.000000e-01
  %94 = fmul double %93, %39
  %95 = sitofp i32 %38 to double
  %96 = icmp sgt i32 %36, 0
  br i1 %96, label %expr_true, label %expr_false14

expr_false14:                                     ; preds = %expr_true, %expr_false12
  %97 = load double, double* %out_18398, align 8
  %98 = load double, double* %err_18307, align 8
  %99 = sitofp i32 %36 to double
  %100 = fmul double %88, %75
  %101 = fadd double %80, 0xBFD62E42FEFA39EF
  %102 = fmul double %100, %101
  %C = fsub double %102, %91
  %103 = fmul double %C, %99
  %104 = fsub double %97, %103
  %105 = fadd double %98, %104
  store double %105, double* %err_18307, align 8
  call void @printDouble(double %105)
  ret i32 0

expr_true:                                        ; preds = %expr_false12, %expr_true
  %106 = load i32, i32* %b_18370, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %b_18370, align 4
  %108 = mul nsw i32 %106, %35
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [0 x double], [0 x double]* %45, i64 0, i64 %109
  %111 = bitcast double* %110 to [0 x double]*
  %112 = call fastcc double @sqnorm_18133(i32 %35, [0 x double]* %111)
  %113 = mul nsw i32 %106, %icf_sz
  %114 = add nsw i32 %113, %35
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [0 x double], [0 x double]* %22, i64 0, i64 %115
  %117 = bitcast double* %116 to [0 x double]*
  %118 = call fastcc double @sqnorm_18133(i32 %92, [0 x double]* %117)
  %119 = sext i32 %106 to i64
  %120 = getelementptr inbounds [0 x double], [0 x double]* %49, i64 0, i64 %119
  %121 = load double, double* %120, align 8
  %122 = load double, double* %out_18398, align 8
  %frobenius = fadd double %112, %118
  %123 = fmul double %94, %frobenius
  %124 = fmul double %121, %95
  %125 = fsub double %123, %124
  %126 = fadd double %122, %125
  store double %126, double* %out_18398, align 8
  %127 = load i32, i32* %b_18370, align 4
  %128 = icmp slt i32 %127, %36
  br i1 %128, label %expr_true, label %expr_false14

expr_true18:                                      ; preds = %expr_false4, %expr_true18
  %129 = load i32, i32* %b_18334, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %b_18334, align 4
  %131 = sub nsw i32 1, %129
  %132 = sitofp i32 %131 to double
  %133 = fmul double %132, 5.000000e-01
  %134 = fadd double %89, %133
  %135 = call double @lgamma(double %134)
  %136 = load double, double* %out_18361, align 8
  %137 = fadd double %136, %135
  store double %137, double* %out_18361, align 8
  %138 = load i32, i32* %b_18334, align 4
  %.not = icmp sgt i32 %138, %35
  br i1 %.not, label %expr_false12, label %expr_true18

expr_true20:                                      ; preds = %expr_true20.preheader, %expr_false22
  %139 = load i32, i32* %b_17989, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %b_17989, align 4
  store i32 0, i32* %b_17997, align 4
  %141 = mul nsw i32 %139, %35
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [0 x double], [0 x double]* %29, i64 0, i64 %142
  br i1 %67, label %expr_true25, label %expr_false22

expr_false22:                                     ; preds = %expr_false31, %expr_true20
  %144 = call fastcc double @logsumexp_18203(i32 %36, [0 x double]* %61)
  %145 = load double, double* %slse_18291, align 8
  %146 = fadd double %145, %144
  store double %146, double* %slse_18291, align 8
  %147 = load i32, i32* %b_17989, align 4
  %148 = icmp slt i32 %147, %37
  br i1 %148, label %expr_true20, label %expr_false4

expr_true25:                                      ; preds = %expr_true20, %expr_false31
  %149 = load i32, i32* %b_17997, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %b_17997, align 4
  store i32 0, i32* %b_18004, align 4
  %151 = mul nsw i32 %149, %35
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [0 x double], [0 x double]* %11, i64 0, i64 %152
  br i1 %68, label %expr_true39, label %expr_false27

expr_false27:                                     ; preds = %expr_true39, %expr_true25
  store i32 0, i32* %b_18046, align 4
  %154 = sext i32 %151 to i64
  %155 = getelementptr inbounds [0 x double], [0 x double]* %45, i64 0, i64 %154
  br i1 %69, label %expr_true38, label %expr_false29

expr_false29:                                     ; preds = %expr_true38, %expr_false27
  store i32 0, i32* %Lparamsidx_18099, align 4
  store i32 0, i32* %b_18078, align 4
  %156 = mul nsw i32 %149, %icf_sz
  %157 = add nsw i32 %156, %35
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [0 x double], [0 x double]* %22, i64 0, i64 %158
  br i1 %70, label %expr_true34, label %expr_false31

expr_false31:                                     ; preds = %expr_false36, %expr_false29
  %160 = sext i32 %149 to i64
  %161 = getelementptr inbounds [0 x double], [0 x double]* %4, i64 0, i64 %160
  %162 = load double, double* %161, align 8
  %163 = sext i32 %149 to i64
  %164 = getelementptr inbounds [0 x double], [0 x double]* %49, i64 0, i64 %163
  %165 = load double, double* %164, align 8
  %166 = call fastcc double @sqnorm_18133(i32 %35, [0 x double]* %57)
  %167 = sext i32 %149 to i64
  %168 = getelementptr inbounds [0 x double], [0 x double]* %61, i64 0, i64 %167
  %169 = fadd double %162, %165
  %170 = fmul double %166, 5.000000e-01
  %171 = fsub double %169, %170
  store double %171, double* %168, align 8
  %172 = load i32, i32* %b_17997, align 4
  %173 = icmp slt i32 %172, %36
  br i1 %173, label %expr_true25, label %expr_false22

expr_true34:                                      ; preds = %expr_false29, %expr_false36
  %174 = load i32, i32* %b_18078, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %b_18078, align 4
  store i32 %175, i32* %b_18085, align 4
  %176 = sext i32 %174 to i64
  %177 = getelementptr inbounds [0 x double], [0 x double]* %53, i64 0, i64 %176
  %178 = icmp slt i32 %175, %35
  br i1 %178, label %expr_true37, label %expr_false36

expr_false36:                                     ; preds = %expr_true37, %expr_true34
  %179 = load i32, i32* %b_18078, align 4
  %180 = icmp slt i32 %179, %35
  br i1 %180, label %expr_true34, label %expr_false31

expr_true37:                                      ; preds = %expr_true34, %expr_true37
  %181 = load i32, i32* %b_18085, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, i32* %b_18085, align 4
  %183 = sext i32 %181 to i64
  %184 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %183
  %185 = load double, double* %184, align 8
  %186 = load i32, i32* %Lparamsidx_18099, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds double, double* %159, i64 %187
  %189 = load double, double* %188, align 8
  %190 = load double, double* %177, align 8
  %191 = fmul double %189, %190
  %192 = fadd double %185, %191
  store double %192, double* %184, align 8
  %193 = load i32, i32* %Lparamsidx_18099, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %Lparamsidx_18099, align 4
  %195 = load i32, i32* %b_18085, align 4
  %196 = icmp slt i32 %195, %35
  br i1 %196, label %expr_true37, label %expr_false36

expr_true38:                                      ; preds = %expr_false27, %expr_true38
  %197 = load i32, i32* %b_18046, align 4
  %198 = add nsw i32 %197, 1
  store i32 %198, i32* %b_18046, align 4
  %199 = sext i32 %197 to i64
  %200 = getelementptr inbounds double, double* %155, i64 %199
  %201 = load double, double* %200, align 8
  %202 = sext i32 %197 to i64
  %203 = getelementptr inbounds [0 x double], [0 x double]* %53, i64 0, i64 %202
  %204 = load double, double* %203, align 8
  %205 = sext i32 %197 to i64
  %206 = getelementptr inbounds [0 x double], [0 x double]* %57, i64 0, i64 %205
  %207 = fmul double %201, %204
  store double %207, double* %206, align 8
  %208 = load i32, i32* %b_18046, align 4
  %209 = icmp slt i32 %208, %35
  br i1 %209, label %expr_true38, label %expr_false29

expr_true39:                                      ; preds = %expr_true25, %expr_true39
  %210 = load i32, i32* %b_18004, align 4
  %211 = add nsw i32 %210, 1
  store i32 %211, i32* %b_18004, align 4
  %212 = sext i32 %210 to i64
  %213 = getelementptr inbounds double, double* %143, i64 %212
  %214 = load double, double* %213, align 8
  %215 = sext i32 %210 to i64
  %216 = getelementptr inbounds double, double* %153, i64 %215
  %217 = load double, double* %216, align 8
  %218 = sext i32 %210 to i64
  %219 = getelementptr inbounds [0 x double], [0 x double]* %53, i64 0, i64 %218
  %220 = fsub double %214, %217
  store double %220, double* %219, align 8
  %221 = load i32, i32* %b_18004, align 4
  %222 = icmp slt i32 %221, %35
  br i1 %222, label %expr_true39, label %expr_false27

expr_true40:                                      ; preds = %expr_true40.preheader, %expr_false42
  %223 = load i32, i32* %b_17922, align 4
  %224 = add nsw i32 %223, 1
  store i32 %224, i32* %b_17922, align 4
  %225 = sext i32 %223 to i64
  %226 = getelementptr inbounds [0 x double], [0 x double]* %49, i64 0, i64 %225
  store double 0.000000e+00, double* %226, align 8
  store i32 0, i32* %b_17930, align 4
  %227 = mul nsw i32 %223, %icf_sz
  %228 = mul nsw i32 %223, %35
  br i1 %65, label %expr_true43, label %expr_false42

expr_false42:                                     ; preds = %expr_true43, %expr_true40
  %229 = load i32, i32* %b_17922, align 4
  %230 = icmp slt i32 %229, %36
  br i1 %230, label %expr_true40, label %expr_false

expr_true43:                                      ; preds = %expr_true40, %expr_true43
  %231 = load i32, i32* %b_17930, align 4
  %232 = add nsw i32 %231, 1
  store i32 %232, i32* %b_17930, align 4
  %233 = add nsw i32 %227, %231
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [0 x double], [0 x double]* %22, i64 0, i64 %234
  %236 = load double, double* %235, align 8
  %237 = load double, double* %226, align 8
  %238 = fadd double %237, %236
  store double %238, double* %226, align 8
  %239 = call double @exp(double %236)
  %240 = add nsw i32 %228, %231
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [0 x double], [0 x double]* %45, i64 0, i64 %241
  store double %239, double* %242, align 8
  %243 = load i32, i32* %b_17930, align 4
  %244 = icmp slt i32 %243, %35
  br i1 %244, label %expr_true43, label %expr_false42
}

declare void @read_gmm_size([0 x i8]*, i32*, i32*, i32*) local_unnamed_addr

declare [0 x i8]* @anydsl_alloc(i32, i64) local_unnamed_addr

declare void @read_gmm([0 x i8]*, i32*, i32*, i32*, i32*, double*, [0 x double]*, [0 x double]*, [0 x double]*, [0 x double]*) local_unnamed_addr

declare void @printDouble(double) local_unnamed_addr

declare void @printInteger(i32) local_unnamed_addr

declare double @log(double) local_unnamed_addr

define internal fastcc double @logsumexp_18203(i32 %n_18205, [0 x double]* %x_18206) unnamed_addr {
logsumexp:
  %b_18243 = alloca i32, align 4
  %semx_18264 = alloca double, align 8
  %b_18212 = alloca i32, align 4
  %m_18223 = alloca double, align 8
  %0 = getelementptr inbounds [0 x double], [0 x double]* %x_18206, i64 0, i64 0
  %1 = load double, double* %0, align 8
  store double %1, double* %m_18223, align 8
  store i32 1, i32* %b_18212, align 4
  %2 = icmp sgt i32 %n_18205, 1
  br i1 %2, label %expr_true5, label %expr_false

expr_false:                                       ; preds = %body_cont, %logsumexp
  %3 = load double, double* %m_18223, align 8
  store double 0.000000e+00, double* %semx_18264, align 8
  store i32 0, i32* %b_18243, align 4
  %4 = icmp sgt i32 %n_18205, 0
  br i1 %4, label %expr_true, label %expr_false2

expr_false2:                                      ; preds = %expr_true, %expr_false
  %5 = load double, double* %semx_18264, align 8
  %6 = call double @log(double %5)
  %7 = fadd double %6, %3
  ret double %7

expr_true:                                        ; preds = %expr_false, %expr_true
  %8 = load i32, i32* %b_18243, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %b_18243, align 4
  %10 = sext i32 %8 to i64
  %11 = getelementptr inbounds [0 x double], [0 x double]* %x_18206, i64 0, i64 %10
  %12 = load double, double* %11, align 8
  %13 = fsub double %12, %3
  %14 = call double @exp(double %13)
  %15 = load double, double* %semx_18264, align 8
  %16 = fadd double %15, %14
  store double %16, double* %semx_18264, align 8
  %17 = load i32, i32* %b_18243, align 4
  %18 = icmp slt i32 %17, %n_18205
  br i1 %18, label %expr_true, label %expr_false2

expr_true5:                                       ; preds = %logsumexp, %body_cont
  %19 = load i32, i32* %b_18212, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %b_18212, align 4
  %21 = load double, double* %m_18223, align 8
  %22 = sext i32 %19 to i64
  %23 = getelementptr inbounds [0 x double], [0 x double]* %x_18206, i64 0, i64 %22
  %24 = load double, double* %23, align 8
  %25 = fcmp olt double %21, %24
  br i1 %25, label %expr_true7, label %body_cont

expr_true7:                                       ; preds = %expr_true5
  %26 = load double, double* %23, align 8
  store double %26, double* %m_18223, align 8
  br label %body_cont

body_cont:                                        ; preds = %expr_true5, %expr_true7
  %27 = load i32, i32* %b_18212, align 4
  %28 = icmp slt i32 %27, %n_18205
  br i1 %28, label %expr_true5, label %expr_false
}

define internal fastcc double @sqnorm_18133(i32 %d_18135, [0 x double]* %v_18136) unnamed_addr {
sqnorm:
  %b_18142 = alloca i32, align 4
  %sum_18158 = alloca double, align 8
  store double 0.000000e+00, double* %sum_18158, align 8
  store i32 0, i32* %b_18142, align 4
  %0 = icmp sgt i32 %d_18135, 0
  br i1 %0, label %expr_true, label %expr_false

expr_false:                                       ; preds = %expr_true, %sqnorm
  %1 = load double, double* %sum_18158, align 8
  ret double %1

expr_true:                                        ; preds = %sqnorm, %expr_true
  %2 = load i32, i32* %b_18142, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* %b_18142, align 4
  %4 = sext i32 %2 to i64
  %5 = getelementptr inbounds [0 x double], [0 x double]* %v_18136, i64 0, i64 %4
  %6 = load double, double* %5, align 8
  %7 = load double, double* %sum_18158, align 8
  %8 = fmul double %6, %6
  %9 = fadd double %7, %8
  store double %9, double* %sum_18158, align 8
  %10 = load i32, i32* %b_18142, align 4
  %11 = icmp slt i32 %10, %d_18135
  br i1 %11, label %expr_true, label %expr_false
}

declare double @lgamma(double) local_unnamed_addr

declare double @exp(double) local_unnamed_addr
