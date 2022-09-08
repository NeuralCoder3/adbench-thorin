; ModuleID = 'product.cpp'
source_filename = "product.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

%"class.std::__1::basic_ostream" = type { i32 (...)**, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32 }>
%"class.std::__1::ios_base" = type { i32 (...)**, i32, i64, i64, i32, i32, i8*, i8*, void (i32, %"class.std::__1::ios_base"*, i32)**, i32*, i64, i64, i64*, i64, i64, i8**, i64, i64 }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%"class.std::__1::chrono::duration" = type { i64 }
%"class.std::__1::chrono::duration.0" = type { i64 }
%"class.std::__1::chrono::time_point" = type { %"class.std::__1::chrono::duration.0" }
%"struct.std::__1::chrono::__duration_cast" = type { i8 }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char>::__rep" }
%"struct.std::__1::basic_string<char>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { i8*, i64, i64 }
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32, [4 x i8] }>
%"struct.std::__1::__default_init_tag" = type { i8 }
%"class.std::__1::__basic_string_common" = type { i8 }
%"struct.std::__1::__compressed_pair_elem.1" = type { i8 }
%"class.std::__1::allocator" = type { i8 }
%"struct.std::__1::__non_trivial_if" = type { i8 }
%"class.std::__1::basic_ostream<char>::sentry" = type { i8, %"class.std::__1::basic_ostream"* }
%"class.std::__1::ostreambuf_iterator" = type { %"class.std::__1::basic_streambuf"* }
%"class.std::__1::basic_streambuf" = type { i32 (...)**, %"class.std::__1::locale", i8*, i8*, i8*, i8*, i8*, i8* }
%"class.std::__1::locale" = type { %"class.std::__1::locale::__imp"* }
%"class.std::__1::locale::__imp" = type opaque
%"struct.std::__1::iterator" = type { i8 }
%"class.std::__1::ctype" = type <{ %"class.std::__1::locale::facet", i32*, i8, [7 x i8] }>
%"class.std::__1::locale::facet" = type { %"class.std::__1::__shared_count" }
%"class.std::__1::__shared_count" = type { i32 (...)**, i64 }
%"struct.std::__1::basic_string<char>::__short" = type { [23 x i8], %struct.anon }
%struct.anon = type { i8 }

@enzyme_dup = dso_local global i32 0, align 4
@enzyme_dupnoneed = dso_local global i32 0, align 4
@enzyme_out = dso_local global i32 0, align 4
@enzyme_const = dso_local global i32 0, align 4
@_ZL10start_time = internal global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream", align 8
@.str.1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"x_d\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"y_d\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"z_d\00", align 1
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8

; Function Attrs: noinline optnone ssp uwtable mustprogress
define dso_local double @_Z12randomDoubledd(double %fMin, double %fMax) #0 {
entry:
  %fMin.addr = alloca double, align 8
  %fMax.addr = alloca double, align 8
  %f = alloca double, align 8
  store double %fMin, double* %fMin.addr, align 8
  store double %fMax, double* %fMax.addr, align 8
  %call = call i32 @rand()
  %conv = sitofp i32 %call to double
  %div = fdiv double %conv, 0x41DFFFFFFFC00000
  store double %div, double* %f, align 8
  %0 = load double, double* %fMin.addr, align 8
  %1 = load double, double* %f, align 8
  %2 = load double, double* %fMax.addr, align 8
  %3 = load double, double* %fMin.addr, align 8
  %sub = fsub double %2, %3
  %mul = fmul double %1, %sub
  %add = fadd double %0, %mul
  ret double %add
}

declare i32 @rand() #1

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define dso_local void @_Z7productPdS_S_i(double* %x, double* %y, double* %z, i32 %size) #2 {
entry:
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  %size.addr = alloca i32, align 4
  %elements = alloca i64, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %x, double** %x.addr, align 8
  store double* %y, double** %y.addr, align 8
  store double* %z, double** %z.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  %0 = load i32, i32* %size.addr, align 4
  %1 = load i32, i32* %size.addr, align 4
  %mul = mul nsw i32 %0, %1
  %conv = sext i32 %mul to i64
  store i64 %conv, i64* %elements, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %size.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end27

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %k, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc20, %for.body
  %4 = load i32, i32* %k, align 4
  %5 = load i32, i32* %size.addr, align 4
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end23

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %6 = load i32, i32* %j, align 4
  %7 = load i32, i32* %size.addr, align 4
  %cmp5 = icmp slt i32 %6, %7
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %8 = load double*, double** %x.addr, align 8
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %size.addr, align 4
  %mul7 = mul nsw i32 %9, %10
  %11 = load i32, i32* %k, align 4
  %add = add nsw i32 %mul7, %11
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds double, double* %8, i64 %idxprom
  %12 = load double, double* %arrayidx, align 8
  %13 = load double*, double** %y.addr, align 8
  %14 = load i32, i32* %k, align 4
  %15 = load i32, i32* %size.addr, align 4
  %mul8 = mul nsw i32 %14, %15
  %16 = load i32, i32* %j, align 4
  %add9 = add nsw i32 %mul8, %16
  %idxprom10 = sext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds double, double* %13, i64 %idxprom10
  %17 = load double, double* %arrayidx11, align 8
  %mul12 = fmul double %12, %17
  %18 = load double*, double** %z.addr, align 8
  %19 = load i32, i32* %i, align 4
  %20 = load i32, i32* %size.addr, align 4
  %mul13 = mul nsw i32 %19, %20
  %21 = load i32, i32* %j, align 4
  %add14 = add nsw i32 %mul13, %21
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds double, double* %18, i64 %idxprom15
  %22 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %22, %mul12
  store double %add17, double* %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %23 = load i32, i32* %i, align 4
  %mul18 = mul nsw i32 43, %23
  %24 = load i32, i32* %j, align 4
  %add19 = add nsw i32 %24, %mul18
  store i32 %add19, i32* %j, align 4
  br label %for.cond4, !llvm.loop !7

for.end:                                          ; preds = %for.cond4
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4
  %mul21 = mul nsw i32 42, %25
  %26 = load i32, i32* %k, align 4
  %add22 = add nsw i32 %26, %mul21
  store i32 %add22, i32* %k, align 4
  br label %for.cond1, !llvm.loop !9

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24

for.inc24:                                        ; preds = %for.end23
  %27 = load i32, i32* %i, align 4
  %mul25 = mul nsw i32 %27, 41
  %28 = load i32, i32* %i, align 4
  %add26 = add nsw i32 %28, %mul25
  store i32 %add26, i32* %i, align 4
  br label %for.cond, !llvm.loop !10

for.end27:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define dso_local void @_Z9product_dPKdS0_S0_S0_S0_S0_i(double* %x, double* %x_d, double* %y, double* %y_d, double* %z, double* %z_d, i32 %size) #0 {
entry:
  %x.addr = alloca double*, align 8
  %x_d.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %y_d.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  %z_d.addr = alloca double*, align 8
  %size.addr = alloca i32, align 4
  store double* %x, double** %x.addr, align 8
  store double* %x_d, double** %x_d.addr, align 8
  store double* %y, double** %y.addr, align 8
  store double* %y_d, double** %y_d.addr, align 8
  store double* %z, double** %z.addr, align 8
  store double* %z_d, double** %z_d.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  %0 = load i32, i32* @enzyme_dup, align 4
  %1 = load double*, double** %x.addr, align 8
  %2 = load double*, double** %x_d.addr, align 8
  %3 = load i32, i32* @enzyme_dup, align 4
  %4 = load double*, double** %y.addr, align 8
  %5 = load double*, double** %y_d.addr, align 8
  %6 = load i32, i32* @enzyme_dup, align 4
  %7 = load double*, double** %z.addr, align 8
  %8 = load double*, double** %z_d.addr, align 8
  %9 = load i32, i32* @enzyme_const, align 4
  %10 = load i32, i32* %size.addr, align 4
  %call = call double (i8*, ...) @_Z17__enzyme_autodiffPvz(i8* bitcast (void (double*, double*, double*, i32)* @_Z7productPdS_S_i to i8*), i32 %0, double* %1, double* %2, i32 %3, double* %4, double* %5, i32 %6, double* %7, double* %8, i32 %9, i32 %10)
  ret void
}

declare double @_Z17__enzyme_autodiffPvz(i8*, ...) #1

