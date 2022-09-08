; ModuleID = 'product.ll'
source_filename = "product.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

%"class.std::__1::basic_ostream" = type { i32 (...)**, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32 }>
%"class.std::__1::ios_base" = type { i32 (...)**, i32, i64, i64, i32, i32, i8*, i8*, void (i32, %"class.std::__1::ios_base"*, i32)**, i32*, i64, i64, i64*, i64, i64, i8**, i64, i64 }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%"class.std::__1::locale" = type { %"class.std::__1::locale::__imp"* }
%"class.std::__1::locale::__imp" = type opaque
%"class.std::__1::locale::facet" = type { %"class.std::__1::__shared_count" }
%"class.std::__1::__shared_count" = type { i32 (...)**, i64 }
%"class.std::__1::ctype" = type <{ %"class.std::__1::locale::facet", i32*, i8, [7 x i8] }>

@enzyme_dup = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_dupnoneed = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_out = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_const = dso_local local_unnamed_addr global i32 0, align 4
@_ZL10start_time = internal unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream", align 8
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8

; Function Attrs: nofree norecurse nounwind ssp uwtable mustprogress
define dso_local void @_Z7productPdS_S_i(double* nocapture readonly %x, double* nocapture readonly %y, double* nocapture %z, i32 %size) #0 {
entry:
  %cmp68 = icmp sgt i32 %size, 0
  br i1 %cmp68, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %size to i64
  %1 = shl nuw nsw i64 %0, 3
  %2 = zext i32 %size to i64
  br label %for.cond10.preheader.lr.ph

for.cond.cleanup:                                 ; preds = %for.cond.cleanup7, %entry
  ret void

for.cond10.preheader.lr.ph:                       ; preds = %for.cond.cleanup7, %for.cond1.preheader.lr.ph
  %indvars.iv82 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next83, %for.cond.cleanup7 ]
  %3 = trunc i64 %indvars.iv82 to i32
  %4 = mul i32 %3, %size
  %5 = sext i32 %4 to i64
  %scevgep = getelementptr double, double* %z, i64 %5
  %scevgep72 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %scevgep72, i8 0, i64 %1, i1 false)
  %6 = mul nsw i64 %indvars.iv82, %2
  br label %for.body13.lr.ph

for.body13.lr.ph:                                 ; preds = %for.cond.cleanup12, %for.cond10.preheader.lr.ph
  %indvars.iv76 = phi i64 [ 0, %for.cond10.preheader.lr.ph ], [ %indvars.iv.next77, %for.cond.cleanup12 ]
  %7 = add nuw nsw i64 %indvars.iv76, %6
  %arrayidx17 = getelementptr inbounds double, double* %x, i64 %7
  %8 = mul nsw i64 %indvars.iv76, %2
  br label %for.body13

for.cond.cleanup7:                                ; preds = %for.cond.cleanup12
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond86.not = icmp eq i64 %indvars.iv.next83, %0
  br i1 %exitcond86.not, label %for.cond.cleanup, label %for.cond10.preheader.lr.ph, !llvm.loop !7

for.cond.cleanup12:                               ; preds = %for.body13
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond81.not = icmp eq i64 %indvars.iv.next77, %0
  br i1 %exitcond81.not, label %for.cond.cleanup7, label %for.body13.lr.ph, !llvm.loop !10

for.body13:                                       ; preds = %for.body13, %for.body13.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body13.lr.ph ], [ %indvars.iv.next, %for.body13 ]
  %9 = load double, double* %arrayidx17, align 8, !tbaa !11
  %10 = add nuw nsw i64 %indvars.iv, %8
  %arrayidx21 = getelementptr inbounds double, double* %y, i64 %10
  %11 = load double, double* %arrayidx21, align 8, !tbaa !11
  %mul22 = fmul double %9, %11
  %12 = add nuw nsw i64 %indvars.iv, %6
  %arrayidx26 = getelementptr inbounds double, double* %z, i64 %12
  %13 = load double, double* %arrayidx26, align 8, !tbaa !11
  %add27 = fadd double %13, %mul22
  store double %add27, double* %arrayidx26, align 8, !tbaa !11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %0
  br i1 %exitcond.not, label %for.cond.cleanup12, label %for.body13, !llvm.loop !15
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: ssp uwtable mustprogress
define dso_local void @_Z9product_dPKdS0_S0_S0_S0_S0_i(double* %x, double* %x_d, double* %y, double* %y_d, double* %z, double* %z_d, i32 %size) local_unnamed_addr #2 {
entry:
  %0 = load i32, i32* @enzyme_dup, align 4, !tbaa !16
  %1 = load i32, i32* @enzyme_const, align 4, !tbaa !16
  call void @diffe_Z7productPdS_S_i(double* %x, double* %x_d, double* %y, double* %y_d, double* %z, double* %z_d, i32 %size)
  ret void
}

