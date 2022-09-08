; ModuleID = 'product.ll'
source_filename = "product.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

%"class.std::__1::basic_ostream" = type { i32 (...)**, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32 }>
%"class.std::__1::ios_base" = type { i32 (...)**, i32, i64, i64, i32, i32, i8*, i8*, void (i32, %"class.std::__1::ios_base"*, i32)**, i32*, i64, i64, i64*, i64, i64, i8**, i64, i64 }

@enzyme_dup = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_dupnoneed = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_out = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_const = dso_local local_unnamed_addr global i32 0, align 4
@_ZL10start_time = internal unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream", align 8

; Function Attrs: ssp uwtable mustprogress
define dso_local double @_Z12randomDoubledd(double %fMin, double %fMax) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @rand()
  %conv = sitofp i32 %call to double
  %div = fdiv double %conv, 0x41DFFFFFFFC00000
  %sub = fsub double %fMax, %fMin
  %mul = fmul double %sub, %div
  %add = fadd double %mul, %fMin
  ret double %add
}

declare i32 @rand() local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind ssp uwtable mustprogress
define dso_local void @_Z7productPdS_S_i(double* nocapture readonly %x, double* nocapture readonly %y, double* nocapture %z, i32 %size) #2 {
entry:
  %mul = mul i32 %size, %size
  %cmp12.not = icmp eq i32 %mul, 0
  br i1 %cmp12.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %mul to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %0 = load double, double* %arrayidx, align 8, !tbaa !7
  %arrayidx2 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %1 = load double, double* %arrayidx2, align 8, !tbaa !7
  %mul3 = fmul double %0, %1
  %arrayidx5 = getelementptr inbounds double, double* %z, i64 %indvars.iv
  %2 = load double, double* %arrayidx5, align 8, !tbaa !7
  %add = fadd double %2, %mul3
  store double %add, double* %arrayidx5, align 8, !tbaa !7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !11
}

; Function Attrs: ssp uwtable mustprogress
define dso_local void @_Z9product_dPKdS0_S0_S0_S0_S0_i(double* %x, double* %x_d, double* %y, double* %y_d, double* %z, double* %z_d, i32 %size) local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @enzyme_dup, align 4, !tbaa !14
  %1 = load i32, i32* @enzyme_const, align 4, !tbaa !14
  call void @diffe_Z7productPdS_S_i(double* %x, double* %x_d, double* %y, double* %y_d, double* %z, double* %z_d, i32 %size)
  ret void
}

declare double @_Z17__enzyme_autodiffPvz(i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind ssp uwtable
define dso_local i64 @_Z22timeSinceEpochMillisecv() local_unnamed_addr #3 {
entry:
  %call = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #10
  %div.i.i = sdiv i64 %call, 1000
  ret i64 %div.i.i
}

; Function Attrs: nounwind
declare i64 @_ZNSt3__16chrono12system_clock3nowEv() local_unnamed_addr #4

; Function Attrs: nounwind ssp uwtable
define dso_local void @_Z5startv() local_unnamed_addr #3 {
entry:
  %call.i = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #10
  %div.i.i.i = sdiv i64 %call.i, 1000
  %conv = trunc i64 %div.i.i.i to i32
  store i32 %conv, i32* @_ZL10start_time, align 4, !tbaa !14
  ret void
}

; Function Attrs: ssp uwtable
define dso_local void @_Z3endv() local_unnamed_addr #5 {
entry:
  %call.i = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #10
  %div.i.i.i = sdiv i64 %call.i, 1000
  %conv = trunc i64 %div.i.i.i to i32
  %0 = load i32, i32* @_ZL10start_time, align 4, !tbaa !14
  %sub = sub nsw i32 %conv, %0
  %call1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %sub)
  %call.i4 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #6