; Function Attrs: noinline optnone ssp uwtable mustprogress
define dso_local i64 @_Z22timeSinceEpochMillisecv() #0 {
entry:
  %ref.tmp = alloca %"class.std::__1::chrono::duration", align 8
  %ref.tmp1 = alloca %"class.std::__1::chrono::duration.0", align 8
  %ref.tmp2 = alloca %"class.std::__1::chrono::time_point", align 8
  %call = call i64 @_ZNSt3__16chrono12system_clock3nowEv() #11
  %coerce.dive = getelementptr inbounds %"class.std::__1::chrono::time_point", %"class.std::__1::chrono::time_point"* %ref.tmp2, i32 0, i32 0
  %coerce.dive3 = getelementptr inbounds %"class.std::__1::chrono::duration.0", %"class.std::__1::chrono::duration.0"* %coerce.dive, i32 0, i32 0
  store i64 %call, i64* %coerce.dive3, align 8
  %call4 = call i64 @_ZNKSt3__16chrono10time_pointINS0_12system_clockENS0_8durationIxNS_5ratioILl1ELl1000000EEEEEE16time_since_epochEv(%"class.std::__1::chrono::time_point"* nonnull dereferenceable(8) %ref.tmp2)
  %coerce.dive5 = getelementptr inbounds %"class.std::__1::chrono::duration.0", %"class.std::__1::chrono::duration.0"* %ref.tmp1, i32 0, i32 0
  store i64 %call4, i64* %coerce.dive5, align 8
  %call6 = call i64 @_ZNSt3__16chronoL13duration_castINS0_8durationIxNS_5ratioILl1ELl1000EEEEExNS3_ILl1ELl1000000EEEEENS_9enable_ifIXsr13__is_durationIT_EE5valueES8_E4typeERKNS2_IT0_T1_EE(%"class.std::__1::chrono::duration.0"* nonnull align 8 dereferenceable(8) %ref.tmp1)
  %coerce.dive7 = getelementptr inbounds %"class.std::__1::chrono::duration", %"class.std::__1::chrono::duration"* %ref.tmp, i32 0, i32 0
  store i64 %call6, i64* %coerce.dive7, align 8
  %call8 = call i64 @_ZNKSt3__16chrono8durationIxNS_5ratioILl1ELl1000EEEE5countEv(%"class.std::__1::chrono::duration"* nonnull dereferenceable(8) %ref.tmp)
  ret i64 %call8
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal i64 @_ZNSt3__16chronoL13duration_castINS0_8durationIxNS_5ratioILl1ELl1000EEEEExNS3_ILl1ELl1000000EEEEENS_9enable_ifIXsr13__is_durationIT_EE5valueES8_E4typeERKNS2_IT0_T1_EE(%"class.std::__1::chrono::duration.0"* nonnull align 8 dereferenceable(8) %__fd) #0 {
entry:
  %retval = alloca %"class.std::__1::chrono::duration", align 8
  %__fd.addr = alloca %"class.std::__1::chrono::duration.0"*, align 8
  %ref.tmp = alloca %"struct.std::__1::chrono::__duration_cast", align 1
  store %"class.std::__1::chrono::duration.0"* %__fd, %"class.std::__1::chrono::duration.0"** %__fd.addr, align 8
  %0 = load %"class.std::__1::chrono::duration.0"*, %"class.std::__1::chrono::duration.0"** %__fd.addr, align 8
  %call = call i64 @_ZNKSt3__16chrono15__duration_castINS0_8durationIxNS_5ratioILl1ELl1000000EEEEENS2_IxNS3_ILl1ELl1000EEEEES6_Lb1ELb0EEclERKS5_(%"struct.std::__1::chrono::__duration_cast"* nonnull dereferenceable(1) %ref.tmp, %"class.std::__1::chrono::duration.0"* nonnull align 8 dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"class.std::__1::chrono::duration", %"class.std::__1::chrono::duration"* %retval, i32 0, i32 0
  store i64 %call, i64* %coerce.dive, align 8
  %coerce.dive1 = getelementptr inbounds %"class.std::__1::chrono::duration", %"class.std::__1::chrono::duration"* %retval, i32 0, i32 0
  %1 = load i64, i64* %coerce.dive1, align 8
  ret i64 %1
}

; Function Attrs: nounwind
declare i64 @_ZNSt3__16chrono12system_clock3nowEv() #3

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i64 @_ZNKSt3__16chrono10time_pointINS0_12system_clockENS0_8durationIxNS_5ratioILl1ELl1000000EEEEEE16time_since_epochEv(%"class.std::__1::chrono::time_point"* nonnull dereferenceable(8) %this) #2 align 2 {
entry:
  %retval = alloca %"class.std::__1::chrono::duration.0", align 8
  %this.addr = alloca %"class.std::__1::chrono::time_point"*, align 8
  store %"class.std::__1::chrono::time_point"* %this, %"class.std::__1::chrono::time_point"** %this.addr, align 8
  %this1 = load %"class.std::__1::chrono::time_point"*, %"class.std::__1::chrono::time_point"** %this.addr, align 8
  %__d_ = getelementptr inbounds %"class.std::__1::chrono::time_point", %"class.std::__1::chrono::time_point"* %this1, i32 0, i32 0
  %0 = bitcast %"class.std::__1::chrono::duration.0"* %retval to i8*
  %1 = bitcast %"class.std::__1::chrono::duration.0"* %__d_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 8, i1 false)
  %coerce.dive = getelementptr inbounds %"class.std::__1::chrono::duration.0", %"class.std::__1::chrono::duration.0"* %retval, i32 0, i32 0
  %2 = load i64, i64* %coerce.dive, align 8
  ret i64 %2
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i64 @_ZNKSt3__16chrono8durationIxNS_5ratioILl1ELl1000EEEE5countEv(%"class.std::__1::chrono::duration"* nonnull dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::chrono::duration"*, align 8
  store %"class.std::__1::chrono::duration"* %this, %"class.std::__1::chrono::duration"** %this.addr, align 8
  %this1 = load %"class.std::__1::chrono::duration"*, %"class.std::__1::chrono::duration"** %this.addr, align 8
  %__rep_ = getelementptr inbounds %"class.std::__1::chrono::duration", %"class.std::__1::chrono::duration"* %this1, i32 0, i32 0
  %0 = load i64, i64* %__rep_, align 8
  ret i64 %0
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define dso_local void @_Z5startv() #0 {
entry:
  %call = call i64 @_Z22timeSinceEpochMillisecv()
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* @_ZL10start_time, align 4
  ret void
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define dso_local void @_Z3endv() #0 {
entry:
  %end_time = alloca i32, align 4
  %call = call i64 @_Z22timeSinceEpochMillisecv()
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %end_time, align 4
  %0 = load i32, i32* %end_time, align 4
  %1 = load i32, i32* @_ZL10start_time, align 4
  %sub = sub nsw i32 %0, %1
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %sub)
  %call2 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__15flushIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline optnone ssp uwtable mustprogress
define linkonce_odr nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__15flushIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__os) #0 {
entry:
  %__os.addr = alloca %"class.std::__1::basic_ostream"*, align 8
  store %"class.std::__1::basic_ostream"* %__os, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %0 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %call = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %0)
  %1 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  ret %"class.std::__1::basic_ostream"* %1
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define dso_local void @_Z5printRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPdm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %name, double* %values, i64 %size) #0 {
entry:
  %name.addr = alloca %"class.std::__1::basic_string"*, align 8
  %values.addr = alloca double*, align 8
  %size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  store %"class.std::__1::basic_string"* %name, %"class.std::__1::basic_string"** %name.addr, align 8
  store double* %values, double** %values.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  %0 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %name.addr, align 8
  %call = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__1lsIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0)
  %call1 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call, %"class.std::__1::basic_ostream"* (%"class.std::__1::basic_ostream"*)* @_ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_)
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8
  %2 = load i64, i64* %size.addr, align 8
  %cmp = icmp ult i64 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %values.addr, align 8
  %4 = load i64, i64* %i, align 8
  %arrayidx = getelementptr inbounds double, double* %3, i64 %4
  %5 = load double, double* %arrayidx, align 8
  %call2 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, double %5)
  %call3 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8
  %inc = add i64 %6, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  %call4 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, %"class.std::__1::basic_ostream"* (%"class.std::__1::basic_ostream"*)* @_ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define linkonce_odr nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__1lsIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__os, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %__str) #0 {
entry:
  %__os.addr = alloca %"class.std::__1::basic_ostream"*, align 8
  %__str.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_ostream"* %__os, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  store %"class.std::__1::basic_string"* %__str, %"class.std::__1::basic_string"** %__str.addr, align 8
  %0 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %__str.addr, align 8
  %call = call i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %1) #11
  %2 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %__str.addr, align 8
  %call1 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %2) #11
  %call2 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %0, i8* %call, i64 %call1)
  ret %"class.std::__1::basic_ostream"* %call2
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %this, %"class.std::__1::basic_ostream"* (%"class.std::__1::basic_ostream"*)* %__pf) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_ostream"*, align 8
  %__pf.addr = alloca %"class.std::__1::basic_ostream"* (%"class.std::__1::basic_ostream"*)*, align 8
  store %"class.std::__1::basic_ostream"* %this, %"class.std::__1::basic_ostream"** %this.addr, align 8
  store %"class.std::__1::basic_ostream"* (%"class.std::__1::basic_ostream"*)* %__pf, %"class.std::__1::basic_ostream"* (%"class.std::__1::basic_ostream"*)** %__pf.addr, align 8
  %this1 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %this.addr, align 8
  %0 = load %"class.std::__1::basic_ostream"* (%"class.std::__1::basic_ostream"*)*, %"class.std::__1::basic_ostream"* (%"class.std::__1::basic_ostream"*)** %__pf.addr, align 8
  %call = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* %0(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %this1)
  ret %"class.std::__1::basic_ostream"* %call
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define linkonce_odr nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__os) #0 {
entry:
  %__os.addr = alloca %"class.std::__1::basic_ostream"*, align 8
  store %"class.std::__1::basic_ostream"* %__os, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %0 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %1 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %2 = bitcast %"class.std::__1::basic_ostream"* %1 to i8**
  %vtable = load i8*, i8** %2, align 8
  %vbase.offset.ptr = getelementptr i8, i8* %vtable, i64 -24
  %3 = bitcast i8* %vbase.offset.ptr to i64*
  %vbase.offset = load i64, i64* %3, align 8
  %4 = bitcast %"class.std::__1::basic_ostream"* %1 to i8*
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %vbase.offset
  %5 = bitcast i8* %add.ptr to %"class.std::__1::basic_ios"*
  %call = call signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %5, i8 signext 10)
  %call1 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %0, i8 signext %call)
  %6 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %call2 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %6)
  %7 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  ret %"class.std::__1::basic_ostream"* %7
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define linkonce_odr nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__os, i8* %__str) #0 {
entry:
  %__os.addr = alloca %"class.std::__1::basic_ostream"*, align 8
  %__str.addr = alloca i8*, align 8
  store %"class.std::__1::basic_ostream"* %__os, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  store i8* %__str, i8** %__str.addr, align 8
  %0 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %1 = load i8*, i8** %__str.addr, align 8
  %2 = load i8*, i8** %__str.addr, align 8
  %call = call i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(i8* %2) #11
  %call1 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %0, i8* %1, i64 %call)
  ret %"class.std::__1::basic_ostream"* %call1
}

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8), double) #1