declare double @_Z17__enzyme_autodiffPvz(i8*, ...) local_unnamed_addr #3

; Function Attrs: nounwind ssp uwtable
define dso_local i64 @_Z22timeSinceEpochMillisecv() local_unnamed_addr #4 {
entry:
  %call = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #12
  %div.i.i = sdiv i64 %call, 1000
  ret i64 %div.i.i
}

; Function Attrs: nounwind
declare i64 @_ZNSt3__16chrono12system_clock3nowEv() local_unnamed_addr #5

; Function Attrs: nounwind ssp uwtable
define dso_local void @_Z5startv() local_unnamed_addr #4 {
entry:
  %call.i = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #12
  %div.i.i.i = sdiv i64 %call.i, 1000
  %conv = trunc i64 %div.i.i.i to i32
  store i32 %conv, i32* @_ZL10start_time, align 4, !tbaa !16
  ret void
}

; Function Attrs: ssp uwtable
define dso_local void @_Z3endv() local_unnamed_addr #6 {
entry:
  %call.i = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #12
  %div.i.i.i = sdiv i64 %call.i, 1000
  %conv = trunc i64 %div.i.i.i to i32
  %0 = load i32, i32* @_ZL10start_time, align 4, !tbaa !16
  %sub = sub nsw i32 %conv, %0
  %call1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %sub)
  %call.i4 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: norecurse ssp uwtable mustprogress
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #8 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %ref.tmp.i.i.i92 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i76 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i = alloca %"class.std::__1::locale", align 8
  %call = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #13
  %0 = bitcast i8* %call to double*
  %call3 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #13
  %1 = bitcast i8* %call3 to double*
  %call6 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #13
  %call9 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #13
  %call12 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #13
  %call15 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #13
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(32) %call6, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(32) %call9, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(32) %call12, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(32) %call15, i8 0, i64 32, i1 false)
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  %2 = bitcast i8* %call6 to double*
  %3 = bitcast i8* %call9 to double*
  %4 = bitcast i8* %call12 to double*
  %5 = bitcast i8* %call15 to double*
  store double 1.000000e+00, double* %5, align 8, !tbaa !11
  %6 = load i32, i32* @enzyme_dup, align 4, !tbaa !16
  %7 = load i32, i32* @enzyme_const, align 4, !tbaa !16
  %8 = bitcast i8* %call to double*
  %9 = bitcast i8* %call9 to double*
  %10 = bitcast i8* %call3 to double*
  %11 = bitcast i8* %call12 to double*
  %12 = bitcast i8* %call6 to double*
  %13 = bitcast i8* %call15 to double*
  call void @diffe_Z7productPdS_S_i(double* %8, double* %9, double* %10, double* %11, double* %12, double* %13, i32 2)
  %14 = load double, double* %2, align 8, !tbaa !11
  %call27 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, double %14)
  %15 = bitcast %"class.std::__1::basic_ostream"* %call27 to i8**
  %vtable.i.i = load i8*, i8** %15, align 8, !tbaa !18
  %vbase.offset.ptr.i.i = getelementptr i8, i8* %vtable.i.i, i64 -24
  %16 = bitcast i8* %vbase.offset.ptr.i.i to i64*
  %vbase.offset.i.i = load i64, i64* %16, align 8
  %17 = bitcast %"class.std::__1::basic_ostream"* %call27 to i8*
  %add.ptr.i.i = getelementptr inbounds i8, i8* %17, i64 %vbase.offset.i.i
  %18 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %18) #12
  %19 = bitcast i8* %add.ptr.i.i to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %19)
  %call.i1.i.i.i = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i unwind label %lpad.i.i.i