; Function Attrs: norecurse ssp uwtable mustprogress
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #7 {
entry:
  %call = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #11
  %0 = bitcast i8* %call to double*
  %call3 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #11
  %1 = bitcast i8* %call3 to double*
  %call6 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #11
  %2 = bitcast i8* %call6 to double*
  %call9 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #11
  %3 = bitcast i8* %call9 to double*
  %call12 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #11
  %4 = bitcast i8* %call12 to double*
  %call15 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #11
  %5 = bitcast i8* %call15 to double*
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  store double 1.000000e+00, double* %5, align 8, !tbaa !7
  %6 = load i32, i32* @enzyme_dup, align 4, !tbaa !14
  %7 = load i32, i32* @enzyme_const, align 4, !tbaa !14
  %8 = bitcast i8* %call to double*
  %9 = bitcast i8* %call9 to double*
  %10 = bitcast i8* %call3 to double*
  %11 = bitcast i8* %call12 to double*
  %12 = bitcast i8* %call6 to double*
  %13 = bitcast i8* %call15 to double*
  call void @diffe_Z7productPdS_S_i(double* %8, double* %9, double* %10, double* %11, double* %12, double* %13, i32 2)
  br label %for.body31

for.body:                                         ; preds = %for.body, %entry
  %i.0131 = phi i64 [ 0, %entry ], [ %inc, %for.body ]
  %call.i119 = tail call i32 @rand()
  %conv.i = sitofp i32 %call.i119 to double
  %div.i = fdiv double %conv.i, 0x41DFFFFFFFC00000
  %mul.i = fmul double %div.i, 2.000000e-01
  %add.i = fadd double %mul.i, -1.000000e-01
  %arrayidx = getelementptr inbounds double, double* %0, i64 %i.0131
  store double %add.i, double* %arrayidx, align 8, !tbaa !7
  %call.i120 = tail call i32 @rand()
  %conv.i121 = sitofp i32 %call.i120 to double
  %div.i122 = fdiv double %conv.i121, 0x41DFFFFFFFC00000
  %mul.i123 = fmul double %div.i122, 2.000000e-01
  %add.i124 = fadd double %mul.i123, -1.000000e-01
  %arrayidx20 = getelementptr inbounds double, double* %1, i64 %i.0131
  store double %add.i124, double* %arrayidx20, align 8, !tbaa !7
  %arrayidx21 = getelementptr inbounds double, double* %2, i64 %i.0131
  store double 0.000000e+00, double* %arrayidx21, align 8, !tbaa !7
  %arrayidx22 = getelementptr inbounds double, double* %3, i64 %i.0131
  store double 0.000000e+00, double* %arrayidx22, align 8, !tbaa !7
  %arrayidx23 = getelementptr inbounds double, double* %4, i64 %i.0131
  store double 0.000000e+00, double* %arrayidx23, align 8, !tbaa !7
  %arrayidx24 = getelementptr inbounds double, double* %5, i64 %i.0131
  store double 0.000000e+00, double* %arrayidx24, align 8, !tbaa !7
  %inc = add nuw nsw i64 %i.0131, 1
  %exitcond138.not = icmp eq i64 %inc, 4
  br i1 %exitcond138.not, label %for.cond.cleanup, label %for.body, !llvm.loop !16

for.body31:                                       ; preds = %for.body31, %for.cond.cleanup
  %indvars.iv135 = phi i64 [ 0, %for.cond.cleanup ], [ %indvars.iv.next136, %for.body31 ]
  %result.0129 = phi double [ 0.000000e+00, %for.cond.cleanup ], [ %add, %for.body31 ]
  %arrayidx32 = getelementptr inbounds double, double* %2, i64 %indvars.iv135
  %14 = load double, double* %arrayidx32, align 8, !tbaa !7
  %add = fadd double %result.0129, %14
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond137.not = icmp eq i64 %indvars.iv.next136, 4
  br i1 %exitcond137.not, label %for.body41, label %for.body31, !llvm.loop !17