; Function Attrs: noinline norecurse optnone ssp uwtable mustprogress
define dso_local i32 @main(i32 %argc, i8** %argv) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %size = alloca i64, align 8
  %elements = alloca i64, align 8
  %x = alloca double*, align 8
  %y = alloca double*, align 8
  %z = alloca double*, align 8
  %x_d = alloca double*, align 8
  %y_d = alloca double*, align 8
  %z_d = alloca double*, align 8
  %i = alloca i64, align 8
  %ref.tmp = alloca %"class.std::__1::basic_string", align 8
  %exn.slot = alloca i8*, align 8
  %ehselector.slot = alloca i32, align 4
  %ref.tmp18 = alloca %"class.std::__1::basic_string", align 8
  %ref.tmp24 = alloca %"class.std::__1::basic_string", align 8
  %ref.tmp30 = alloca %"class.std::__1::basic_string", align 8
  %ref.tmp36 = alloca %"class.std::__1::basic_string", align 8
  %ref.tmp42 = alloca %"class.std::__1::basic_string", align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i64 2, i64* %size, align 8
  %0 = load i64, i64* %size, align 8
  %1 = load i64, i64* %size, align 8
  %mul = mul i64 %0, %1
  store i64 %mul, i64* %elements, align 8
  %2 = load i64, i64* %elements, align 8
  %3 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %2, i64 8)
  %4 = extractvalue { i64, i1 } %3, 1
  %5 = extractvalue { i64, i1 } %3, 0
  %6 = select i1 %4, i64 -1, i64 %5
  %call = call noalias nonnull i8* @_Znam(i64 %6) #12
  %7 = bitcast i8* %call to double*
  store double* %7, double** %x, align 8
  %8 = load i64, i64* %elements, align 8
  %9 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %8, i64 8)
  %10 = extractvalue { i64, i1 } %9, 1
  %11 = extractvalue { i64, i1 } %9, 0
  %12 = select i1 %10, i64 -1, i64 %11
  %call1 = call noalias nonnull i8* @_Znam(i64 %12) #12
  %13 = bitcast i8* %call1 to double*
  store double* %13, double** %y, align 8
  %14 = load i64, i64* %elements, align 8
  %15 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %14, i64 8)
  %16 = extractvalue { i64, i1 } %15, 1
  %17 = extractvalue { i64, i1 } %15, 0
  %18 = select i1 %16, i64 -1, i64 %17
  %call2 = call noalias nonnull i8* @_Znam(i64 %18) #12
  %19 = bitcast i8* %call2 to double*
  store double* %19, double** %z, align 8
  %20 = load i64, i64* %elements, align 8
  %21 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %20, i64 8)
  %22 = extractvalue { i64, i1 } %21, 1
  %23 = extractvalue { i64, i1 } %21, 0
  %24 = select i1 %22, i64 -1, i64 %23
  %call3 = call noalias nonnull i8* @_Znam(i64 %24) #12
  %25 = bitcast i8* %call3 to double*
  store double* %25, double** %x_d, align 8
  %26 = load i64, i64* %elements, align 8
  %27 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %26, i64 8)
  %28 = extractvalue { i64, i1 } %27, 1
  %29 = extractvalue { i64, i1 } %27, 0
  %30 = select i1 %28, i64 -1, i64 %29
  %call4 = call noalias nonnull i8* @_Znam(i64 %30) #12
  %31 = bitcast i8* %call4 to double*
  store double* %31, double** %y_d, align 8
  %32 = load i64, i64* %elements, align 8
  %33 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %32, i64 8)
  %34 = extractvalue { i64, i1 } %33, 1
  %35 = extractvalue { i64, i1 } %33, 0
  %36 = select i1 %34, i64 -1, i64 %35
  %call5 = call noalias nonnull i8* @_Znam(i64 %36) #12
  %37 = bitcast i8* %call5 to double*
  store double* %37, double** %z_d, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %38 = load i64, i64* %i, align 8
  %39 = load i64, i64* %elements, align 8
  %cmp = icmp ult i64 %38, %39
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %40 = load i64, i64* %i, align 8
  %add = add i64 %40, 1
  %conv = uitofp i64 %add to double
  %41 = load double*, double** %x, align 8
  %42 = load i64, i64* %i, align 8
  %arrayidx = getelementptr inbounds double, double* %41, i64 %42
  store double %conv, double* %arrayidx, align 8
  %43 = load i64, i64* %i, align 8
  %add6 = add i64 %43, 2
  %conv7 = uitofp i64 %add6 to double
  %44 = load double*, double** %y, align 8
  %45 = load i64, i64* %i, align 8
  %arrayidx8 = getelementptr inbounds double, double* %44, i64 %45
  store double %conv7, double* %arrayidx8, align 8
  %46 = load double*, double** %z, align 8
  %47 = load i64, i64* %i, align 8
  %arrayidx9 = getelementptr inbounds double, double* %46, i64 %47
  store double 0.000000e+00, double* %arrayidx9, align 8
  %48 = load double*, double** %x_d, align 8
  %49 = load i64, i64* %i, align 8
  %arrayidx10 = getelementptr inbounds double, double* %48, i64 %49
  store double 0.000000e+00, double* %arrayidx10, align 8
  %50 = load double*, double** %y_d, align 8
  %51 = load i64, i64* %i, align 8
  %arrayidx11 = getelementptr inbounds double, double* %50, i64 %51
  store double 0.000000e+00, double* %arrayidx11, align 8
  %52 = load double*, double** %z_d, align 8
  %53 = load i64, i64* %i, align 8
  %arrayidx12 = getelementptr inbounds double, double* %52, i64 %53
  store double 0.000000e+00, double* %arrayidx12, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %54 = load i64, i64* %i, align 8
  %inc = add i64 %54, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond
  %55 = load double*, double** %z_d, align 8
  %arrayidx13 = getelementptr inbounds double, double* %55, i64 0
  store double 1.000000e+00, double* %arrayidx13, align 8
  %56 = load double*, double** %x, align 8
  %57 = load double*, double** %x_d, align 8
  %58 = load double*, double** %y, align 8
  %59 = load double*, double** %y_d, align 8
  %60 = load double*, double** %z, align 8
  %61 = load double*, double** %z_d, align 8
  %62 = load i64, i64* %size, align 8
  %conv14 = trunc i64 %62 to i32
  call void @_Z9product_dPKdS0_S0_S0_S0_S0_i(double* %56, double* %57, double* %58, double* %59, double* %60, double* %61, i32 %conv14)
  %call15 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1IDnEEPKc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  %63 = load double*, double** %x, align 8
  %64 = load i64, i64* %elements, align 8
  invoke void @_Z5printRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPdm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %ref.tmp, double* %63, i64 %64)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %for.end
  %call16 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp) #11
  %call19 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1IDnEEPKc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp18, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  %65 = load double*, double** %y, align 8
  %66 = load i64, i64* %elements, align 8
  invoke void @_Z5printRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPdm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %ref.tmp18, double* %65, i64 %66)
          to label %invoke.cont21 unwind label %lpad20

invoke.cont21:                                    ; preds = %invoke.cont
  %call22 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp18) #11
  %call25 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1IDnEEPKc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp24, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  %67 = load double*, double** %z, align 8
  %68 = load i64, i64* %elements, align 8
  invoke void @_Z5printRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPdm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %ref.tmp24, double* %67, i64 %68)
          to label %invoke.cont27 unwind label %lpad26

invoke.cont27:                                    ; preds = %invoke.cont21
  %call28 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp24) #11
  %call31 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1IDnEEPKc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp30, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0))
  %69 = load double*, double** %x_d, align 8
  %70 = load i64, i64* %elements, align 8
  invoke void @_Z5printRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPdm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %ref.tmp30, double* %69, i64 %70)
          to label %invoke.cont33 unwind label %lpad32

invoke.cont33:                                    ; preds = %invoke.cont27
  %call34 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp30) #11
  %call37 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1IDnEEPKc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp36, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0))
  %71 = load double*, double** %y_d, align 8
  %72 = load i64, i64* %elements, align 8
  invoke void @_Z5printRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPdm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %ref.tmp36, double* %71, i64 %72)
          to label %invoke.cont39 unwind label %lpad38

invoke.cont39:                                    ; preds = %invoke.cont33
  %call40 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp36) #11
  %call43 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1IDnEEPKc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp42, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0))
  %73 = load double*, double** %z_d, align 8
  %74 = load i64, i64* %elements, align 8
  invoke void @_Z5printRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPdm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %ref.tmp42, double* %73, i64 %74)
          to label %invoke.cont45 unwind label %lpad44

invoke.cont45:                                    ; preds = %invoke.cont39
  %call46 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp42) #11
  ret i32 0

lpad:                                             ; preds = %for.end
  %75 = landingpad { i8*, i32 }
          cleanup
  %76 = extractvalue { i8*, i32 } %75, 0
  store i8* %76, i8** %exn.slot, align 8
  %77 = extractvalue { i8*, i32 } %75, 1
  store i32 %77, i32* %ehselector.slot, align 4
  %call17 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp) #11
  br label %eh.resume

lpad20:                                           ; preds = %invoke.cont
  %78 = landingpad { i8*, i32 }
          cleanup
  %79 = extractvalue { i8*, i32 } %78, 0
  store i8* %79, i8** %exn.slot, align 8
  %80 = extractvalue { i8*, i32 } %78, 1
  store i32 %80, i32* %ehselector.slot, align 4
  %call23 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp18) #11
  br label %eh.resume

lpad26:                                           ; preds = %invoke.cont21
  %81 = landingpad { i8*, i32 }
          cleanup
  %82 = extractvalue { i8*, i32 } %81, 0
  store i8* %82, i8** %exn.slot, align 8
  %83 = extractvalue { i8*, i32 } %81, 1
  store i32 %83, i32* %ehselector.slot, align 4
  %call29 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp24) #11
  br label %eh.resume

lpad32:                                           ; preds = %invoke.cont27
  %84 = landingpad { i8*, i32 }
          cleanup
  %85 = extractvalue { i8*, i32 } %84, 0
  store i8* %85, i8** %exn.slot, align 8
  %86 = extractvalue { i8*, i32 } %84, 1
  store i32 %86, i32* %ehselector.slot, align 4
  %call35 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp30) #11
  br label %eh.resume

lpad38:                                           ; preds = %invoke.cont33
  %87 = landingpad { i8*, i32 }
          cleanup
  %88 = extractvalue { i8*, i32 } %87, 0
  store i8* %88, i8** %exn.slot, align 8
  %89 = extractvalue { i8*, i32 } %87, 1
  store i32 %89, i32* %ehselector.slot, align 4
  %call41 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp36) #11
  br label %eh.resume

lpad44:                                           ; preds = %invoke.cont39
  %90 = landingpad { i8*, i32 }
          cleanup
  %91 = extractvalue { i8*, i32 } %90, 0
  store i8* %91, i8** %exn.slot, align 8
  %92 = extractvalue { i8*, i32 } %90, 1
  store i32 %92, i32* %ehselector.slot, align 4
  %call47 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %ref.tmp42) #11
  br label %eh.resume