invoke.cont.i.i.i:                                ; preds = %for.cond.cleanup
  %20 = bitcast %"class.std::__1::locale::facet"* %call.i1.i.i.i to %"class.std::__1::ctype"*
  %21 = bitcast %"class.std::__1::locale::facet"* %call.i1.i.i.i to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %21, align 8, !tbaa !18
  %vfn.i.i.i.i = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i, i64 7
  %22 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i, align 8
  %call.i2.i.i.i = invoke signext i8 %22(%"class.std::__1::ctype"* nonnull dereferenceable(25) %20, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit unwind label %lpad.i.i.i

lpad.i.i.i:                                       ; preds = %invoke.cont.i.i.i, %for.cond.cleanup
  %23 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %18) #12
  resume { i8*, i32 } %23

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit: ; preds = %invoke.cont.i.i.i
  %call4.i.i.i = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %18) #12
  %call1.i.i = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call27, i8 signext %call.i2.i.i.i)
  %call2.i.i = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call27)
  %24 = load double, double* %3, align 8, !tbaa !11
  %call30 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, double %24)
  %25 = bitcast %"class.std::__1::basic_ostream"* %call30 to i8**
  %vtable.i.i77 = load i8*, i8** %25, align 8, !tbaa !18
  %vbase.offset.ptr.i.i78 = getelementptr i8, i8* %vtable.i.i77, i64 -24
  %26 = bitcast i8* %vbase.offset.ptr.i.i78 to i64*
  %vbase.offset.i.i79 = load i64, i64* %26, align 8
  %27 = bitcast %"class.std::__1::basic_ostream"* %call30 to i8*
  %add.ptr.i.i80 = getelementptr inbounds i8, i8* %27, i64 %vbase.offset.i.i79
  %28 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i76 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %28) #12
  %29 = bitcast i8* %add.ptr.i.i80 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i76, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %29)
  %call.i1.i.i.i81 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i76, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i85 unwind label %lpad.i.i.i87

invoke.cont.i.i.i85:                              ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit
  %30 = bitcast %"class.std::__1::locale::facet"* %call.i1.i.i.i81 to %"class.std::__1::ctype"*
  %31 = bitcast %"class.std::__1::locale::facet"* %call.i1.i.i.i81 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i82 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %31, align 8, !tbaa !18
  %vfn.i.i.i.i83 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i82, i64 7
  %32 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i83, align 8
  %call.i2.i.i.i84 = invoke signext i8 %32(%"class.std::__1::ctype"* nonnull dereferenceable(25) %30, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit91 unwind label %lpad.i.i.i87

lpad.i.i.i87:                                     ; preds = %invoke.cont.i.i.i85, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit
  %33 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i86 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i76) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %28) #12
  resume { i8*, i32 } %33

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit91: ; preds = %invoke.cont.i.i.i85
  %call4.i.i.i88 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i76) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %28) #12
  %call1.i.i89 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call30, i8 signext %call.i2.i.i.i84)
  %call2.i.i90 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call30)
  %34 = load double, double* %4, align 8, !tbaa !11
  %call33 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, double %34)
  %35 = bitcast %"class.std::__1::basic_ostream"* %call33 to i8**
  %vtable.i.i93 = load i8*, i8** %35, align 8, !tbaa !18
  %vbase.offset.ptr.i.i94 = getelementptr i8, i8* %vtable.i.i93, i64 -24
  %36 = bitcast i8* %vbase.offset.ptr.i.i94 to i64*
  %vbase.offset.i.i95 = load i64, i64* %36, align 8
  %37 = bitcast %"class.std::__1::basic_ostream"* %call33 to i8*
  %add.ptr.i.i96 = getelementptr inbounds i8, i8* %37, i64 %vbase.offset.i.i95
  %38 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i92 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %38) #12
  %39 = bitcast i8* %add.ptr.i.i96 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i92, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %39)
  %call.i1.i.i.i97 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i92, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i101 unwind label %lpad.i.i.i103