for.body41:                                       ; preds = %for.body41, %for.body31
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.body41 ], [ 0, %for.body31 ]
  %result.1127 = phi double [ %add44, %for.body41 ], [ %add, %for.body31 ]
  %arrayidx43 = getelementptr inbounds double, double* %3, i64 %indvars.iv132
  %15 = load double, double* %arrayidx43, align 8, !tbaa !7
  %add44 = fadd double %result.1127, %15
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond134.not = icmp eq i64 %indvars.iv.next133, 4
  br i1 %exitcond134.not, label %for.body53, label %for.body41, !llvm.loop !18

for.cond.cleanup52:                               ; preds = %for.body53
  %conv60 = fptosi double %add56 to i32
  ret i32 %conv60

for.body53:                                       ; preds = %for.body53, %for.body41
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body53 ], [ 0, %for.body41 ]
  %result.2125 = phi double [ %add56, %for.body53 ], [ %add44, %for.body41 ]
  %arrayidx55 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %16 = load double, double* %arrayidx55, align 8, !tbaa !7
  %add56 = fadd double %result.2125, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 4
  br i1 %exitcond.not, label %for.cond.cleanup52, label %for.body53, !llvm.loop !19
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare nonnull i8* @_Znam(i64) local_unnamed_addr #8

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8)) local_unnamed_addr #1
;_Z7productPdS_S_i
; Function Attrs: nofree norecurse nounwind ssp uwtable willreturn mustprogress
define internal void @diffe_Z7productPdS_S_i(double* nocapture readonly %x, double* nocapture %"x'", double* nocapture readonly %y, double* nocapture %"y'", double* nocapture %z, double* nocapture %"z'", i32 %size) #9 {
entry:
  %"iv'ac" = alloca i64, align 8
  %"add'de" = alloca double, align 8
  store double 0.000000e+00, double* %"add'de", align 8
  %"'de" = alloca double, align 8
  store double 0.000000e+00, double* %"'de", align 8
  %"mul3'de" = alloca double, align 8
  store double 0.000000e+00, double* %"mul3'de", align 8
  %_cache = alloca double*, align 8
  %_cache3 = alloca double*, align 8
  %"'de8" = alloca double, align 8
  store double 0.000000e+00, double* %"'de8", align 8
  %"'de9" = alloca double, align 8
  store double 0.000000e+00, double* %"'de9", align 8
  %mul = mul i32 %size, %size
  %cmp12.not = icmp eq i32 %mul, 0
  br i1 %cmp12.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %mul to i64
  %0 = add nsw i64 %wide.trip.count, -1
  %1 = add nuw nsw i64 %0, 1
  %2 = add nuw i64 %0, 1
  %mallocsize = mul nuw nsw i64 %2, 8
  %malloccall = tail call noalias nonnull i8* @malloc(i64 %mallocsize)
  %_malloccache = bitcast i8* %malloccall to double*
  store double* %_malloccache, double** %_cache, align 8, !invariant.group !20
  %3 = add nuw nsw i64 %0, 1
  %mallocsize4 = mul nuw nsw i64 %2, 8
  %malloccall5 = tail call noalias nonnull i8* @malloc(i64 %mallocsize4)
  %_malloccache6 = bitcast i8* %malloccall5 to double*
  store double* %_malloccache6, double** %_cache3, align 8, !invariant.group !21
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  br label %invertfor.cond.cleanup