eh.resume:                                        ; preds = %lpad44, %lpad38, %lpad32, %lpad26, %lpad20, %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val48 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #5

; Function Attrs: nobuiltin allocsize(0)
declare nonnull i8* @_Znam(i64) #6

; Function Attrs: noinline optnone ssp uwtable
define internal %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1IDnEEPKc(%"class.std::__1::basic_string"* nonnull returned dereferenceable(24) %this, i8* %__s) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__s.addr = alloca i8*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  store i8* %__s, i8** %__s.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %0 = load i8*, i8** %__s.addr, align 8
  %call = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2IDnEEPKc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1, i8* %0)
  ret %"class.std::__1::basic_string"* %this1
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull returned dereferenceable(24)) unnamed_addr #3

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal i64 @_ZNKSt3__16chrono15__duration_castINS0_8durationIxNS_5ratioILl1ELl1000000EEEEENS2_IxNS3_ILl1ELl1000EEEEES6_Lb1ELb0EEclERKS5_(%"struct.std::__1::chrono::__duration_cast"* nonnull dereferenceable(1) %this, %"class.std::__1::chrono::duration.0"* nonnull align 8 dereferenceable(8) %__fd) #0 align 2 {
entry:
  %retval = alloca %"class.std::__1::chrono::duration", align 8
  %this.addr = alloca %"struct.std::__1::chrono::__duration_cast"*, align 8
  %__fd.addr = alloca %"class.std::__1::chrono::duration.0"*, align 8
  %ref.tmp = alloca i64, align 8
  store %"struct.std::__1::chrono::__duration_cast"* %this, %"struct.std::__1::chrono::__duration_cast"** %this.addr, align 8
  store %"class.std::__1::chrono::duration.0"* %__fd, %"class.std::__1::chrono::duration.0"** %__fd.addr, align 8
  %this1 = load %"struct.std::__1::chrono::__duration_cast"*, %"struct.std::__1::chrono::__duration_cast"** %this.addr, align 8
  %0 = load %"class.std::__1::chrono::duration.0"*, %"class.std::__1::chrono::duration.0"** %__fd.addr, align 8
  %call = call i64 @_ZNKSt3__16chrono8durationIxNS_5ratioILl1ELl1000000EEEE5countEv(%"class.std::__1::chrono::duration.0"* nonnull dereferenceable(8) %0)
  %div = sdiv i64 %call, 1000
  store i64 %div, i64* %ref.tmp, align 8
  %call2 = call %"class.std::__1::chrono::duration"* @_ZNSt3__16chrono8durationIxNS_5ratioILl1ELl1000EEEEC1IxEERKT_PNS_9enable_ifIXaasr14is_convertibleIS6_xEE5valueooL_ZNS_17integral_constantIbLb0EE5valueEEntsr23treat_as_floating_pointIS6_EE5valueEvE4typeE(%"class.std::__1::chrono::duration"* nonnull dereferenceable(8) %retval, i64* nonnull align 8 dereferenceable(8) %ref.tmp, i8* null)
  %coerce.dive = getelementptr inbounds %"class.std::__1::chrono::duration", %"class.std::__1::chrono::duration"* %retval, i32 0, i32 0
  %1 = load i64, i64* %coerce.dive, align 8
  ret i64 %1
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i64 @_ZNKSt3__16chrono8durationIxNS_5ratioILl1ELl1000000EEEE5countEv(%"class.std::__1::chrono::duration.0"* nonnull dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::chrono::duration.0"*, align 8
  store %"class.std::__1::chrono::duration.0"* %this, %"class.std::__1::chrono::duration.0"** %this.addr, align 8
  %this1 = load %"class.std::__1::chrono::duration.0"*, %"class.std::__1::chrono::duration.0"** %this.addr, align 8
  %__rep_ = getelementptr inbounds %"class.std::__1::chrono::duration.0", %"class.std::__1::chrono::duration.0"* %this1, i32 0, i32 0
  %0 = load i64, i64* %__rep_, align 8
  ret i64 %0
}

; Function Attrs: noinline optnone ssp uwtable
define internal %"class.std::__1::chrono::duration"* @_ZNSt3__16chrono8durationIxNS_5ratioILl1ELl1000EEEEC1IxEERKT_PNS_9enable_ifIXaasr14is_convertibleIS6_xEE5valueooL_ZNS_17integral_constantIbLb0EE5valueEEntsr23treat_as_floating_pointIS6_EE5valueEvE4typeE(%"class.std::__1::chrono::duration"* nonnull returned dereferenceable(8) %this, i64* nonnull align 8 dereferenceable(8) %__r, i8* %0) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::chrono::duration"*, align 8
  %__r.addr = alloca i64*, align 8
  %.addr = alloca i8*, align 8
  store %"class.std::__1::chrono::duration"* %this, %"class.std::__1::chrono::duration"** %this.addr, align 8
  store i64* %__r, i64** %__r.addr, align 8
  store i8* %0, i8** %.addr, align 8
  %this1 = load %"class.std::__1::chrono::duration"*, %"class.std::__1::chrono::duration"** %this.addr, align 8
  %1 = load i64*, i64** %__r.addr, align 8
  %2 = load i8*, i8** %.addr, align 8
  %call = call %"class.std::__1::chrono::duration"* @_ZNSt3__16chrono8durationIxNS_5ratioILl1ELl1000EEEEC2IxEERKT_PNS_9enable_ifIXaasr14is_convertibleIS6_xEE5valueooL_ZNS_17integral_constantIbLb0EE5valueEEntsr23treat_as_floating_pointIS6_EE5valueEvE4typeE(%"class.std::__1::chrono::duration"* nonnull dereferenceable(8) %this1, i64* nonnull align 8 dereferenceable(8) %1, i8* %2)
  ret %"class.std::__1::chrono::duration"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %"class.std::__1::chrono::duration"* @_ZNSt3__16chrono8durationIxNS_5ratioILl1ELl1000EEEEC2IxEERKT_PNS_9enable_ifIXaasr14is_convertibleIS6_xEE5valueooL_ZNS_17integral_constantIbLb0EE5valueEEntsr23treat_as_floating_pointIS6_EE5valueEvE4typeE(%"class.std::__1::chrono::duration"* nonnull returned dereferenceable(8) %this, i64* nonnull align 8 dereferenceable(8) %__r, i8* %0) unnamed_addr #8 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::chrono::duration"*, align 8
  %__r.addr = alloca i64*, align 8
  %.addr = alloca i8*, align 8
  store %"class.std::__1::chrono::duration"* %this, %"class.std::__1::chrono::duration"** %this.addr, align 8
  store i64* %__r, i64** %__r.addr, align 8
  store i8* %0, i8** %.addr, align 8
  %this1 = load %"class.std::__1::chrono::duration"*, %"class.std::__1::chrono::duration"** %this.addr, align 8
  %__rep_ = getelementptr inbounds %"class.std::__1::chrono::duration", %"class.std::__1::chrono::duration"* %this1, i32 0, i32 0
  %1 = load i64*, i64** %__r.addr, align 8
  %2 = load i64, i64* %1, align 8
  store i64 %2, i64* %__rep_, align 8
  ret %"class.std::__1::chrono::duration"* %this1
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #9

; Function Attrs: noinline optnone ssp uwtable
define internal %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2IDnEEPKc(%"class.std::__1::basic_string"* nonnull returned dereferenceable(24) %this, i8* %__s) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__s.addr = alloca i8*, align 8
  %ref.tmp = alloca %"struct.std::__1::__default_init_tag", align 1
  %ref.tmp2 = alloca %"struct.std::__1::__default_init_tag", align 1
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  store i8* %__s, i8** %__s.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_string"* %this1 to %"class.std::__1::__basic_string_common"*
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %__r_, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %ref.tmp, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %ref.tmp2)
  %1 = load i8*, i8** %__s.addr, align 8
  %2 = load i8*, i8** %__s.addr, align 8
  %call3 = call i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(i8* %2) #11
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1, i8* %1, i64 %call3)
  ret %"class.std::__1::basic_string"* %this1
}

; Function Attrs: noinline optnone ssp uwtable
define internal %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* nonnull returned dereferenceable(24) %this, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %__t1, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %__t2) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  %__t1.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  %__t2.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  store %"struct.std::__1::__default_init_tag"* %__t1, %"struct.std::__1::__default_init_tag"** %__t1.addr, align 8
  store %"struct.std::__1::__default_init_tag"* %__t2, %"struct.std::__1::__default_init_tag"** %__t2.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t1.addr, align 8
  %1 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t2.addr, align 8
  %call = call %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %this1, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %0, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %1)
  ret %"class.std::__1::__compressed_pair"* %this1
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(%"class.std::__1::basic_string"* nonnull dereferenceable(24), i8*, i64) #1

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define linkonce_odr i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(i8* %__s) #2 align 2 {
entry:
  %__s.addr = alloca i8*, align 8
  store i8* %__s, i8** %__s.addr, align 8
  %0 = load i8*, i8** %__s.addr, align 8
  %call = call i64 @strlen(i8* %0) #11
  ret i64 %call
}