invoke.cont.i.i.i101:                             ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit91
  %40 = bitcast %"class.std::__1::locale::facet"* %call.i1.i.i.i97 to %"class.std::__1::ctype"*
  %41 = bitcast %"class.std::__1::locale::facet"* %call.i1.i.i.i97 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i98 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %41, align 8, !tbaa !18
  %vfn.i.i.i.i99 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i98, i64 7
  %42 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i99, align 8
  %call.i2.i.i.i100 = invoke signext i8 %42(%"class.std::__1::ctype"* nonnull dereferenceable(25) %40, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit107 unwind label %lpad.i.i.i103

lpad.i.i.i103:                                    ; preds = %invoke.cont.i.i.i101, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit91
  %43 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i102 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i92) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #12
  resume { i8*, i32 } %43

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit107: ; preds = %invoke.cont.i.i.i101
  %call4.i.i.i104 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i92) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #12
  %call1.i.i105 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call33, i8 signext %call.i2.i.i.i100)
  %call2.i.i106 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call33)
  ret i32 0

for.body:                                         ; preds = %for.body, %entry
  %i.0108 = phi i64 [ 0, %entry ], [ %inc, %for.body ]
  %conv18 = uitofp i64 %i.0108 to double
  %arrayidx = getelementptr inbounds double, double* %0, i64 %i.0108
  store double %conv18, double* %arrayidx, align 8, !tbaa !11
  %arrayidx20 = getelementptr inbounds double, double* %1, i64 %i.0108
  store double %conv18, double* %arrayidx20, align 8, !tbaa !11
  %inc = add nuw nsw i64 %i.0108, 1
  %exitcond.not = icmp eq i64 %inc, 4
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !20
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare nonnull i8* @_Znam(i64) local_unnamed_addr #9

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8), double) local_unnamed_addr #3

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8)) local_unnamed_addr #3

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8), i8 signext) local_unnamed_addr #3

declare void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* sret(%"class.std::__1::locale") align 8, %"class.std::__1::ios_base"* nonnull dereferenceable(136)) local_unnamed_addr #3

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull returned dereferenceable(8)) unnamed_addr #5

declare %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8), %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12)) local_unnamed_addr #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #10

; Function Attrs: nofree norecurse nounwind ssp uwtable willreturn mustprogress
define internal void @diffe_Z7productPdS_S_i(double* nocapture readonly %x, double* nocapture %"x'", double* nocapture readonly %y, double* nocapture %"y'", double* nocapture %z, double* nocapture %"z'", i32 %size) #11 {
entry:
  %"iv'ac" = alloca i64, align 8
  %"iv1'ac" = alloca i64, align 8
  %"iv3'ac" = alloca i64, align 8
  %"add27'de" = alloca double, align 8
  store double 0.000000e+00, double* %"add27'de", align 8
  %"'de" = alloca double, align 8
  store double 0.000000e+00, double* %"'de", align 8
  %"mul22'de" = alloca double, align 8
  store double 0.000000e+00, double* %"mul22'de", align 8
  %_cache = alloca double*, align 8
  %_cache15 = alloca double*, align 8
  %"'de20" = alloca double, align 8
  store double 0.000000e+00, double* %"'de20", align 8
  %"'de21" = alloca double, align 8
  store double 0.000000e+00, double* %"'de21", align 8
  %cmp68 = icmp sgt i32 %size, 0
  br i1 %cmp68, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %size to i64
  %1 = shl nuw nsw i64 %0, 3
  %2 = zext i32 %size to i64
  %3 = add nsw i64 %0, -1
  %4 = add nsw i64 %0, -1
  %5 = add nsw i64 %0, -1
  %6 = add nuw i64 %3, 1
  %7 = add nuw i64 %4, 1
  %8 = add nuw i64 %5, 1
  %9 = mul nuw nsw i64 %8, %7
  %10 = mul nuw nsw i64 %9, %6
  %mallocsize = mul nuw nsw i64 %10, 8
  %malloccall = tail call noalias nonnull i8* @malloc(i64 %mallocsize)
  %_malloccache = bitcast i8* %malloccall to double*
  store double* %_malloccache, double** %_cache, align 8, !invariant.group !21
  %mallocsize16 = mul nuw nsw i64 %10, 8
  %malloccall17 = tail call noalias nonnull i8* @malloc(i64 %mallocsize16)
  %_malloccache18 = bitcast i8* %malloccall17 to double*
  store double* %_malloccache18, double** %_cache15, align 8, !invariant.group !22
  br label %for.cond10.preheader.lr.ph

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup7
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  br label %invertfor.cond.cleanup