for.body:                                         ; preds = %for.body, %for.body.preheader
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %for.body.preheader ]
  %iv.next = add nuw nsw i64 %iv, 1
  %"arrayidx'ipg" = getelementptr inbounds double, double* %"x'", i64 %iv
  %arrayidx = getelementptr inbounds double, double* %x, i64 %iv
  %4 = load double, double* %arrayidx, align 8, !tbaa !7
  %"arrayidx2'ipg" = getelementptr inbounds double, double* %"y'", i64 %iv
  %arrayidx2 = getelementptr inbounds double, double* %y, i64 %iv
  %5 = load double, double* %arrayidx2, align 8, !tbaa !7
  %mul3 = fmul double %4, %5
  %"arrayidx5'ipg" = getelementptr inbounds double, double* %"z'", i64 %iv
  %arrayidx5 = getelementptr inbounds double, double* %z, i64 %iv
  %6 = load double, double* %arrayidx5, align 8, !tbaa !7
  %add = fadd double %6, %mul3
  store double %add, double* %arrayidx5, align 8, !tbaa !7
  %7 = load double*, double** %_cache3, align 8, !dereferenceable !22, !invariant.group !21
  %8 = getelementptr inbounds double, double* %7, i64 %iv
  store double %4, double* %8, align 8, !tbaa !7, !invariant.group !23
  %9 = load double*, double** %_cache, align 8, !dereferenceable !22, !invariant.group !20
  %10 = getelementptr inbounds double, double* %9, i64 %iv
  store double %5, double* %10, align 8, !tbaa !7, !invariant.group !24
  %exitcond.not = icmp eq i64 %iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup.loopexit, label %for.body, !llvm.loop !11

invertentry:                                      ; preds = %invertfor.cond.cleanup, %invertfor.body.preheader
  ret void

invertfor.body.preheader:                         ; preds = %invertfor.body
  %11 = load i64, i64* %"iv'ac", align 8
  %forfree = load double*, double** %_cache, align 8, !dereferenceable !22, !invariant.group !20
  %12 = bitcast double* %forfree to i8*
  tail call void @free(i8* nonnull %12)
  %13 = load i64, i64* %"iv'ac", align 8
  %forfree7 = load double*, double** %_cache3, align 8, !dereferenceable !22, !invariant.group !21
  %14 = bitcast double* %forfree7 to i8*
  tail call void @free(i8* nonnull %14)
  br label %invertentry

invertfor.cond.cleanup.loopexit:                  ; preds = %invertfor.cond.cleanup
  %wide.trip.count_unwrap = zext i32 %mul to i64
  %_unwrap = add nsw i64 %wide.trip.count_unwrap, -1
  br label %mergeinvertfor.body_for.cond.cleanup.loopexit

mergeinvertfor.body_for.cond.cleanup.loopexit:    ; preds = %invertfor.cond.cleanup.loopexit
  store i64 %_unwrap, i64* %"iv'ac", align 8
  br label %invertfor.body

invertfor.cond.cleanup:                           ; preds = %for.cond.cleanup
  br i1 %cmp12.not, label %invertentry, label %invertfor.cond.cleanup.loopexit