; Function Attrs: noinline optnone ssp uwtable
define internal %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* nonnull returned dereferenceable(24) %this, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %__t1, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %__t2) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  %__t1.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  %__t2.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  %agg.tmp = alloca %"struct.std::__1::__default_init_tag", align 1
  %agg.tmp3 = alloca %"struct.std::__1::__default_init_tag", align 1
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  store %"struct.std::__1::__default_init_tag"* %__t1, %"struct.std::__1::__default_init_tag"** %__t1.addr, align 8
  store %"struct.std::__1::__default_init_tag"* %__t2, %"struct.std::__1::__default_init_tag"** %__t2.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem"*
  %1 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t1.addr, align 8
  %call = call nonnull align 1 dereferenceable(1) %"struct.std::__1::__default_init_tag"* @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(%"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %1) #11
  %call2 = call %"struct.std::__1::__compressed_pair_elem"* @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2ENS_18__default_init_tagE(%"struct.std::__1::__compressed_pair_elem"* nonnull dereferenceable(24) %0)
  %2 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem.1"*
  %3 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t2.addr, align 8
  %call4 = call nonnull align 1 dereferenceable(1) %"struct.std::__1::__default_init_tag"* @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(%"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %3) #11
  %call5 = call %"struct.std::__1::__compressed_pair_elem.1"* @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2ENS_18__default_init_tagE(%"struct.std::__1::__compressed_pair_elem.1"* nonnull dereferenceable(1) %2)
  ret %"class.std::__1::__compressed_pair"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal nonnull align 1 dereferenceable(1) %"struct.std::__1::__default_init_tag"* @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(%"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %__t) #2 {
entry:
  %__t.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  store %"struct.std::__1::__default_init_tag"* %__t, %"struct.std::__1::__default_init_tag"** %__t.addr, align 8
  %0 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t.addr, align 8
  ret %"struct.std::__1::__default_init_tag"* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %"struct.std::__1::__compressed_pair_elem"* @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2ENS_18__default_init_tagE(%"struct.std::__1::__compressed_pair_elem"* nonnull returned dereferenceable(24) %this) unnamed_addr #8 align 2 {
entry:
  %0 = alloca %"struct.std::__1::__default_init_tag", align 1
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  store %"struct.std::__1::__compressed_pair_elem"* %this, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %this1, i32 0, i32 0
  ret %"struct.std::__1::__compressed_pair_elem"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %"struct.std::__1::__compressed_pair_elem.1"* @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2ENS_18__default_init_tagE(%"struct.std::__1::__compressed_pair_elem.1"* nonnull returned dereferenceable(1) %this) unnamed_addr #8 align 2 {
entry:
  %0 = alloca %"struct.std::__1::__default_init_tag", align 1
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.1"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.1"* %this, %"struct.std::__1::__compressed_pair_elem.1"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.1"*, %"struct.std::__1::__compressed_pair_elem.1"** %this.addr, align 8
  %1 = bitcast %"struct.std::__1::__compressed_pair_elem.1"* %this1 to %"class.std::__1::allocator"*
  %call = call %"class.std::__1::allocator"* @_ZNSt3__19allocatorIcEC2Ev(%"class.std::__1::allocator"* nonnull dereferenceable(1) %1) #11
  ret %"struct.std::__1::__compressed_pair_elem.1"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %"class.std::__1::allocator"* @_ZNSt3__19allocatorIcEC2Ev(%"class.std::__1::allocator"* nonnull returned dereferenceable(1) %this) unnamed_addr #8 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::allocator"*, align 8
  store %"class.std::__1::allocator"* %this, %"class.std::__1::allocator"** %this.addr, align 8
  %this1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::allocator"* %this1 to %"struct.std::__1::__non_trivial_if"*
  %call = call %"struct.std::__1::__non_trivial_if"* @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2Ev(%"struct.std::__1::__non_trivial_if"* nonnull dereferenceable(1) %0) #11
  ret %"class.std::__1::allocator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %"struct.std::__1::__non_trivial_if"* @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2Ev(%"struct.std::__1::__non_trivial_if"* nonnull returned dereferenceable(1) %this) unnamed_addr #8 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__non_trivial_if"*, align 8
  store %"struct.std::__1::__non_trivial_if"* %this, %"struct.std::__1::__non_trivial_if"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__non_trivial_if"*, %"struct.std::__1::__non_trivial_if"** %this.addr, align 8
  ret %"struct.std::__1::__non_trivial_if"* %this1
}

; Function Attrs: nounwind
declare i64 @strlen(i8*) #3

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8)) #1

; Function Attrs: noinline optnone ssp uwtable mustprogress
define linkonce_odr nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__os, i8* %__str, i64 %__len) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__os.addr = alloca %"class.std::__1::basic_ostream"*, align 8
  %__str.addr = alloca i8*, align 8
  %__len.addr = alloca i64, align 8
  %__s = alloca %"class.std::__1::basic_ostream<char>::sentry", align 8
  %exn.slot = alloca i8*, align 8
  %ehselector.slot = alloca i32, align 4
  %ref.tmp = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %agg.tmp = alloca %"class.std::__1::ostreambuf_iterator", align 8
  store %"class.std::__1::basic_ostream"* %__os, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  store i8* %__str, i8** %__str.addr, align 8
  store i64 %__len, i64* %__len.addr, align 8
  %0 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %call = invoke %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(%"class.std::__1::basic_ostream<char>::sentry"* nonnull dereferenceable(16) %__s, %"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %0)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call3 = invoke zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv(%"class.std::__1::basic_ostream<char>::sentry"* nonnull dereferenceable(16) %__s)
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %invoke.cont
  br i1 %call3, label %if.then, label %if.end29

if.then:                                          ; preds = %invoke.cont2
  %1 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %call4 = call %"class.std::__1::ostreambuf_iterator"* @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE(%"class.std::__1::ostreambuf_iterator"* nonnull dereferenceable(8) %agg.tmp, %"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %1) #11
  %2 = load i8*, i8** %__str.addr, align 8
  %3 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %4 = bitcast %"class.std::__1::basic_ostream"* %3 to i8**
  %vtable = load i8*, i8** %4, align 8
  %vbase.offset.ptr = getelementptr i8, i8* %vtable, i64 -24
  %5 = bitcast i8* %vbase.offset.ptr to i64*
  %vbase.offset = load i64, i64* %5, align 8
  %6 = bitcast %"class.std::__1::basic_ostream"* %3 to i8*
  %add.ptr = getelementptr inbounds i8, i8* %6, i64 %vbase.offset
  %7 = bitcast i8* %add.ptr to %"class.std::__1::ios_base"*
  %call6 = invoke i32 @_ZNKSt3__18ios_base5flagsEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %7)
          to label %invoke.cont5 unwind label %lpad1

invoke.cont5:                                     ; preds = %if.then
  %and = and i32 %call6, 176
  %cmp = icmp eq i32 %and, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %invoke.cont5
  %8 = load i8*, i8** %__str.addr, align 8
  %9 = load i64, i64* %__len.addr, align 8
  %add.ptr7 = getelementptr inbounds i8, i8* %8, i64 %9
  br label %cond.end

cond.false:                                       ; preds = %invoke.cont5
  %10 = load i8*, i8** %__str.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %add.ptr7, %cond.true ], [ %10, %cond.false ]
  %11 = load i8*, i8** %__str.addr, align 8
  %12 = load i64, i64* %__len.addr, align 8
  %add.ptr8 = getelementptr inbounds i8, i8* %11, i64 %12
  %13 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %14 = bitcast %"class.std::__1::basic_ostream"* %13 to i8**
  %vtable9 = load i8*, i8** %14, align 8
  %vbase.offset.ptr10 = getelementptr i8, i8* %vtable9, i64 -24
  %15 = bitcast i8* %vbase.offset.ptr10 to i64*
  %vbase.offset11 = load i64, i64* %15, align 8
  %16 = bitcast %"class.std::__1::basic_ostream"* %13 to i8*
  %add.ptr12 = getelementptr inbounds i8, i8* %16, i64 %vbase.offset11
  %17 = bitcast i8* %add.ptr12 to %"class.std::__1::ios_base"*
  %18 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %19 = bitcast %"class.std::__1::basic_ostream"* %18 to i8**
  %vtable13 = load i8*, i8** %19, align 8
  %vbase.offset.ptr14 = getelementptr i8, i8* %vtable13, i64 -24
  %20 = bitcast i8* %vbase.offset.ptr14 to i64*
  %vbase.offset15 = load i64, i64* %20, align 8
  %21 = bitcast %"class.std::__1::basic_ostream"* %18 to i8*
  %add.ptr16 = getelementptr inbounds i8, i8* %21, i64 %vbase.offset15
  %22 = bitcast i8* %add.ptr16 to %"class.std::__1::basic_ios"*
  %call18 = invoke signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %22)
          to label %invoke.cont17 unwind label %lpad1

invoke.cont17:                                    ; preds = %cond.end
  %coerce.dive = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %agg.tmp, i32 0, i32 0
  %23 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %coerce.dive, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::basic_streambuf"* %23 to i64
  %call20 = invoke i64 @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %coerce.val.pi, i8* %2, i8* %cond, i8* %add.ptr8, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %17, i8 signext %call18)
          to label %invoke.cont19 unwind label %lpad1

invoke.cont19:                                    ; preds = %invoke.cont17
  %coerce.dive21 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %ref.tmp, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %call20 to %"class.std::__1::basic_streambuf"*
  store %"class.std::__1::basic_streambuf"* %coerce.val.ip, %"class.std::__1::basic_streambuf"** %coerce.dive21, align 8
  %call22 = call zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv(%"class.std::__1::ostreambuf_iterator"* nonnull dereferenceable(8) %ref.tmp) #11
  br i1 %call22, label %if.then23, label %if.end

if.then23:                                        ; preds = %invoke.cont19
  %24 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %25 = bitcast %"class.std::__1::basic_ostream"* %24 to i8**
  %vtable24 = load i8*, i8** %25, align 8
  %vbase.offset.ptr25 = getelementptr i8, i8* %vtable24, i64 -24
  %26 = bitcast i8* %vbase.offset.ptr25 to i64*
  %vbase.offset26 = load i64, i64* %26, align 8
  %27 = bitcast %"class.std::__1::basic_ostream"* %24 to i8*
  %add.ptr27 = getelementptr inbounds i8, i8* %27, i64 %vbase.offset26
  %28 = bitcast i8* %add.ptr27 to %"class.std::__1::basic_ios"*
  invoke void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %28, i32 5)
          to label %invoke.cont28 unwind label %lpad1

invoke.cont28:                                    ; preds = %if.then23
  br label %if.end

lpad:                                             ; preds = %entry
  %29 = landingpad { i8*, i32 }
          catch i8* null
  %30 = extractvalue { i8*, i32 } %29, 0
  store i8* %30, i8** %exn.slot, align 8
  %31 = extractvalue { i8*, i32 } %29, 1
  store i32 %31, i32* %ehselector.slot, align 4
  br label %catch

lpad1:                                            ; preds = %if.then23, %invoke.cont17, %cond.end, %if.then, %invoke.cont
  %32 = landingpad { i8*, i32 }
          catch i8* null
  %33 = extractvalue { i8*, i32 } %32, 0
  store i8* %33, i8** %exn.slot, align 8
  %34 = extractvalue { i8*, i32 } %32, 1
  store i32 %34, i32* %ehselector.slot, align 4
  %call31 = call %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(%"class.std::__1::basic_ostream<char>::sentry"* nonnull dereferenceable(16) %__s) #11
  br label %catch