for.cond10.preheader.lr.ph:                       ; preds = %for.cond.cleanup7, %for.cond1.preheader.lr.ph
  %iv = phi i64 [ %iv.next, %for.cond.cleanup7 ], [ 0, %for.cond1.preheader.lr.ph ]
  %11 = mul i64 %0, %iv
  %scevgep14 = getelementptr double, double* %x, i64 %11
  %iv.next = add nuw nsw i64 %iv, 1
  %12 = trunc i64 %iv to i32
  %13 = mul i32 %12, %size
  %14 = sext i32 %13 to i64
  %scevgep = getelementptr double, double* %z, i64 %14
  %scevgep72 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %scevgep72, i8 0, i64 %1, i1 false) #14
  %15 = mul nsw i64 %iv, %2
  %16 = add nuw nsw i64 %4, 1
  br label %for.body13.lr.ph

for.body13.lr.ph:                                 ; preds = %for.cond.cleanup12, %for.cond10.preheader.lr.ph
  %iv1 = phi i64 [ %iv.next2, %for.cond.cleanup12 ], [ 0, %for.cond10.preheader.lr.ph ]
  %17 = mul i64 %0, %iv1
  %scevgep9 = getelementptr double, double* %y, i64 %17
  %iv.next2 = add nuw nsw i64 %iv1, 1
  %18 = add nuw nsw i64 %iv1, %15
  %"arrayidx17'ipg" = getelementptr inbounds double, double* %"x'", i64 %18
  %arrayidx17 = getelementptr inbounds double, double* %x, i64 %18
  %19 = mul nsw i64 %iv1, %2
  %20 = add nuw nsw i64 %5, 1
  br label %for.body13

for.cond.cleanup7:                                ; preds = %for.cond.cleanup12
  %exitcond86.not = icmp eq i64 %iv.next, %0
  br i1 %exitcond86.not, label %for.cond.cleanup.loopexit, label %for.cond10.preheader.lr.ph, !llvm.loop !7

for.cond.cleanup12:                               ; preds = %for.body13
  %exitcond81.not = icmp eq i64 %iv.next2, %0
  br i1 %exitcond81.not, label %for.cond.cleanup7, label %for.body13.lr.ph, !llvm.loop !10

for.body13:                                       ; preds = %for.body13, %for.body13.lr.ph
  %iv3 = phi i64 [ %iv.next4, %for.body13 ], [ 0, %for.body13.lr.ph ]
  %iv.next4 = add nuw nsw i64 %iv3, 1
  %21 = load double, double* %arrayidx17, align 8, !tbaa !11
  %22 = add nuw nsw i64 %iv3, %19
  %"arrayidx21'ipg" = getelementptr inbounds double, double* %"y'", i64 %22
  %arrayidx21 = getelementptr inbounds double, double* %y, i64 %22
  %23 = load double, double* %arrayidx21, align 8, !tbaa !11
  %mul22 = fmul double %21, %23
  %24 = add nuw nsw i64 %iv3, %15
  %"arrayidx26'ipg" = getelementptr inbounds double, double* %"z'", i64 %24
  %arrayidx26 = getelementptr inbounds double, double* %z, i64 %24
  %25 = load double, double* %arrayidx26, align 8, !tbaa !11
  %add27 = fadd double %25, %mul22
  store double %add27, double* %arrayidx26, align 8, !tbaa !11
  %26 = load double*, double** %_cache15, align 8, !dereferenceable !23, !invariant.group !22
  %27 = mul nuw nsw i64 %8, %7
  %28 = mul nuw nsw i64 %27, %6
  %29 = mul nuw nsw i64 %iv1, %8
  %30 = add nuw nsw i64 %iv3, %29
  %31 = mul nuw nsw i64 %iv, %27
  %32 = add nuw nsw i64 %30, %31
  %33 = getelementptr inbounds double, double* %26, i64 %32
  store double %21, double* %33, align 8, !tbaa !11, !invariant.group !24
  %34 = load double*, double** %_cache, align 8, !dereferenceable !23, !invariant.group !21
  %35 = mul nuw nsw i64 %8, %7
  %36 = mul nuw nsw i64 %35, %6
  %37 = mul nuw nsw i64 %iv1, %8
  %38 = add nuw nsw i64 %iv3, %37
  %39 = mul nuw nsw i64 %iv, %35
  %40 = add nuw nsw i64 %38, %39
  %41 = getelementptr inbounds double, double* %34, i64 %40
  store double %23, double* %41, align 8, !tbaa !11, !invariant.group !25
  %exitcond.not = icmp eq i64 %iv.next4, %0
  br i1 %exitcond.not, label %for.cond.cleanup12, label %for.body13, !llvm.loop !15