invertfor.body:                                   ; preds = %incinvertfor.body, %mergeinvertfor.body_for.cond.cleanup.loopexit
  %15 = load i64, i64* %"iv'ac", align 8
  %"arrayidx5'ipg_unwrap" = getelementptr inbounds double, double* %"z'", i64 %15
  %16 = load double, double* %"arrayidx5'ipg_unwrap", align 8
  store double 0.000000e+00, double* %"arrayidx5'ipg_unwrap", align 8
  %17 = load double, double* %"add'de", align 8
  %18 = fadd fast double %17, %16
  store double %18, double* %"add'de", align 8
  %19 = load double, double* %"add'de", align 8
  store double 0.000000e+00, double* %"add'de", align 8
  %20 = load double, double* %"'de", align 8
  %21 = fadd fast double %20, %19
  store double %21, double* %"'de", align 8
  %22 = load double, double* %"mul3'de", align 8
  %23 = fadd fast double %22, %19
  store double %23, double* %"mul3'de", align 8
  %24 = load double, double* %"'de", align 8
  store double 0.000000e+00, double* %"'de", align 8
  %25 = load double, double* %"arrayidx5'ipg_unwrap", align 8
  %26 = fadd fast double %25, %24
  store double %26, double* %"arrayidx5'ipg_unwrap", align 8
  %27 = load double, double* %"mul3'de", align 8
  %28 = load i64, i64* %"iv'ac", align 8
  %mul_unwrap = mul i32 %size, %size
  %wide.trip.count_unwrap1 = zext i32 %mul_unwrap to i64
  %_unwrap2 = add nsw i64 %wide.trip.count_unwrap1, -1
  %29 = add nuw i64 %_unwrap2, 1
  %30 = load double*, double** %_cache, align 8, !dereferenceable !22, !invariant.group !20
  %31 = getelementptr inbounds double, double* %30, i64 %28
  %32 = load double, double* %31, align 8, !tbaa !7, !invariant.group !24
  %m0diffe = fmul fast double %27, %32
  %33 = load i64, i64* %"iv'ac", align 8
  %34 = add nuw i64 %_unwrap2, 1
  %35 = load double*, double** %_cache3, align 8, !dereferenceable !22, !invariant.group !21
  %36 = getelementptr inbounds double, double* %35, i64 %33
  %37 = load double, double* %36, align 8, !tbaa !7, !invariant.group !23
  %m1diffe = fmul fast double %27, %37
  store double 0.000000e+00, double* %"mul3'de", align 8
  %38 = load double, double* %"'de8", align 8
  %39 = fadd fast double %38, %m0diffe
  store double %39, double* %"'de8", align 8
  %40 = load double, double* %"'de9", align 8
  %41 = fadd fast double %40, %m1diffe
  store double %41, double* %"'de9", align 8
  %42 = load double, double* %"'de9", align 8
  store double 0.000000e+00, double* %"'de9", align 8
  %43 = load i64, i64* %"iv'ac", align 8
  %"arrayidx2'ipg_unwrap" = getelementptr inbounds double, double* %"y'", i64 %43
  %44 = load double, double* %"arrayidx2'ipg_unwrap", align 8
  %45 = fadd fast double %44, %42
  store double %45, double* %"arrayidx2'ipg_unwrap", align 8
  %46 = load double, double* %"'de8", align 8
  store double 0.000000e+00, double* %"'de8", align 8
  %47 = load i64, i64* %"iv'ac", align 8
  %"arrayidx'ipg_unwrap" = getelementptr inbounds double, double* %"x'", i64 %47
  %48 = load double, double* %"arrayidx'ipg_unwrap", align 8
  %49 = fadd fast double %48, %46
  store double %49, double* %"arrayidx'ipg_unwrap", align 8
  %50 = load i64, i64* %"iv'ac", align 8
  %51 = icmp eq i64 %50, 0
  %52 = xor i1 %51, true
  br i1 %51, label %invertfor.body.preheader, label %incinvertfor.body

incinvertfor.body:                                ; preds = %invertfor.body
  %53 = load i64, i64* %"iv'ac", align 8
  %54 = add nsw i64 %53, -1
  store i64 %54, i64* %"iv'ac", align 8
  br label %invertfor.body
}

declare noalias i8* @malloc(i64)

declare void @free(i8*)

attributes #0 = { ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree norecurse nounwind ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nofree allocsize(0) "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree norecurse nounwind ssp uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind }
attributes #11 = { builtin allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"branch-target-enforcement", i32 0}
!2 = !{i32 1, !"sign-return-address", i32 0}
!3 = !{i32 1, !"sign-return-address-all", i32 0}
!4 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{!"clang version 12.0.0 (https://github.com/AnyDSL/anydsl d7986ff5c2cc0981c888ada881a18b67c0ca67c9)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !9, i64 0}
!16 = distinct !{!16, !12, !13}
!17 = distinct !{!17, !12, !13}
!18 = distinct !{!18, !12, !13}
!19 = distinct !{!19, !12, !13}
!20 = distinct !{}
!21 = distinct !{}
!22 = !{i64 8}
!23 = distinct !{}
!24 = distinct !{}