catch:                                            ; preds = %lpad1, %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %35 = call i8* @__cxa_begin_catch(i8* %exn) #11
  %36 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  %37 = bitcast %"class.std::__1::basic_ostream"* %36 to i8**
  %vtable32 = load i8*, i8** %37, align 8
  %vbase.offset.ptr33 = getelementptr i8, i8* %vtable32, i64 -24
  %38 = bitcast i8* %vbase.offset.ptr33 to i64*
  %vbase.offset34 = load i64, i64* %38, align 8
  %39 = bitcast %"class.std::__1::basic_ostream"* %36 to i8*
  %add.ptr35 = getelementptr inbounds i8, i8* %39, i64 %vbase.offset34
  %40 = bitcast i8* %add.ptr35 to %"class.std::__1::ios_base"*
  invoke void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %40)
          to label %invoke.cont37 unwind label %lpad36

invoke.cont37:                                    ; preds = %catch
  call void @__cxa_end_catch()
  br label %try.cont

try.cont:                                         ; preds = %invoke.cont37, %if.end29
  %41 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__os.addr, align 8
  ret %"class.std::__1::basic_ostream"* %41

if.end:                                           ; preds = %invoke.cont28, %invoke.cont19
  br label %if.end29

if.end29:                                         ; preds = %if.end, %invoke.cont2
  %call30 = call %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(%"class.std::__1::basic_ostream<char>::sentry"* nonnull dereferenceable(16) %__s) #11
  br label %try.cont

lpad36:                                           ; preds = %catch
  %42 = landingpad { i8*, i32 }
          cleanup
  %43 = extractvalue { i8*, i32 } %42, 0
  store i8* %43, i8** %exn.slot, align 8
  %44 = extractvalue { i8*, i32 } %42, 1
  store i32 %44, i32* %ehselector.slot, align 4
  invoke void @__cxa_end_catch()
          to label %invoke.cont38 unwind label %terminate.lpad

invoke.cont38:                                    ; preds = %lpad36
  br label %eh.resume

eh.resume:                                        ; preds = %invoke.cont38
  %exn39 = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn39, 0
  %lpad.val40 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val40

terminate.lpad:                                   ; preds = %lpad36
  %45 = landingpad { i8*, i32 }
          catch i8* null
  %46 = extractvalue { i8*, i32 } %45, 0
  call void @__clang_call_terminate(i8* %46) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %call = call i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1) #11
  %call2 = call i8* @_ZNSt3__1L12__to_addressIKcEEPT_S3_(i8* %call) #11
  ret i8* %call2
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %call = call zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1) #11
  br i1 %call, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call2 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1) #11
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call3 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1) #11
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %call2, %cond.true ], [ %call3, %cond.false ]
  ret i64 %cond
}

declare %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(%"class.std::__1::basic_ostream<char>::sentry"* nonnull returned dereferenceable(16), %"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8)) unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv(%"class.std::__1::basic_ostream<char>::sentry"* nonnull dereferenceable(16) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_ostream<char>::sentry"*, align 8
  store %"class.std::__1::basic_ostream<char>::sentry"* %this, %"class.std::__1::basic_ostream<char>::sentry"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_ostream<char>::sentry"*, %"class.std::__1::basic_ostream<char>::sentry"** %this.addr, align 8
  %__ok_ = getelementptr inbounds %"class.std::__1::basic_ostream<char>::sentry", %"class.std::__1::basic_ostream<char>::sentry"* %this1, i32 0, i32 0
  %0 = load i8, i8* %__ok_, align 8
  %tobool = trunc i8 %0 to i1
  ret i1 %tobool
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define linkonce_odr hidden i64 @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %__s.coerce, i8* %__ob, i8* %__op, i8* %__oe, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %__iob, i8 signext %__fl) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %retval = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %__s = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %__ob.addr = alloca i8*, align 8
  %__op.addr = alloca i8*, align 8
  %__oe.addr = alloca i8*, align 8
  %__iob.addr = alloca %"class.std::__1::ios_base"*, align 8
  %__fl.addr = alloca i8, align 1
  %__sz = alloca i64, align 8
  %__ns = alloca i64, align 8
  %__np = alloca i64, align 8
  %__sp = alloca %"class.std::__1::basic_string", align 8
  %exn.slot = alloca i8*, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %coerce.dive = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %__s, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %__s.coerce to %"class.std::__1::basic_streambuf"*
  store %"class.std::__1::basic_streambuf"* %coerce.val.ip, %"class.std::__1::basic_streambuf"** %coerce.dive, align 8
  store i8* %__ob, i8** %__ob.addr, align 8
  store i8* %__op, i8** %__op.addr, align 8
  store i8* %__oe, i8** %__oe.addr, align 8
  store %"class.std::__1::ios_base"* %__iob, %"class.std::__1::ios_base"** %__iob.addr, align 8
  store i8 %__fl, i8* %__fl.addr, align 1
  %__sbuf_ = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %__s, i32 0, i32 0
  %0 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %__sbuf_, align 8
  %cmp = icmp eq %"class.std::__1::basic_streambuf"* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = bitcast %"class.std::__1::ostreambuf_iterator"* %retval to i8*
  %2 = bitcast %"class.std::__1::ostreambuf_iterator"* %__s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 %2, i64 8, i1 false)
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %__oe.addr, align 8
  %4 = load i8*, i8** %__ob.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %3 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %4 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i64 %sub.ptr.sub, i64* %__sz, align 8
  %5 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %__iob.addr, align 8
  %call = call i64 @_ZNKSt3__18ios_base5widthEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %5)
  store i64 %call, i64* %__ns, align 8
  %6 = load i64, i64* %__ns, align 8
  %7 = load i64, i64* %__sz, align 8
  %cmp1 = icmp sgt i64 %6, %7
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %8 = load i64, i64* %__sz, align 8
  %9 = load i64, i64* %__ns, align 8
  %sub = sub nsw i64 %9, %8
  store i64 %sub, i64* %__ns, align 8
  br label %if.end3

if.else:                                          ; preds = %if.end
  store i64 0, i64* %__ns, align 8
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  %10 = load i8*, i8** %__op.addr, align 8
  %11 = load i8*, i8** %__ob.addr, align 8
  %sub.ptr.lhs.cast4 = ptrtoint i8* %10 to i64
  %sub.ptr.rhs.cast5 = ptrtoint i8* %11 to i64
  %sub.ptr.sub6 = sub i64 %sub.ptr.lhs.cast4, %sub.ptr.rhs.cast5
  store i64 %sub.ptr.sub6, i64* %__np, align 8
  %12 = load i64, i64* %__np, align 8
  %cmp7 = icmp sgt i64 %12, 0
  br i1 %cmp7, label %if.then8, label %if.end15

if.then8:                                         ; preds = %if.end3
  %__sbuf_9 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %__s, i32 0, i32 0
  %13 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %__sbuf_9, align 8
  %14 = load i8*, i8** %__ob.addr, align 8
  %15 = load i64, i64* %__np, align 8
  %call10 = call i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl(%"class.std::__1::basic_streambuf"* nonnull dereferenceable(64) %13, i8* %14, i64 %15)
  %16 = load i64, i64* %__np, align 8
  %cmp11 = icmp ne i64 %call10, %16
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.then8
  %__sbuf_13 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %__s, i32 0, i32 0
  store %"class.std::__1::basic_streambuf"* null, %"class.std::__1::basic_streambuf"** %__sbuf_13, align 8
  %17 = bitcast %"class.std::__1::ostreambuf_iterator"* %retval to i8*
  %18 = bitcast %"class.std::__1::ostreambuf_iterator"* %__s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %17, i8* align 8 %18, i64 8, i1 false)
  br label %return

if.end14:                                         ; preds = %if.then8
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end3
  %19 = load i64, i64* %__ns, align 8
  %cmp16 = icmp sgt i64 %19, 0
  br i1 %cmp16, label %if.then17, label %if.end28

if.then17:                                        ; preds = %if.end15
  %20 = load i64, i64* %__ns, align 8
  %21 = load i8, i8* %__fl.addr, align 1
  %call18 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %__sp, i64 %20, i8 signext %21)
  %__sbuf_19 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %__s, i32 0, i32 0
  %22 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %__sbuf_19, align 8
  %call20 = call i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %__sp) #11
  %23 = load i64, i64* %__ns, align 8
  %call21 = invoke i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl(%"class.std::__1::basic_streambuf"* nonnull dereferenceable(64) %22, i8* %call20, i64 %23)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then17
  %24 = load i64, i64* %__ns, align 8
  %cmp22 = icmp ne i64 %call21, %24
  br i1 %cmp22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %invoke.cont
  %__sbuf_24 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %__s, i32 0, i32 0
  store %"class.std::__1::basic_streambuf"* null, %"class.std::__1::basic_streambuf"** %__sbuf_24, align 8
  %25 = bitcast %"class.std::__1::ostreambuf_iterator"* %retval to i8*
  %26 = bitcast %"class.std::__1::ostreambuf_iterator"* %__s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %25, i8* align 8 %26, i64 8, i1 false)
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.then17
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  store i8* %28, i8** %exn.slot, align 8
  %29 = extractvalue { i8*, i32 } %27, 1
  store i32 %29, i32* %ehselector.slot, align 4
  %call27 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %__sp) #11
  br label %eh.resume

if.end25:                                         ; preds = %invoke.cont
  store i32 0, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end25, %if.then23
  %call26 = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %__sp) #11
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 4
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 1, label %return
  ]

cleanup.cont:                                     ; preds = %cleanup
  br label %if.end28

if.end28:                                         ; preds = %cleanup.cont, %if.end15
  %30 = load i8*, i8** %__oe.addr, align 8
  %31 = load i8*, i8** %__op.addr, align 8
  %sub.ptr.lhs.cast29 = ptrtoint i8* %30 to i64
  %sub.ptr.rhs.cast30 = ptrtoint i8* %31 to i64
  %sub.ptr.sub31 = sub i64 %sub.ptr.lhs.cast29, %sub.ptr.rhs.cast30
  store i64 %sub.ptr.sub31, i64* %__np, align 8
  %32 = load i64, i64* %__np, align 8
  %cmp32 = icmp sgt i64 %32, 0
  br i1 %cmp32, label %if.then33, label %if.end40