invertentry:                                      ; preds = %invertfor.cond.cleanup, %invertfor.cond1.preheader.lr.ph
  ret void

invertfor.cond1.preheader.lr.ph:                  ; preds = %invertfor.cond10.preheader.lr.ph
  %42 = load i64, i64* %"iv'ac", align 8
  %43 = load i64, i64* %"iv1'ac", align 8
  %44 = load i64, i64* %"iv3'ac", align 8
  %forfree = load double*, double** %_cache, align 8, !dereferenceable !23, !invariant.group !21
  %45 = bitcast double* %forfree to i8*
  tail call void @free(i8* nonnull %45)
  %46 = load i64, i64* %"iv'ac", align 8
  %47 = load i64, i64* %"iv1'ac", align 8
  %48 = load i64, i64* %"iv3'ac", align 8
  %forfree19 = load double*, double** %_cache15, align 8, !dereferenceable !23, !invariant.group !22
  %49 = bitcast double* %forfree19 to i8*
  tail call void @free(i8* nonnull %49)
  br label %invertentry

invertfor.cond.cleanup.loopexit:                  ; preds = %invertfor.cond.cleanup
  %_unwrap = zext i32 %size to i64
  %_unwrap1 = add nsw i64 %_unwrap, -1
  br label %mergeinvertfor.cond10.preheader.lr.ph_for.cond.cleanup.loopexit

mergeinvertfor.cond10.preheader.lr.ph_for.cond.cleanup.loopexit: ; preds = %invertfor.cond.cleanup.loopexit
  store i64 %_unwrap1, i64* %"iv'ac", align 8
  br label %invertfor.cond.cleanup7

invertfor.cond.cleanup:                           ; preds = %for.cond.cleanup
  br i1 %cmp68, label %invertfor.cond.cleanup.loopexit, label %invertentry

invertfor.cond10.preheader.lr.ph:                 ; preds = %invertfor.body13.lr.ph
  %50 = load i64, i64* %"iv'ac", align 8
  %51 = icmp eq i64 %50, 0
  %52 = xor i1 %51, true
  br i1 %51, label %invertfor.cond1.preheader.lr.ph, label %incinvertfor.cond10.preheader.lr.ph

incinvertfor.cond10.preheader.lr.ph:              ; preds = %invertfor.cond10.preheader.lr.ph
  %53 = load i64, i64* %"iv'ac", align 8
  %54 = add nsw i64 %53, -1
  store i64 %54, i64* %"iv'ac", align 8
  br label %invertfor.cond.cleanup7

invertfor.body13.lr.ph:                           ; preds = %invertfor.body13
  %55 = load i64, i64* %"iv1'ac", align 8
  %56 = icmp eq i64 %55, 0
  %57 = xor i1 %56, true
  br i1 %56, label %invertfor.cond10.preheader.lr.ph, label %incinvertfor.body13.lr.ph

incinvertfor.body13.lr.ph:                        ; preds = %invertfor.body13.lr.ph
  %58 = load i64, i64* %"iv1'ac", align 8
  %59 = add nsw i64 %58, -1
  store i64 %59, i64* %"iv1'ac", align 8
  br label %invertfor.cond.cleanup12

invertfor.cond.cleanup7:                          ; preds = %incinvertfor.cond10.preheader.lr.ph, %mergeinvertfor.cond10.preheader.lr.ph_for.cond.cleanup.loopexit
  %60 = load i64, i64* %"iv'ac", align 8
  %_unwrap2 = zext i32 %size to i64
  %_unwrap3 = add nsw i64 %_unwrap2, -1
  br label %mergeinvertfor.body13.lr.ph_for.cond.cleanup7