if.then33:                                        ; preds = %if.end28
  %__sbuf_34 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %__s, i32 0, i32 0
  %33 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %__sbuf_34, align 8
  %34 = load i8*, i8** %__op.addr, align 8
  %35 = load i64, i64* %__np, align 8
  %call35 = call i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl(%"class.std::__1::basic_streambuf"* nonnull dereferenceable(64) %33, i8* %34, i64 %35)
  %36 = load i64, i64* %__np, align 8
  %cmp36 = icmp ne i64 %call35, %36
  br i1 %cmp36, label %if.then37, label %if.end39

if.then37:                                        ; preds = %if.then33
  %__sbuf_38 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %__s, i32 0, i32 0
  store %"class.std::__1::basic_streambuf"* null, %"class.std::__1::basic_streambuf"** %__sbuf_38, align 8
  %37 = bitcast %"class.std::__1::ostreambuf_iterator"* %retval to i8*
  %38 = bitcast %"class.std::__1::ostreambuf_iterator"* %__s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %37, i8* align 8 %38, i64 8, i1 false)
  br label %return

if.end39:                                         ; preds = %if.then33
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end28
  %39 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %__iob.addr, align 8
  %call41 = call i64 @_ZNSt3__18ios_base5widthEl(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %39, i64 0)
  %40 = bitcast %"class.std::__1::ostreambuf_iterator"* %retval to i8*
  %41 = bitcast %"class.std::__1::ostreambuf_iterator"* %__s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %40, i8* align 8 %41, i64 8, i1 false)
  br label %return

return:                                           ; preds = %if.end40, %if.then37, %cleanup, %if.then12, %if.then
  %coerce.dive42 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %retval, i32 0, i32 0
  %42 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %coerce.dive42, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::basic_streambuf"* %42 to i64
  ret i64 %coerce.val.pi

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val43 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val43

unreachable:                                      ; preds = %cleanup
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %"class.std::__1::ostreambuf_iterator"* @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE(%"class.std::__1::ostreambuf_iterator"* nonnull returned dereferenceable(8) %this, %"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__s) unnamed_addr #8 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ostreambuf_iterator"*, align 8
  %__s.addr = alloca %"class.std::__1::basic_ostream"*, align 8
  store %"class.std::__1::ostreambuf_iterator"* %this, %"class.std::__1::ostreambuf_iterator"** %this.addr, align 8
  store %"class.std::__1::basic_ostream"* %__s, %"class.std::__1::basic_ostream"** %__s.addr, align 8
  %this1 = load %"class.std::__1::ostreambuf_iterator"*, %"class.std::__1::ostreambuf_iterator"** %this.addr, align 8
  %0 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__s.addr, align 8
  %call = call %"class.std::__1::ostreambuf_iterator"* @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2ERNS_13basic_ostreamIcS2_EE(%"class.std::__1::ostreambuf_iterator"* nonnull dereferenceable(8) %this1, %"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %0) #11
  ret %"class.std::__1::ostreambuf_iterator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i32 @_ZNKSt3__18ios_base5flagsEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__fmtflags_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 1
  %0 = load i32, i32* %__fmtflags_, align 8
  ret i32 %0
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %this) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_ios"*, align 8
  store %"class.std::__1::basic_ios"* %this, %"class.std::__1::basic_ios"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_ios"*, %"class.std::__1::basic_ios"** %this.addr, align 8
  %call = call i32 @_ZNSt3__111char_traitsIcE3eofEv() #11
  %__fill_ = getelementptr inbounds %"class.std::__1::basic_ios", %"class.std::__1::basic_ios"* %this1, i32 0, i32 2
  %0 = load i32, i32* %__fill_, align 8
  %call2 = call zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 %call, i32 %0) #11
  br i1 %call2, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call3 = call signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %this1, i8 signext 32)
  %conv = sext i8 %call3 to i32
  %__fill_4 = getelementptr inbounds %"class.std::__1::basic_ios", %"class.std::__1::basic_ios"* %this1, i32 0, i32 2
  store i32 %conv, i32* %__fill_4, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %__fill_5 = getelementptr inbounds %"class.std::__1::basic_ios", %"class.std::__1::basic_ios"* %this1, i32 0, i32 2
  %1 = load i32, i32* %__fill_5, align 8
  %conv6 = trunc i32 %1 to i8
  ret i8 %conv6
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv(%"class.std::__1::ostreambuf_iterator"* nonnull dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ostreambuf_iterator"*, align 8
  store %"class.std::__1::ostreambuf_iterator"* %this, %"class.std::__1::ostreambuf_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::ostreambuf_iterator"*, %"class.std::__1::ostreambuf_iterator"** %this.addr, align 8
  %__sbuf_ = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %__sbuf_, align 8
  %cmp = icmp eq %"class.std::__1::basic_streambuf"* %0, null
  ret i1 %cmp
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %this, i32 %__state) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_ios"*, align 8
  %__state.addr = alloca i32, align 4
  store %"class.std::__1::basic_ios"* %this, %"class.std::__1::basic_ios"** %this.addr, align 8
  store i32 %__state, i32* %__state.addr, align 4
  %this1 = load %"class.std::__1::basic_ios"*, %"class.std::__1::basic_ios"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_ios"* %this1 to %"class.std::__1::ios_base"*
  %1 = load i32, i32* %__state.addr, align 4
  call void @_ZNSt3__18ios_base8setstateEj(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %0, i32 %1)
  ret void
}

; Function Attrs: nounwind
declare %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(%"class.std::__1::basic_ostream<char>::sentry"* nonnull returned dereferenceable(16)) unnamed_addr #3

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136)) #1

declare void @__cxa_end_catch()

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) #10 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #11
  call void @_ZSt9terminatev() #13
  unreachable
}

declare void @_ZSt9terminatev()

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i64 @_ZNKSt3__18ios_base5widthEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__width_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 3
  %0 = load i64, i64* %__width_, align 8
  ret i64 %0
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl(%"class.std::__1::basic_streambuf"* nonnull dereferenceable(64) %this, i8* %__s, i64 %__n) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_streambuf"*, align 8
  %__s.addr = alloca i8*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::__1::basic_streambuf"* %this, %"class.std::__1::basic_streambuf"** %this.addr, align 8
  store i8* %__s, i8** %__s.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %this.addr, align 8
  %0 = load i8*, i8** %__s.addr, align 8
  %1 = load i64, i64* %__n.addr, align 8
  %2 = bitcast %"class.std::__1::basic_streambuf"* %this1 to i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)***
  %vtable = load i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)**, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*** %2, align 8
  %vfn = getelementptr inbounds i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)** %vtable, i64 12
  %3 = load i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)** %vfn, align 8
  %call = call i64 %3(%"class.std::__1::basic_streambuf"* nonnull dereferenceable(64) %this1, i8* %0, i64 %1)
  ret i64 %call
}

; Function Attrs: noinline optnone ssp uwtable
define internal %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc(%"class.std::__1::basic_string"* nonnull returned dereferenceable(24) %this, i64 %__n, i8 signext %__c) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__n.addr = alloca i64, align 8
  %__c.addr = alloca i8, align 1
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  store i8 %__c, i8* %__c.addr, align 1
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %0 = load i64, i64* %__n.addr, align 8
  %1 = load i8, i8* %__c.addr, align 1
  %call = call %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Emc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1, i64 %0, i8 signext %1)
  ret %"class.std::__1::basic_string"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i64 @_ZNSt3__18ios_base5widthEl(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %this, i64 %__wide) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  %__wide.addr = alloca i64, align 8
  %__r = alloca i64, align 8
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  store i64 %__wide, i64* %__wide.addr, align 8
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__width_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 3
  %0 = load i64, i64* %__width_, align 8
  store i64 %0, i64* %__r, align 8
  %1 = load i64, i64* %__wide.addr, align 8
  %__width_2 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 3
  store i64 %1, i64* %__width_2, align 8
  %2 = load i64, i64* %__r, align 8
  ret i64 %2
}

; Function Attrs: noinline optnone ssp uwtable
define internal %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Emc(%"class.std::__1::basic_string"* nonnull returned dereferenceable(24) %this, i64 %__n, i8 signext %__c) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__n.addr = alloca i64, align 8
  %__c.addr = alloca i8, align 1
  %ref.tmp = alloca %"struct.std::__1::__default_init_tag", align 1
  %ref.tmp2 = alloca %"struct.std::__1::__default_init_tag", align 1
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  store i8 %__c, i8* %__c.addr, align 1
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_string"* %this1 to %"class.std::__1::__basic_string_common"*
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %__r_, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %ref.tmp, %"struct.std::__1::__default_init_tag"* nonnull align 1 dereferenceable(1) %ref.tmp2)
  %1 = load i64, i64* %__n.addr, align 8
  %2 = load i8, i8* %__c.addr, align 1
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1, i64 %1, i8 signext %2)
  ret %"class.std::__1::basic_string"* %this1
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(%"class.std::__1::basic_string"* nonnull dereferenceable(24), i64, i8 signext) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %"class.std::__1::ostreambuf_iterator"* @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2ERNS_13basic_ostreamIcS2_EE(%"class.std::__1::ostreambuf_iterator"* nonnull returned dereferenceable(8) %this, %"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__s) unnamed_addr #8 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::__1::ostreambuf_iterator"*, align 8
  %__s.addr = alloca %"class.std::__1::basic_ostream"*, align 8
  store %"class.std::__1::ostreambuf_iterator"* %this, %"class.std::__1::ostreambuf_iterator"** %this.addr, align 8
  store %"class.std::__1::basic_ostream"* %__s, %"class.std::__1::basic_ostream"** %__s.addr, align 8
  %this1 = load %"class.std::__1::ostreambuf_iterator"*, %"class.std::__1::ostreambuf_iterator"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::ostreambuf_iterator"* %this1 to %"struct.std::__1::iterator"*
  %__sbuf_ = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", %"class.std::__1::ostreambuf_iterator"* %this1, i32 0, i32 0
  %1 = load %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %__s.addr, align 8
  %2 = bitcast %"class.std::__1::basic_ostream"* %1 to i8**
  %vtable = load i8*, i8** %2, align 8
  %vbase.offset.ptr = getelementptr i8, i8* %vtable, i64 -24
  %3 = bitcast i8* %vbase.offset.ptr to i64*
  %vbase.offset = load i64, i64* %3, align 8
  %4 = bitcast %"class.std::__1::basic_ostream"* %1 to i8*
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %vbase.offset
  %5 = bitcast i8* %add.ptr to %"class.std::__1::basic_ios"*
  %call = invoke %"class.std::__1::basic_streambuf"* @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %5)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  store %"class.std::__1::basic_streambuf"* %call, %"class.std::__1::basic_streambuf"** %__sbuf_, align 8
  ret %"class.std::__1::ostreambuf_iterator"* %this1