mergeinvertfor.body13.lr.ph_for.cond.cleanup7:    ; preds = %invertfor.cond.cleanup7
  store i64 %_unwrap3, i64* %"iv1'ac", align 8
  br label %invertfor.cond.cleanup12

invertfor.cond.cleanup12:                         ; preds = %mergeinvertfor.body13.lr.ph_for.cond.cleanup7, %incinvertfor.body13.lr.ph
  %61 = load i64, i64* %"iv1'ac", align 8
  %62 = load i64, i64* %"iv'ac", align 8
  %_unwrap4 = zext i32 %size to i64
  %_unwrap5 = add nsw i64 %_unwrap4, -1
  br label %mergeinvertfor.body13_for.cond.cleanup12

mergeinvertfor.body13_for.cond.cleanup12:         ; preds = %invertfor.cond.cleanup12
  store i64 %_unwrap5, i64* %"iv3'ac", align 8
  br label %invertfor.body13

invertfor.body13:                                 ; preds = %incinvertfor.body13, %mergeinvertfor.body13_for.cond.cleanup12
  %63 = load i64, i64* %"iv3'ac", align 8
  %64 = load i64, i64* %"iv1'ac", align 8
  %65 = load i64, i64* %"iv'ac", align 8
  %_unwrap6 = zext i32 %size to i64
  %_unwrap7 = mul nsw i64 %65, %_unwrap6
  %_unwrap8 = add nuw nsw i64 %63, %_unwrap7
  %"arrayidx26'ipg_unwrap" = getelementptr inbounds double, double* %"z'", i64 %_unwrap8
  %66 = load double, double* %"arrayidx26'ipg_unwrap", align 8
  store double 0.000000e+00, double* %"arrayidx26'ipg_unwrap", align 8
  %67 = load double, double* %"add27'de", align 8
  %68 = fadd fast double %67, %66
  store double %68, double* %"add27'de", align 8
  %69 = load double, double* %"add27'de", align 8
  store double 0.000000e+00, double* %"add27'de", align 8
  %70 = load double, double* %"'de", align 8
  %71 = fadd fast double %70, %69
  store double %71, double* %"'de", align 8
  %72 = load double, double* %"mul22'de", align 8
  %73 = fadd fast double %72, %69
  store double %73, double* %"mul22'de", align 8
  %74 = load double, double* %"'de", align 8
  store double 0.000000e+00, double* %"'de", align 8
  %75 = load double, double* %"arrayidx26'ipg_unwrap", align 8
  %76 = fadd fast double %75, %74
  store double %76, double* %"arrayidx26'ipg_unwrap", align 8
  %77 = load double, double* %"mul22'de", align 8
  %78 = load i64, i64* %"iv3'ac", align 8
  %79 = load i64, i64* %"iv1'ac", align 8
  %80 = load i64, i64* %"iv'ac", align 8
  %_unwrap10 = zext i32 %size to i64
  %_unwrap11 = add nsw i64 %_unwrap10, -1
  %81 = add nuw i64 %_unwrap11, 1
  %_unwrap12 = add nsw i64 %_unwrap10, -1
  %82 = add nuw i64 %_unwrap12, 1
  %_unwrap13 = add nsw i64 %_unwrap10, -1
  %83 = add nuw i64 %_unwrap13, 1
  %84 = mul nuw nsw i64 %83, %82
  %85 = mul nuw nsw i64 %84, %81
  %86 = load double*, double** %_cache, align 8, !dereferenceable !23, !invariant.group !21
  %87 = mul nuw nsw i64 %83, %82
  %88 = mul nuw nsw i64 %87, %81
  %89 = mul nuw nsw i64 %79, %83
  %90 = add nuw nsw i64 %78, %89
  %91 = mul nuw nsw i64 %80, %87
  %92 = add nuw nsw i64 %90, %91
  %93 = getelementptr inbounds double, double* %86, i64 %92
  %94 = load double, double* %93, align 8, !tbaa !11, !invariant.group !25
  %m0diffe = fmul fast double %77, %94
  %95 = load i64, i64* %"iv3'ac", align 8
  %96 = load i64, i64* %"iv1'ac", align 8
  %97 = load i64, i64* %"iv'ac", align 8
  %98 = add nuw i64 %_unwrap11, 1
  %99 = add nuw i64 %_unwrap12, 1
  %100 = add nuw i64 %_unwrap13, 1
  %101 = mul nuw nsw i64 %100, %99
  %102 = mul nuw nsw i64 %101, %98
  %103 = load double*, double** %_cache15, align 8, !dereferenceable !23, !invariant.group !22
  %104 = mul nuw nsw i64 %100, %99
  %105 = mul nuw nsw i64 %104, %98
  %106 = mul nuw nsw i64 %96, %100
  %107 = add nuw nsw i64 %95, %106
  %108 = mul nuw nsw i64 %97, %104
  %109 = add nuw nsw i64 %107, %108
  %110 = getelementptr inbounds double, double* %103, i64 %109
  %111 = load double, double* %110, align 8, !tbaa !11, !invariant.group !24
  %m1diffe = fmul fast double %77, %111
  store double 0.000000e+00, double* %"mul22'de", align 8
  %112 = load double, double* %"'de20", align 8
  %113 = fadd fast double %112, %m0diffe
  store double %113, double* %"'de20", align 8
  %114 = load double, double* %"'de21", align 8
  %115 = fadd fast double %114, %m1diffe
  store double %115, double* %"'de21", align 8
  %116 = load double, double* %"'de21", align 8
  store double 0.000000e+00, double* %"'de21", align 8
  %117 = load i64, i64* %"iv3'ac", align 8
  %118 = load i64, i64* %"iv1'ac", align 8
  %119 = load i64, i64* %"iv'ac", align 8
  %_unwrap22 = mul nsw i64 %118, %_unwrap6
  %_unwrap23 = add nuw nsw i64 %117, %_unwrap22
  %"arrayidx21'ipg_unwrap" = getelementptr inbounds double, double* %"y'", i64 %_unwrap23
  %120 = load double, double* %"arrayidx21'ipg_unwrap", align 8
  %121 = fadd fast double %120, %116
  store double %121, double* %"arrayidx21'ipg_unwrap", align 8
  %122 = load double, double* %"'de20", align 8
  store double 0.000000e+00, double* %"'de20", align 8
  %123 = load i64, i64* %"iv3'ac", align 8
  %124 = load i64, i64* %"iv1'ac", align 8
  %125 = load i64, i64* %"iv'ac", align 8
  %_unwrap24 = add nuw nsw i64 %124, %_unwrap7
  %"arrayidx17'ipg_unwrap" = getelementptr inbounds double, double* %"x'", i64 %_unwrap24
  %126 = load double, double* %"arrayidx17'ipg_unwrap", align 8
  %127 = fadd fast double %126, %122
  store double %127, double* %"arrayidx17'ipg_unwrap", align 8
  %128 = load i64, i64* %"iv3'ac", align 8
  %129 = icmp eq i64 %128, 0
  %130 = xor i1 %129, true
  br i1 %129, label %invertfor.body13.lr.ph, label %incinvertfor.body13

incinvertfor.body13:                              ; preds = %invertfor.body13
  %131 = load i64, i64* %"iv3'ac", align 8
  %132 = add nsw i64 %131, -1
  store i64 %132, i64* %"iv3'ac", align 8
  br label %invertfor.body13
}

declare noalias i8* @malloc(i64)

declare void @free(i8*)

attributes #0 = { nofree norecurse nounwind ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nofree allocsize(0) "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #11 = { nofree norecurse nounwind ssp uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind }
attributes #13 = { builtin allocsize(0) }
attributes #14 = { willreturn mustprogress }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"branch-target-enforcement", i32 0}
!2 = !{i32 1, !"sign-return-address", i32 0}
!3 = !{i32 1, !"sign-return-address-all", i32 0}
!4 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{!"clang version 12.0.0 (https://github.com/AnyDSL/anydsl d7986ff5c2cc0981c888ada881a18b67c0ca67c9)"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !8, !9}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = distinct !{!15, !8, !9}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !13, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"vtable pointer", !14, i64 0}
!20 = distinct !{!20, !8, !9}
!21 = distinct !{}
!22 = distinct !{}
!23 = !{i64 8}
!24 = distinct !{}
!25 = distinct !{}