terminate.lpad:                                   ; preds = %entry
  %6 = landingpad { i8*, i32 }
          catch i8* null
  %7 = extractvalue { i8*, i32 } %6, 0
  call void @__clang_call_terminate(i8* %7) #13
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal %"class.std::__1::basic_streambuf"* @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %this) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_ios"*, align 8
  store %"class.std::__1::basic_ios"* %this, %"class.std::__1::basic_ios"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_ios"*, %"class.std::__1::basic_ios"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_ios"* %this1 to %"class.std::__1::ios_base"*
  %call = call i8* @_ZNKSt3__18ios_base5rdbufEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %0)
  %1 = bitcast i8* %call to %"class.std::__1::basic_streambuf"*
  ret %"class.std::__1::basic_streambuf"* %1
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i8* @_ZNKSt3__18ios_base5rdbufEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__rdbuf_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 6
  %0 = load i8*, i8** %__rdbuf_, align 8
  ret i8* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define linkonce_odr zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 %__c1, i32 %__c2) #2 align 2 {
entry:
  %__c1.addr = alloca i32, align 4
  %__c2.addr = alloca i32, align 4
  store i32 %__c1, i32* %__c1.addr, align 4
  store i32 %__c2, i32* %__c2.addr, align 4
  %0 = load i32, i32* %__c1.addr, align 4
  %1 = load i32, i32* %__c2.addr, align 4
  %cmp = icmp eq i32 %0, %1
  ret i1 %cmp
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define linkonce_odr i32 @_ZNSt3__111char_traitsIcE3eofEv() #2 align 2 {
entry:
  ret i32 -1
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc(%"class.std::__1::basic_ios"* nonnull dereferenceable(148) %this, i8 signext %__c) #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::__1::basic_ios"*, align 8
  %__c.addr = alloca i8, align 1
  %ref.tmp = alloca %"class.std::__1::locale", align 8
  %exn.slot = alloca i8*, align 8
  %ehselector.slot = alloca i32, align 4
  store %"class.std::__1::basic_ios"* %this, %"class.std::__1::basic_ios"** %this.addr, align 8
  store i8 %__c, i8* %__c.addr, align 1
  %this1 = load %"class.std::__1::basic_ios"*, %"class.std::__1::basic_ios"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_ios"* %this1 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* sret(%"class.std::__1::locale") align 8 %ref.tmp, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %0)
  %call = invoke nonnull align 8 dereferenceable(25) %"class.std::__1::ctype"* @_ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE(%"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %1 = load i8, i8* %__c.addr, align 1
  %call3 = invoke signext i8 @_ZNKSt3__15ctypeIcE5widenEc(%"class.std::__1::ctype"* nonnull dereferenceable(25) %call, i8 signext %1)
          to label %invoke.cont2 unwind label %lpad

invoke.cont2:                                     ; preds = %invoke.cont
  %call4 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp) #11
  ret i8 %call3

lpad:                                             ; preds = %invoke.cont, %entry
  %2 = landingpad { i8*, i32 }
          cleanup
  %3 = extractvalue { i8*, i32 } %2, 0
  store i8* %3, i8** %exn.slot, align 8
  %4 = extractvalue { i8*, i32 } %2, 1
  store i32 %4, i32* %ehselector.slot, align 4
  %call5 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp) #11
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val6 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val6
}

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal nonnull align 8 dereferenceable(25) %"class.std::__1::ctype"* @_ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE(%"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %__l) #0 {
entry:
  %__l.addr = alloca %"class.std::__1::locale"*, align 8
  store %"class.std::__1::locale"* %__l, %"class.std::__1::locale"** %__l.addr, align 8
  %0 = load %"class.std::__1::locale"*, %"class.std::__1::locale"** %__l.addr, align 8
  %call = call %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %0, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
  %1 = bitcast %"class.std::__1::locale::facet"* %call to %"class.std::__1::ctype"*
  ret %"class.std::__1::ctype"* %1
}

declare void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* sret(%"class.std::__1::locale") align 8, %"class.std::__1::ios_base"* nonnull dereferenceable(136)) #1

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal signext i8 @_ZNKSt3__15ctypeIcE5widenEc(%"class.std::__1::ctype"* nonnull dereferenceable(25) %this, i8 signext %__c) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ctype"*, align 8
  %__c.addr = alloca i8, align 1
  store %"class.std::__1::ctype"* %this, %"class.std::__1::ctype"** %this.addr, align 8
  store i8 %__c, i8* %__c.addr, align 1
  %this1 = load %"class.std::__1::ctype"*, %"class.std::__1::ctype"** %this.addr, align 8
  %0 = load i8, i8* %__c.addr, align 1
  %1 = bitcast %"class.std::__1::ctype"* %this1 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %1, align 8
  %vfn = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable, i64 7
  %2 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn, align 8
  %call = call signext i8 %2(%"class.std::__1::ctype"* nonnull dereferenceable(25) %this1, i8 signext %0)
  ret i8 %call
}

; Function Attrs: nounwind
declare %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull returned dereferenceable(8)) unnamed_addr #3

declare %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8), %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12)) #1

; Function Attrs: noinline optnone ssp uwtable mustprogress
define internal void @_ZNSt3__18ios_base8setstateEj(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %this, i32 %__state) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  %__state.addr = alloca i32, align 4
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  store i32 %__state, i32* %__state.addr, align 4
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__rdstate_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 4
  %0 = load i32, i32* %__rdstate_, align 8
  %1 = load i32, i32* %__state.addr, align 4
  %or = or i32 %0, %1
  call void @_ZNSt3__18ios_base5clearEj(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %this1, i32 %or)
  ret void
}

declare void @_ZNSt3__18ios_base5clearEj(%"class.std::__1::ios_base"* nonnull dereferenceable(136), i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i8* @_ZNSt3__1L12__to_addressIKcEEPT_S3_(i8* %__p) #2 {
entry:
  %__p.addr = alloca i8*, align 8
  store i8* %__p, i8** %__p.addr, align 8
  %0 = load i8*, i8** %__p.addr, align 8
  ret i8* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %call = call zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1) #11
  br i1 %call, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call2 = call i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1) #11
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call3 = call i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this1) #11
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call2, %cond.true ], [ %call3, %cond.false ]
  ret i8* %cond
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %__r_) #11
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__s = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__short"*
  %1 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s, i32 0, i32 1
  %__size_ = getelementptr inbounds %struct.anon, %struct.anon* %1, i32 0, i32 0
  %2 = load i8, i8* %__size_, align 1
  %conv = zext i8 %2 to i64
  %and = and i64 %conv, 128
  %tobool = icmp ne i64 %and, 0
  ret i1 %tobool
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %__r_) #11
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__l = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__long"*
  %__data_ = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", %"struct.std::__1::basic_string<char>::__long"* %__l, i32 0, i32 0
  %1 = load i8*, i8** %__data_, align 8
  ret i8* %1
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %__r_) #11
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__s = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__short"*
  %__data_ = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s, i32 0, i32 0
  %arrayidx = getelementptr inbounds [23 x i8], [23 x i8]* %__data_, i64 0, i64 0
  %call2 = call i8* @_ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_(i8* nonnull align 1 dereferenceable(1) %arrayidx) #11
  ret i8* %call2
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem"*
  %call = call nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* nonnull dereferenceable(24) %0) #11
  ret %"struct.std::__1::basic_string<char>::__rep"* %call
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  store %"struct.std::__1::__compressed_pair_elem"* %this, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %this1, i32 0, i32 0
  ret %"struct.std::__1::basic_string<char>::__rep"* %__value_
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i8* @_ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_(i8* nonnull align 1 dereferenceable(1) %__r) #2 align 2 {
entry:
  %__r.addr = alloca i8*, align 8
  store i8* %__r, i8** %__r.addr, align 8
  %0 = load i8*, i8** %__r.addr, align 8
  %call = call i8* @_ZNSt3__1L9addressofIKcEEPT_RS2_(i8* nonnull align 1 dereferenceable(1) %0) #11
  ret i8* %call
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i8* @_ZNSt3__1L9addressofIKcEEPT_RS2_(i8* nonnull align 1 dereferenceable(1) %__x) #2 {
entry:
  %__x.addr = alloca i8*, align 8
  store i8* %__x, i8** %__x.addr, align 8
  %0 = load i8*, i8** %__x.addr, align 8
  ret i8* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %__r_) #11
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__l = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__long"*
  %__size_ = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", %"struct.std::__1::basic_string<char>::__long"* %__l, i32 0, i32 1
  %1 = load i64, i64* %__size_, align 8
  ret i64 %1
}

; Function Attrs: noinline nounwind optnone ssp uwtable mustprogress
define internal i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeEv(%"class.std::__1::basic_string"* nonnull dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* nonnull dereferenceable(24) %__r_) #11
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__s = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__short"*
  %1 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s, i32 0, i32 1
  %__size_ = getelementptr inbounds %struct.anon, %struct.anon* %1, i32 0, i32 0
  %2 = load i8, i8* %__size_, align 1
  %conv = zext i8 %2 to i64
  ret i64 %conv
}

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8), i8 signext) #1

attributes #0 = { noinline optnone ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind optnone ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse optnone ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nobuiltin allocsize(0) "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly nofree nosync nounwind willreturn }
attributes #10 = { noinline noreturn nounwind }
attributes #11 = { nounwind }
attributes #12 = { builtin allocsize(0) }
attributes #13 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"branch-target-enforcement", i32 0}
!2 = !{i32 1, !"sign-return-address", i32 0}
!3 = !{i32 1, !"sign-return-address-all", i32 0}
!4 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{!"clang version 12.0.0 (https://github.com/AnyDSL/anydsl d7986ff5c2cc0981c888ada881a18b67c0ca67c9)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
