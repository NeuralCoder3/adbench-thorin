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
%"class.std::__1::basic_ostream<char>::sentry" = type { i8, %"class.std::__1::basic_ostream"* }
%"class.std::__1::basic_streambuf" = type { i32 (...)**, %"class.std::__1::locale", i8*, i8*, i8*, i8*, i8*, i8* }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char>::__rep" }
%"struct.std::__1::basic_string<char>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { i8*, i64, i64 }
%"struct.std::__1::basic_string<char>::__short" = type { [23 x i8], %struct.anon }
%struct.anon = type { i8 }

@enzyme_dup = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_dupnoneed = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_out = dso_local local_unnamed_addr global i32 0, align 4
@enzyme_const = dso_local local_unnamed_addr global i32 0, align 4
@_ZL10start_time = internal unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream", align 8
@.str.1 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"x_d\00", align 1
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8

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

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @rand() local_unnamed_addr #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree norecurse nounwind ssp uwtable mustprogress
define dso_local void @_Z7productPdS_S_i(double* nocapture %x, double* nocapture readnone %y, double* nocapture readnone %z, i32 %size) #3 {
entry:
  %cmp14 = icmp sgt i32 %size, 1
  br i1 %cmp14, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = add nsw i32 %size, -1
  %wide.trip.count = zext i32 %0 to i64
  %.pre = load double, double* %x, align 8, !tbaa !7
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body, %for.body.preheader
  %1 = phi double [ %.pre, %for.body.preheader ], [ %mul, %for.body ]
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %2 = load double, double* %arrayidx2, align 8, !tbaa !7
  %mul = fmul double %1, %2
  store double %mul, double* %arrayidx2, align 8, !tbaa !7
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

declare double @_Z17__enzyme_autodiffPvz(i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind ssp uwtable
define dso_local i64 @_Z22timeSinceEpochMillisecv() local_unnamed_addr #4 {
entry:
  %call = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #14
  %div.i.i = sdiv i64 %call, 1000
  ret i64 %div.i.i
}

; Function Attrs: nounwind
declare i64 @_ZNSt3__16chrono12system_clock3nowEv() local_unnamed_addr #5

; Function Attrs: nounwind ssp uwtable
define dso_local void @_Z5startv() local_unnamed_addr #4 {
entry:
  %call.i = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #14
  %div.i.i.i = sdiv i64 %call.i, 1000
  %conv = trunc i64 %div.i.i.i to i32
  store i32 %conv, i32* @_ZL10start_time, align 4, !tbaa !14
  ret void
}

; Function Attrs: ssp uwtable
define dso_local void @_Z3endv() local_unnamed_addr #6 {
entry:
  %call.i = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #14
  %div.i.i.i = sdiv i64 %call.i, 1000
  %conv = trunc i64 %div.i.i.i to i32
  %0 = load i32, i32* @_ZL10start_time, align 4, !tbaa !14
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
  %ref.tmp.i.i.i216 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i200 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i184 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i166 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i150 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i132 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i116 = alloca %"class.std::__1::locale", align 8
  %ref.tmp.i.i.i = alloca %"class.std::__1::locale", align 8
  %call = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #15
  %0 = bitcast i8* %call to double*
  %call1 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #15
  %call2 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #15
  %call3 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #15
  %call4 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #15
  %call5 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #15
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(32) %call2, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(32) %call3, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(32) %call5, i8 0, i64 32, i1 false)
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  %1 = bitcast i8* %call2 to double*
  %2 = bitcast i8* %call3 to double*
  %3 = load double, double* %0, align 8, !tbaa !7
  %add10 = fadd double %3, 0.000000e+00
  store double %add10, double* %0, align 8, !tbaa !7
  %arrayidx11 = getelementptr inbounds i8, i8* %call3, i64 24
  %4 = bitcast i8* %arrayidx11 to double*
  store double 1.000000e+00, double* %4, align 8, !tbaa !7
  %call1.i = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  %5 = bitcast %"class.std::__1::basic_ostream"* %call1.i to i8**
  %vtable.i.i = load i8*, i8** %5, align 8, !tbaa !16
  %vbase.offset.ptr.i.i = getelementptr i8, i8* %vtable.i.i, i64 -24
  %6 = bitcast i8* %vbase.offset.ptr.i.i to i64*
  %vbase.offset.i.i = load i64, i64* %6, align 8
  %7 = bitcast %"class.std::__1::basic_ostream"* %call1.i to i8*
  %add.ptr.i.i = getelementptr inbounds i8, i8* %7, i64 %vbase.offset.i.i
  %8 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #14
  %9 = bitcast i8* %add.ptr.i.i to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %9)
  %call.i7.i.i.i = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i unwind label %lpad.i.i.i

invoke.cont.i.i.i:                                ; preds = %for.cond.cleanup
  %10 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i to %"class.std::__1::ctype"*
  %11 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %11, align 8, !tbaa !16
  %vfn.i.i.i.i = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i, i64 7
  %12 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i, align 8
  %call.i8.i.i.i = invoke signext i8 %12(%"class.std::__1::ctype"* nonnull dereferenceable(25) %10, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit unwind label %lpad.i.i.i

lpad.i.i.i:                                       ; preds = %invoke.cont.i.i.i, %for.cond.cleanup
  %13 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #14
  resume { i8*, i32 } %13

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit: ; preds = %invoke.cont.i.i.i
  %call4.i.i.i = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #14
  %call1.i.i = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call1.i, i8 signext %call.i8.i.i.i)
  %call2.i.i = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call1.i)
  %14 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i132 to i8*
  br label %for.body18

for.body:                                         ; preds = %for.body, %entry
  %i.0239 = phi i64 [ 0, %entry ], [ %add, %for.body ]
  %add = add nuw nsw i64 %i.0239, 1
  %conv = uitofp i64 %add to double
  %arrayidx = getelementptr inbounds double, double* %0, i64 %i.0239
  store double %conv, double* %arrayidx, align 8, !tbaa !7
  %exitcond243.not = icmp eq i64 %add, 4
  br i1 %exitcond243.not, label %for.cond.cleanup, label %for.body, !llvm.loop !18

for.cond.cleanup17:                               ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147
  %15 = load i32, i32* @enzyme_dup, align 4, !tbaa !14
  %16 = load i32, i32* @enzyme_const, align 4, !tbaa !14
  %17 = bitcast i8* %call to double*
  %18 = bitcast i8* %call3 to double*
  %19 = bitcast i8* %call1 to double*
  %20 = bitcast i8* %call4 to double*
  %21 = bitcast i8* %call2 to double*
  %22 = bitcast i8* %call5 to double*
  call void @diffe_Z7productPdS_S_i(double* %17, double* %18, double* %19, double* %20, double* %21, double* %22, i32 4)
  %call1.i115 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0), i64 1)
  %23 = bitcast %"class.std::__1::basic_ostream"* %call1.i115 to i8**
  %vtable.i.i117 = load i8*, i8** %23, align 8, !tbaa !16
  %vbase.offset.ptr.i.i118 = getelementptr i8, i8* %vtable.i.i117, i64 -24
  %24 = bitcast i8* %vbase.offset.ptr.i.i118 to i64*
  %vbase.offset.i.i119 = load i64, i64* %24, align 8
  %25 = bitcast %"class.std::__1::basic_ostream"* %call1.i115 to i8*
  %add.ptr.i.i120 = getelementptr inbounds i8, i8* %25, i64 %vbase.offset.i.i119
  %26 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i116 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %26) #14
  %27 = bitcast i8* %add.ptr.i.i120 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i116, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %27)
  %call.i7.i.i.i121 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i116, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i125 unwind label %lpad.i.i.i127

invoke.cont.i.i.i125:                             ; preds = %for.cond.cleanup17
  %28 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i121 to %"class.std::__1::ctype"*
  %29 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i121 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i122 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %29, align 8, !tbaa !16
  %vfn.i.i.i.i123 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i122, i64 7
  %30 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i123, align 8
  %call.i8.i.i.i124 = invoke signext i8 %30(%"class.std::__1::ctype"* nonnull dereferenceable(25) %28, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit131 unwind label %lpad.i.i.i127

lpad.i.i.i127:                                    ; preds = %invoke.cont.i.i.i125, %for.cond.cleanup17
  %31 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i126 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i116) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %26) #14
  resume { i8*, i32 } %31

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit131: ; preds = %invoke.cont.i.i.i125
  %call4.i.i.i128 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i116) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %26) #14
  %call1.i.i129 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call1.i115, i8 signext %call.i8.i.i.i124)
  %call2.i.i130 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call1.i115)
  %32 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i166 to i8*
  br label %for.body32

for.body18:                                       ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147.for.body18_crit_edge, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit
  %33 = phi double [ %add10, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit ], [ %.pre, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147.for.body18_crit_edge ]
  %i14.0238 = phi i64 [ 0, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit ], [ %inc23, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147.for.body18_crit_edge ]
  %call20 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, double %33)
  %34 = bitcast %"class.std::__1::basic_ostream"* %call20 to i8**
  %vtable.i.i133 = load i8*, i8** %34, align 8, !tbaa !16
  %vbase.offset.ptr.i.i134 = getelementptr i8, i8* %vtable.i.i133, i64 -24
  %35 = bitcast i8* %vbase.offset.ptr.i.i134 to i64*
  %vbase.offset.i.i135 = load i64, i64* %35, align 8
  %36 = bitcast %"class.std::__1::basic_ostream"* %call20 to i8*
  %add.ptr.i.i136 = getelementptr inbounds i8, i8* %36, i64 %vbase.offset.i.i135
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14) #14
  %37 = bitcast i8* %add.ptr.i.i136 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i132, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %37)
  %call.i7.i.i.i137 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i132, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i141 unwind label %lpad.i.i.i143

invoke.cont.i.i.i141:                             ; preds = %for.body18
  %38 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i137 to %"class.std::__1::ctype"*
  %39 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i137 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i138 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %39, align 8, !tbaa !16
  %vfn.i.i.i.i139 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i138, i64 7
  %40 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i139, align 8
  %call.i8.i.i.i140 = invoke signext i8 %40(%"class.std::__1::ctype"* nonnull dereferenceable(25) %38, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147 unwind label %lpad.i.i.i143

lpad.i.i.i143:                                    ; preds = %invoke.cont.i.i.i141, %for.body18
  %41 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i142 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i132) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #14
  resume { i8*, i32 } %41

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147: ; preds = %invoke.cont.i.i.i141
  %call4.i.i.i144 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i132) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #14
  %call1.i.i145 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call20, i8 signext %call.i8.i.i.i140)
  %call2.i.i146 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call20)
  %inc23 = add nuw nsw i64 %i14.0238, 1
  %exitcond242.not = icmp eq i64 %inc23, 4
  br i1 %exitcond242.not, label %for.cond.cleanup17, label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147.for.body18_crit_edge, !llvm.loop !19

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147.for.body18_crit_edge: ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit147
  %arrayidx19.phi.trans.insert = getelementptr inbounds double, double* %0, i64 %inc23
  %.pre = load double, double* %arrayidx19.phi.trans.insert, align 8, !tbaa !7
  br label %for.body18

for.cond.cleanup31:                               ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit181
  %call1.i149 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i64 1)
  %42 = bitcast %"class.std::__1::basic_ostream"* %call1.i149 to i8**
  %vtable.i.i151 = load i8*, i8** %42, align 8, !tbaa !16
  %vbase.offset.ptr.i.i152 = getelementptr i8, i8* %vtable.i.i151, i64 -24
  %43 = bitcast i8* %vbase.offset.ptr.i.i152 to i64*
  %vbase.offset.i.i153 = load i64, i64* %43, align 8
  %44 = bitcast %"class.std::__1::basic_ostream"* %call1.i149 to i8*
  %add.ptr.i.i154 = getelementptr inbounds i8, i8* %44, i64 %vbase.offset.i.i153
  %45 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i150 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %45) #14
  %46 = bitcast i8* %add.ptr.i.i154 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i150, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %46)
  %call.i7.i.i.i155 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i150, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i159 unwind label %lpad.i.i.i161

invoke.cont.i.i.i159:                             ; preds = %for.cond.cleanup31
  %47 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i155 to %"class.std::__1::ctype"*
  %48 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i155 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i156 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %48, align 8, !tbaa !16
  %vfn.i.i.i.i157 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i156, i64 7
  %49 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i157, align 8
  %call.i8.i.i.i158 = invoke signext i8 %49(%"class.std::__1::ctype"* nonnull dereferenceable(25) %47, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit165 unwind label %lpad.i.i.i161

lpad.i.i.i161:                                    ; preds = %invoke.cont.i.i.i159, %for.cond.cleanup31
  %50 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i160 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i150) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %45) #14
  resume { i8*, i32 } %50

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit165: ; preds = %invoke.cont.i.i.i159
  %call4.i.i.i162 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i150) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %45) #14
  %call1.i.i163 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call1.i149, i8 signext %call.i8.i.i.i158)
  %call2.i.i164 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call1.i149)
  %51 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i200 to i8*
  br label %for.body45

for.body32:                                       ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit181, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit131
  %i28.0237 = phi i64 [ 0, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit131 ], [ %inc37, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit181 ]
  %arrayidx33 = getelementptr inbounds double, double* %1, i64 %i28.0237
  %52 = load double, double* %arrayidx33, align 8, !tbaa !7
  %call34 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, double %52)
  %53 = bitcast %"class.std::__1::basic_ostream"* %call34 to i8**
  %vtable.i.i167 = load i8*, i8** %53, align 8, !tbaa !16
  %vbase.offset.ptr.i.i168 = getelementptr i8, i8* %vtable.i.i167, i64 -24
  %54 = bitcast i8* %vbase.offset.ptr.i.i168 to i64*
  %vbase.offset.i.i169 = load i64, i64* %54, align 8
  %55 = bitcast %"class.std::__1::basic_ostream"* %call34 to i8*
  %add.ptr.i.i170 = getelementptr inbounds i8, i8* %55, i64 %vbase.offset.i.i169
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %32) #14
  %56 = bitcast i8* %add.ptr.i.i170 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i166, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %56)
  %call.i7.i.i.i171 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i166, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i175 unwind label %lpad.i.i.i177

invoke.cont.i.i.i175:                             ; preds = %for.body32
  %57 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i171 to %"class.std::__1::ctype"*
  %58 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i171 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i172 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %58, align 8, !tbaa !16
  %vfn.i.i.i.i173 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i172, i64 7
  %59 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i173, align 8
  %call.i8.i.i.i174 = invoke signext i8 %59(%"class.std::__1::ctype"* nonnull dereferenceable(25) %57, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit181 unwind label %lpad.i.i.i177

lpad.i.i.i177:                                    ; preds = %invoke.cont.i.i.i175, %for.body32
  %60 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i176 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i166) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %32) #14
  resume { i8*, i32 } %60

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit181: ; preds = %invoke.cont.i.i.i175
  %call4.i.i.i178 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i166) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %32) #14
  %call1.i.i179 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call34, i8 signext %call.i8.i.i.i174)
  %call2.i.i180 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call34)
  %inc37 = add nuw nsw i64 %i28.0237, 1
  %exitcond241.not = icmp eq i64 %inc37, 4
  br i1 %exitcond241.not, label %for.cond.cleanup31, label %for.body32, !llvm.loop !20

for.cond.cleanup44:                               ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit215
  %call1.i183 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 3)
  %61 = bitcast %"class.std::__1::basic_ostream"* %call1.i183 to i8**
  %vtable.i.i185 = load i8*, i8** %61, align 8, !tbaa !16
  %vbase.offset.ptr.i.i186 = getelementptr i8, i8* %vtable.i.i185, i64 -24
  %62 = bitcast i8* %vbase.offset.ptr.i.i186 to i64*
  %vbase.offset.i.i187 = load i64, i64* %62, align 8
  %63 = bitcast %"class.std::__1::basic_ostream"* %call1.i183 to i8*
  %add.ptr.i.i188 = getelementptr inbounds i8, i8* %63, i64 %vbase.offset.i.i187
  %64 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i184 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %64) #14
  %65 = bitcast i8* %add.ptr.i.i188 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i184, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %65)
  %call.i7.i.i.i189 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i184, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i193 unwind label %lpad.i.i.i195

invoke.cont.i.i.i193:                             ; preds = %for.cond.cleanup44
  %66 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i189 to %"class.std::__1::ctype"*
  %67 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i189 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i190 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %67, align 8, !tbaa !16
  %vfn.i.i.i.i191 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i190, i64 7
  %68 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i191, align 8
  %call.i8.i.i.i192 = invoke signext i8 %68(%"class.std::__1::ctype"* nonnull dereferenceable(25) %66, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit199 unwind label %lpad.i.i.i195

lpad.i.i.i195:                                    ; preds = %invoke.cont.i.i.i193, %for.cond.cleanup44
  %69 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i194 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i184) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %64) #14
  resume { i8*, i32 } %69

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit199: ; preds = %invoke.cont.i.i.i193
  %call4.i.i.i196 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i184) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %64) #14
  %call1.i.i197 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call1.i183, i8 signext %call.i8.i.i.i192)
  %call2.i.i198 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call1.i183)
  %70 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i.i216 to i8*
  br label %for.body58

for.body45:                                       ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit215, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit165
  %i41.0236 = phi i64 [ 0, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit165 ], [ %inc50, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit215 ]
  %arrayidx46 = getelementptr inbounds double, double* %0, i64 %i41.0236
  %71 = load double, double* %arrayidx46, align 8, !tbaa !7
  %call47 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, double %71)
  %72 = bitcast %"class.std::__1::basic_ostream"* %call47 to i8**
  %vtable.i.i201 = load i8*, i8** %72, align 8, !tbaa !16
  %vbase.offset.ptr.i.i202 = getelementptr i8, i8* %vtable.i.i201, i64 -24
  %73 = bitcast i8* %vbase.offset.ptr.i.i202 to i64*
  %vbase.offset.i.i203 = load i64, i64* %73, align 8
  %74 = bitcast %"class.std::__1::basic_ostream"* %call47 to i8*
  %add.ptr.i.i204 = getelementptr inbounds i8, i8* %74, i64 %vbase.offset.i.i203
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %51) #14
  %75 = bitcast i8* %add.ptr.i.i204 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i200, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %75)
  %call.i7.i.i.i205 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i200, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i209 unwind label %lpad.i.i.i211

invoke.cont.i.i.i209:                             ; preds = %for.body45
  %76 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i205 to %"class.std::__1::ctype"*
  %77 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i205 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i206 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %77, align 8, !tbaa !16
  %vfn.i.i.i.i207 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i206, i64 7
  %78 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i207, align 8
  %call.i8.i.i.i208 = invoke signext i8 %78(%"class.std::__1::ctype"* nonnull dereferenceable(25) %76, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit215 unwind label %lpad.i.i.i211

lpad.i.i.i211:                                    ; preds = %invoke.cont.i.i.i209, %for.body45
  %79 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i210 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i200) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %51) #14
  resume { i8*, i32 } %79

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit215: ; preds = %invoke.cont.i.i.i209
  %call4.i.i.i212 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i200) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %51) #14
  %call1.i.i213 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call47, i8 signext %call.i8.i.i.i208)
  %call2.i.i214 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call47)
  %inc50 = add nuw nsw i64 %i41.0236, 1
  %exitcond240.not = icmp eq i64 %inc50, 4
  br i1 %exitcond240.not, label %for.cond.cleanup44, label %for.body45, !llvm.loop !21

for.cond.cleanup57:                               ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit231
  ret i32 0

for.body58:                                       ; preds = %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit231, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit199
  %i54.0235 = phi i64 [ 0, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit199 ], [ %inc63, %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit231 ]
  %arrayidx59 = getelementptr inbounds double, double* %2, i64 %i54.0235
  %80 = load double, double* %arrayidx59, align 8, !tbaa !7
  %call60 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) @_ZNSt3__14coutE, double %80)
  %81 = bitcast %"class.std::__1::basic_ostream"* %call60 to i8**
  %vtable.i.i217 = load i8*, i8** %81, align 8, !tbaa !16
  %vbase.offset.ptr.i.i218 = getelementptr i8, i8* %vtable.i.i217, i64 -24
  %82 = bitcast i8* %vbase.offset.ptr.i.i218 to i64*
  %vbase.offset.i.i219 = load i64, i64* %82, align 8
  %83 = bitcast %"class.std::__1::basic_ostream"* %call60 to i8*
  %add.ptr.i.i220 = getelementptr inbounds i8, i8* %83, i64 %vbase.offset.i.i219
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %70) #14
  %84 = bitcast i8* %add.ptr.i.i220 to %"class.std::__1::ios_base"*
  call void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i.i216, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %84)
  %call.i7.i.i.i221 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i216, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i.i225 unwind label %lpad.i.i.i227

invoke.cont.i.i.i225:                             ; preds = %for.body58
  %85 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i221 to %"class.std::__1::ctype"*
  %86 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i.i221 to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i.i222 = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %86, align 8, !tbaa !16
  %vfn.i.i.i.i223 = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i.i222, i64 7
  %87 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i.i223, align 8
  %call.i8.i.i.i224 = invoke signext i8 %87(%"class.std::__1::ctype"* nonnull dereferenceable(25) %85, i8 signext 10)
          to label %_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit231 unwind label %lpad.i.i.i227

lpad.i.i.i227:                                    ; preds = %invoke.cont.i.i.i225, %for.body58
  %88 = landingpad { i8*, i32 }
          cleanup
  %call5.i.i.i226 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i216) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %70) #14
  resume { i8*, i32 } %88

_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E.exit231: ; preds = %invoke.cont.i.i.i225
  %call4.i.i.i228 = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i.i216) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %70) #14
  %call1.i.i229 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call60, i8 signext %call.i8.i.i.i224)
  %call2.i.i230 = call nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8) %call60)
  %inc63 = add nuw nsw i64 %i54.0235, 1
  %exitcond.not = icmp eq i64 %inc63, 4
  br i1 %exitcond.not, label %for.cond.cleanup57, label %for.body58, !llvm.loop !22
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare nonnull i8* @_Znam(i64) local_unnamed_addr #9

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8), double) local_unnamed_addr #2

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8)) local_unnamed_addr #2

; Function Attrs: ssp uwtable
define linkonce_odr nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(%"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__os, i8* %__str, i64 %__len) local_unnamed_addr #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %ref.tmp.i.i = alloca %"class.std::__1::locale", align 8
  %__s = alloca %"class.std::__1::basic_ostream<char>::sentry", align 8
  %0 = getelementptr inbounds %"class.std::__1::basic_ostream<char>::sentry", %"class.std::__1::basic_ostream<char>::sentry"* %__s, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #14
  %call = invoke %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(%"class.std::__1::basic_ostream<char>::sentry"* nonnull dereferenceable(16) %__s, %"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8) %__os)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %1 = load i8, i8* %0, align 8, !tbaa !23, !range !27
  %tobool.i.not = icmp eq i8 %1, 0
  br i1 %tobool.i.not, label %if.end30, label %if.then

if.then:                                          ; preds = %invoke.cont
  %2 = bitcast %"class.std::__1::basic_ostream"* %__os to i8**
  %vtable.i.i = load i8*, i8** %2, align 8, !tbaa !16
  %vbase.offset.ptr.i.i = getelementptr i8, i8* %vtable.i.i, i64 -24
  %3 = bitcast i8* %vbase.offset.ptr.i.i to i64*
  %vbase.offset.i.i = load i64, i64* %3, align 8
  %4 = bitcast %"class.std::__1::basic_ostream"* %__os to i8*
  %add.ptr.i.i = getelementptr inbounds i8, i8* %4, i64 %vbase.offset.i.i
  %__rdbuf_.i.i.i.i = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 40
  %5 = bitcast i8* %__rdbuf_.i.i.i.i to %"class.std::__1::basic_streambuf"**
  %6 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %5, align 8, !tbaa !28
  %7 = bitcast i8* %add.ptr.i.i to %"class.std::__1::ios_base"*
  %__fmtflags_.i = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 8
  %8 = bitcast i8* %__fmtflags_.i to i32*
  %9 = load i32, i32* %8, align 8, !tbaa !31
  %add.ptr8 = getelementptr inbounds i8, i8* %__str, i64 %__len
  %__fill_.i = getelementptr inbounds i8, i8* %add.ptr.i.i, i64 144
  %10 = bitcast i8* %__fill_.i to i32*
  %11 = load i32, i32* %10, align 8, !tbaa !32
  %cmp.i.i = icmp eq i32 %11, -1
  br i1 %cmp.i.i, label %if.then.i, label %invoke.cont18

if.then.i:                                        ; preds = %if.then
  %12 = bitcast %"class.std::__1::locale"* %ref.tmp.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #14
  invoke void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* nonnull sret(%"class.std::__1::locale") align 8 %ref.tmp.i.i, %"class.std::__1::ios_base"* nonnull dereferenceable(136) %7)
          to label %.noexc unwind label %lpad5

.noexc:                                           ; preds = %if.then.i
  %call.i7.i.i = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %invoke.cont.i.i unwind label %lpad.i.i

invoke.cont.i.i:                                  ; preds = %.noexc
  %13 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i to %"class.std::__1::ctype"*
  %14 = bitcast %"class.std::__1::locale::facet"* %call.i7.i.i to i8 (%"class.std::__1::ctype"*, i8)***
  %vtable.i.i.i = load i8 (%"class.std::__1::ctype"*, i8)**, i8 (%"class.std::__1::ctype"*, i8)*** %14, align 8, !tbaa !16
  %vfn.i.i.i = getelementptr inbounds i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vtable.i.i.i, i64 7
  %15 = load i8 (%"class.std::__1::ctype"*, i8)*, i8 (%"class.std::__1::ctype"*, i8)** %vfn.i.i.i, align 8
  %call.i8.i.i = invoke signext i8 %15(%"class.std::__1::ctype"* nonnull dereferenceable(25) %13, i8 signext 32)
          to label %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit.i unwind label %lpad.i.i

lpad.i.i:                                         ; preds = %invoke.cont.i.i, %.noexc
  %16 = landingpad { i8*, i32 }
          catch i8* null
  %call5.i.i = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #14
  br label %ehcleanup

_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit.i: ; preds = %invoke.cont.i.i
  %call4.i.i = call %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull dereferenceable(8) %ref.tmp.i.i) #14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #14
  %conv.i = sext i8 %call.i8.i.i to i32
  store i32 %conv.i, i32* %10, align 8, !tbaa !32
  br label %invoke.cont18

invoke.cont18:                                    ; preds = %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit.i, %if.then
  %17 = phi i32 [ %conv.i, %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit.i ], [ %11, %if.then ]
  %conv6.i = trunc i32 %17 to i8
  %and = and i32 %9, 176
  %cmp = icmp eq i32 %and, 32
  %cond = select i1 %cmp, i8* %add.ptr8, i8* %__str
  %coerce.val.pi = ptrtoint %"class.std::__1::basic_streambuf"* %6 to i64
  %call21 = invoke i64 @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %coerce.val.pi, i8* %__str, i8* %cond, i8* %add.ptr8, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %7, i8 signext %conv6.i)
          to label %invoke.cont20 unwind label %lpad5

invoke.cont20:                                    ; preds = %invoke.cont18
  %cmp.i = icmp eq i64 %call21, 0
  br i1 %cmp.i, label %if.then24, label %if.end30

if.then24:                                        ; preds = %invoke.cont20
  %vtable25 = load i8*, i8** %2, align 8, !tbaa !16
  %vbase.offset.ptr26 = getelementptr i8, i8* %vtable25, i64 -24
  %18 = bitcast i8* %vbase.offset.ptr26 to i64*
  %vbase.offset27 = load i64, i64* %18, align 8
  %add.ptr28 = getelementptr inbounds i8, i8* %4, i64 %vbase.offset27
  %19 = bitcast i8* %add.ptr28 to %"class.std::__1::ios_base"*
  %__rdstate_.i.i = getelementptr inbounds i8, i8* %add.ptr28, i64 32
  %20 = bitcast i8* %__rdstate_.i.i to i32*
  %21 = load i32, i32* %20, align 8, !tbaa !34
  %or.i.i = or i32 %21, 5
  invoke void @_ZNSt3__18ios_base5clearEj(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %19, i32 %or.i.i)
          to label %if.end30 unwind label %lpad1

lpad:                                             ; preds = %entry
  %22 = landingpad { i8*, i32 }
          catch i8* null
  %.pre = bitcast %"class.std::__1::basic_ostream"* %__os to i8**
  %.pre57 = bitcast %"class.std::__1::basic_ostream"* %__os to i8*
  br label %ehcleanup33

lpad1:                                            ; preds = %if.then24
  %23 = landingpad { i8*, i32 }
          catch i8* null
  br label %ehcleanup

lpad5:                                            ; preds = %invoke.cont18, %if.then.i
  %24 = landingpad { i8*, i32 }
          catch i8* null
  br label %ehcleanup

if.end30:                                         ; preds = %if.then24, %invoke.cont20, %invoke.cont
  %call31 = call %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(%"class.std::__1::basic_ostream<char>::sentry"* nonnull dereferenceable(16) %__s) #14
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #14
  br label %try.cont

ehcleanup:                                        ; preds = %lpad5, %lpad1, %lpad.i.i
  %.pn = phi { i8*, i32 } [ %23, %lpad1 ], [ %24, %lpad5 ], [ %16, %lpad.i.i ]
  %call32 = call %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(%"class.std::__1::basic_ostream<char>::sentry"* nonnull dereferenceable(16) %__s) #14
  br label %ehcleanup33

ehcleanup33:                                      ; preds = %ehcleanup, %lpad
  %.pre-phi58 = phi i8* [ %4, %ehcleanup ], [ %.pre57, %lpad ]
  %.pre-phi = phi i8** [ %2, %ehcleanup ], [ %.pre, %lpad ]
  %.pn.pn = phi { i8*, i32 } [ %.pn, %ehcleanup ], [ %22, %lpad ]
  %exn.slot.1 = extractvalue { i8*, i32 } %.pn.pn, 0
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #14
  %25 = call i8* @__cxa_begin_catch(i8* %exn.slot.1) #14
  %vtable34 = load i8*, i8** %.pre-phi, align 8, !tbaa !16
  %vbase.offset.ptr35 = getelementptr i8, i8* %vtable34, i64 -24
  %26 = bitcast i8* %vbase.offset.ptr35 to i64*
  %vbase.offset36 = load i64, i64* %26, align 8
  %add.ptr37 = getelementptr inbounds i8, i8* %.pre-phi58, i64 %vbase.offset36
  %27 = bitcast i8* %add.ptr37 to %"class.std::__1::ios_base"*
  invoke void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136) %27)
          to label %invoke.cont39 unwind label %lpad38

invoke.cont39:                                    ; preds = %ehcleanup33
  call void @__cxa_end_catch()
  br label %try.cont

try.cont:                                         ; preds = %invoke.cont39, %if.end30
  ret %"class.std::__1::basic_ostream"* %__os

lpad38:                                           ; preds = %ehcleanup33
  %28 = landingpad { i8*, i32 }
          cleanup
  invoke void @__cxa_end_catch()
          to label %eh.resume unwind label %terminate.lpad

eh.resume:                                        ; preds = %lpad38
  resume { i8*, i32 } %28

terminate.lpad:                                   ; preds = %lpad38
  %29 = landingpad { i8*, i32 }
          catch i8* null
  %30 = extractvalue { i8*, i32 } %29, 0
  call void @__clang_call_terminate(i8* %30) #16
  unreachable
}

declare %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(%"class.std::__1::basic_ostream<char>::sentry"* nonnull returned dereferenceable(16), %"class.std::__1::basic_ostream"* nonnull align 8 dereferenceable(8)) unnamed_addr #2

declare i32 @__gxx_personality_v0(...)

; Function Attrs: ssp uwtable
define linkonce_odr hidden i64 @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %__s.coerce, i8* %__ob, i8* %__op, i8* %__oe, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %__iob, i8 signext %__fl) local_unnamed_addr #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__sp = alloca %"class.std::__1::basic_string", align 8
  %coerce.val.ip = inttoptr i64 %__s.coerce to %"class.std::__1::basic_streambuf"*
  %cmp = icmp eq i64 %__s.coerce, 0
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %sub.ptr.lhs.cast = ptrtoint i8* %__oe to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %__ob to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %__width_.i = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %__iob, i64 0, i32 3
  %0 = load i64, i64* %__width_.i, align 8, !tbaa !35
  %cmp1 = icmp sgt i64 %0, %sub.ptr.sub
  %sub = sub nsw i64 %0, %sub.ptr.sub
  %__ns.0 = select i1 %cmp1, i64 %sub, i64 0
  %sub.ptr.lhs.cast4 = ptrtoint i8* %__op to i64
  %sub.ptr.sub6 = sub i64 %sub.ptr.lhs.cast4, %sub.ptr.rhs.cast
  %cmp7 = icmp sgt i64 %sub.ptr.sub6, 0
  br i1 %cmp7, label %if.then8, label %if.end15

if.then8:                                         ; preds = %if.end
  %1 = inttoptr i64 %__s.coerce to i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)***
  %vtable.i83 = load i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)**, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*** %1, align 8, !tbaa !16
  %vfn.i84 = getelementptr inbounds i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)** %vtable.i83, i64 12
  %2 = load i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)** %vfn.i84, align 8
  %call.i85 = tail call i64 %2(%"class.std::__1::basic_streambuf"* nonnull dereferenceable(64) %coerce.val.ip, i8* %__ob, i64 %sub.ptr.sub6)
  %cmp11.not = icmp eq i64 %call.i85, %sub.ptr.sub6
  br i1 %cmp11.not, label %if.end15, label %return

if.end15:                                         ; preds = %if.then8, %if.end
  %cmp16 = icmp sgt i64 %__ns.0, 0
  br i1 %cmp16, label %if.then17, label %if.end29

if.then17:                                        ; preds = %if.end15
  %3 = bitcast %"class.std::__1::basic_string"* %__sp to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #14
  %cmp2.i.i.i = icmp ult i64 %__ns.0, 23
  br i1 %cmp2.i.i.i, label %if.end9.i.i.i, label %if.end9.thread.i.i.i

if.end9.thread.i.i.i:                             ; preds = %if.then17
  %add.i.i.i.i.i = add nuw i64 %__ns.0, 16
  %and.i.i.i.i.i = and i64 %add.i.i.i.i.i, -16
  %call.i.i.i.i.i.i.i = tail call noalias nonnull i8* @_Znwm(i64 %and.i.i.i.i.i) #15
  %__data_.i.i.i.i = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %__sp, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i8* %call.i.i.i.i.i.i.i, i8** %__data_.i.i.i.i, align 8, !tbaa !36
  %or.i.i.i.i = or i64 %and.i.i.i.i.i, -9223372036854775808
  %__cap_.i.i.i.i = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %__sp, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i64 %or.i.i.i.i, i64* %__cap_.i.i.i.i, align 8, !tbaa !36
  %__size_.i.i.i.i = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %__sp, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %__ns.0, i64* %__size_.i.i.i.i, align 8, !tbaa !36
  %.pre = bitcast %"class.std::__1::basic_string"* %__sp to %"struct.std::__1::basic_string<char>::__short"*
  br label %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc.exit

if.end9.i.i.i:                                    ; preds = %if.then17
  %conv.i.i.i.i = trunc i64 %__ns.0 to i8
  %__s2.i.i.i.i = bitcast %"class.std::__1::basic_string"* %__sp to %"struct.std::__1::basic_string<char>::__short"*
  %__size_.i23.i.i.i = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s2.i.i.i.i, i64 0, i32 1, i32 0
  store i8 %conv.i.i.i.i, i8* %__size_.i23.i.i.i, align 1, !tbaa !36
  br label %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc.exit

_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc.exit: ; preds = %if.end9.i.i.i, %if.end9.thread.i.i.i
  %__s.i.i.i.pre-phi = phi %"struct.std::__1::basic_string<char>::__short"* [ %.pre, %if.end9.thread.i.i.i ], [ %__s2.i.i.i.i, %if.end9.i.i.i ]
  %__p.026.i.i.i = phi i8* [ %call.i.i.i.i.i.i.i, %if.end9.thread.i.i.i ], [ %3, %if.end9.i.i.i ]
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %__p.026.i.i.i, i8 %__fl, i64 %__ns.0, i1 false) #14
  %arrayidx.i.i.i = getelementptr inbounds i8, i8* %__p.026.i.i.i, i64 %__ns.0
  store i8 0, i8* %arrayidx.i.i.i, align 1, !tbaa !36
  %__size_.i.i.i = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s.i.i.i.pre-phi, i64 0, i32 1, i32 0
  %4 = load i8, i8* %__size_.i.i.i, align 1, !tbaa !36
  %tobool.i.i.i = icmp slt i8 %4, 0
  %__data_.i.i.i = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %__sp, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = load i8*, i8** %__data_.i.i.i, align 8
  %cond.i.i = select i1 %tobool.i.i.i, i8* %5, i8* %3
  %6 = inttoptr i64 %__s.coerce to i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)***
  %vtable.i91 = load i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)**, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*** %6, align 8, !tbaa !16
  %vfn.i92 = getelementptr inbounds i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)** %vtable.i91, i64 12
  %7 = load i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)** %vfn.i92, align 8
  %call.i9394 = invoke i64 %7(%"class.std::__1::basic_streambuf"* nonnull dereferenceable(64) %coerce.val.ip, i8* %cond.i.i, i64 %__ns.0)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc.exit
  %cmp22.not = icmp eq i64 %call.i9394, %__ns.0
  %8 = load i8, i8* %__size_.i.i.i, align 1, !tbaa !36
  %tobool.i.i.i97 = icmp slt i8 %8, 0
  br i1 %tobool.i.i.i97, label %if.then.i.i99, label %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit100

if.then.i.i99:                                    ; preds = %invoke.cont
  %9 = load i8*, i8** %__data_.i.i.i, align 8, !tbaa !36
  call void @_ZdlPv(i8* %9) #17
  br label %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit100

_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit100: ; preds = %if.then.i.i99, %invoke.cont
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #14
  br i1 %cmp22.not, label %if.end29, label %return

lpad:                                             ; preds = %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc.exit
  %10 = landingpad { i8*, i32 }
          cleanup
  %11 = load i8, i8* %__size_.i.i.i, align 1, !tbaa !36
  %tobool.i.i.i89 = icmp slt i8 %11, 0
  br i1 %tobool.i.i.i89, label %if.then.i.i, label %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit

if.then.i.i:                                      ; preds = %lpad
  %12 = load i8*, i8** %__data_.i.i.i, align 8, !tbaa !36
  call void @_ZdlPv(i8* %12) #17
  br label %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit

_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit: ; preds = %if.then.i.i, %lpad
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #14
  resume { i8*, i32 } %10

if.end29:                                         ; preds = %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit100, %if.end15
  %sub.ptr.sub32 = sub i64 %sub.ptr.lhs.cast, %sub.ptr.lhs.cast4
  %cmp33 = icmp sgt i64 %sub.ptr.sub32, 0
  br i1 %cmp33, label %if.then34, label %if.end41

if.then34:                                        ; preds = %if.end29
  %13 = inttoptr i64 %__s.coerce to i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)***
  %vtable.i = load i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)**, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*** %13, align 8, !tbaa !16
  %vfn.i = getelementptr inbounds i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)** %vtable.i, i64 12
  %14 = load i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)*, i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)** %vfn.i, align 8
  %call.i = call i64 %14(%"class.std::__1::basic_streambuf"* nonnull dereferenceable(64) %coerce.val.ip, i8* %__op, i64 %sub.ptr.sub32)
  %cmp37.not = icmp eq i64 %call.i, %sub.ptr.sub32
  br i1 %cmp37.not, label %if.end41, label %return

if.end41:                                         ; preds = %if.then34, %if.end29
  store i64 0, i64* %__width_.i, align 8, !tbaa !35
  br label %return

return:                                           ; preds = %if.end41, %if.then34, %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit100, %if.then8, %entry
  %retval.sroa.0.2 = phi i64 [ 0, %entry ], [ %__s.coerce, %if.end41 ], [ 0, %_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev.exit100 ], [ 0, %if.then8 ], [ 0, %if.then34 ]
  ret i64 %retval.sroa.0.2
}

; Function Attrs: nounwind
declare %"class.std::__1::basic_ostream<char>::sentry"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(%"class.std::__1::basic_ostream<char>::sentry"* nonnull returned dereferenceable(16)) unnamed_addr #5

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(%"class.std::__1::ios_base"* nonnull dereferenceable(136)) local_unnamed_addr #2

declare void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #10 {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #14
  tail call void @_ZSt9terminatev() #16
  unreachable
}

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nobuiltin nofree allocsize(0)
declare nonnull i8* @_Znwm(i64) local_unnamed_addr #9

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #11

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #12

declare void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* sret(%"class.std::__1::locale") align 8, %"class.std::__1::ios_base"* nonnull dereferenceable(136)) local_unnamed_addr #2

; Function Attrs: nounwind
declare %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull returned dereferenceable(8)) unnamed_addr #5

declare %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull dereferenceable(8), %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12)) local_unnamed_addr #2

declare void @_ZNSt3__18ios_base5clearEj(%"class.std::__1::ios_base"* nonnull dereferenceable(136), i32) local_unnamed_addr #2

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8), i8 signext) local_unnamed_addr #2

; Function Attrs: nofree norecurse nounwind ssp uwtable willreturn mustprogress
define internal void @diffe_Z7productPdS_S_i(double* nocapture %x, double* nocapture %"x'", double* nocapture readnone %y, double* nocapture %"y'", double* nocapture readnone %z, double* nocapture %"z'", i32 %size) #13 {
entry:
  %"iv'ac" = alloca i64, align 8
  %".pre'de" = alloca double, align 8
  store double 0.000000e+00, double* %".pre'de", align 8
  %"mul'de" = alloca double, align 8
  store double 0.000000e+00, double* %"mul'de", align 8
  %_cache = alloca double*, align 8
  %_cache5 = alloca double*, align 8
  %"'de" = alloca double, align 8
  store double 0.000000e+00, double* %"'de", align 8
  %"'de10" = alloca double, align 8
  store double 0.000000e+00, double* %"'de10", align 8
  %cmp14 = icmp sgt i32 %size, 1
  br i1 %cmp14, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = add nsw i32 %size, -1
  %wide.trip.count = zext i32 %0 to i64
  %.pre = load double, double* %x, align 8, !tbaa !7
  %1 = add nsw i64 %wide.trip.count, -1
  %2 = add nuw nsw i64 %1, 1
  %scevgep = getelementptr double, double* %x, i64 1
  %3 = add nuw i64 %1, 1
  %mallocsize = mul nuw nsw i64 %3, 8
  %malloccall = tail call noalias nonnull i8* @malloc(i64 %mallocsize)
  %_malloccache = bitcast i8* %malloccall to double*
  store double* %_malloccache, double** %_cache, align 8, !invariant.group !37
  %mallocsize6 = mul nuw nsw i64 %3, 8
  %malloccall7 = tail call noalias nonnull i8* @malloc(i64 %mallocsize6)
  %_malloccache8 = bitcast i8* %malloccall7 to double*
  store double* %_malloccache8, double** %_cache5, align 8, !invariant.group !38
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  br label %invertfor.cond.cleanup

for.body:                                         ; preds = %for.body, %for.body.preheader
  %iv = phi i64 [ %iv.next, %for.body ], [ 0, %for.body.preheader ]
  %4 = phi double [ %.pre, %for.body.preheader ], [ %mul, %for.body ]
  %iv.next = add nuw nsw i64 %iv, 1
  %"arrayidx2'ipg" = getelementptr inbounds double, double* %"x'", i64 %iv.next
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %iv.next
  %5 = load double, double* %arrayidx2, align 8, !tbaa !7
  %mul = fmul double %4, %5
  store double %mul, double* %arrayidx2, align 8, !tbaa !7
  %6 = load double*, double** %_cache5, align 8, !dereferenceable !39, !invariant.group !38
  %7 = getelementptr inbounds double, double* %6, i64 %iv
  store double %4, double* %7, align 8, !invariant.group !40
  %8 = load double*, double** %_cache, align 8, !dereferenceable !39, !invariant.group !37
  %9 = getelementptr inbounds double, double* %8, i64 %iv
  store double %5, double* %9, align 8, !tbaa !7, !invariant.group !41
  %exitcond.not = icmp eq i64 %iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup.loopexit, label %for.body, !llvm.loop !11

invertentry:                                      ; preds = %invertfor.cond.cleanup, %invertfor.body.preheader
  ret void

invertfor.body.preheader:                         ; preds = %invertfor.body
  %11 = load double, double* %"x'", align 8
  %12 = fadd fast double %11, %10
  store double %12, double* %"x'", align 8
  %13 = load i64, i64* %"iv'ac", align 8
  %forfree = load double*, double** %_cache, align 8, !dereferenceable !39, !invariant.group !37
  %14 = bitcast double* %forfree to i8*
  tail call void @free(i8* nonnull %14)
  %15 = load i64, i64* %"iv'ac", align 8
  %forfree9 = load double*, double** %_cache5, align 8, !dereferenceable !39, !invariant.group !38
  %16 = bitcast double* %forfree9 to i8*
  tail call void @free(i8* nonnull %16)
  br label %invertentry

invertfor.cond.cleanup.loopexit:                  ; preds = %invertfor.cond.cleanup
  %_unwrap = add nsw i32 %size, -1
  %wide.trip.count_unwrap = zext i32 %_unwrap to i64
  %_unwrap1 = add nsw i64 %wide.trip.count_unwrap, -1
  br label %mergeinvertfor.body_for.cond.cleanup.loopexit

mergeinvertfor.body_for.cond.cleanup.loopexit:    ; preds = %invertfor.cond.cleanup.loopexit
  store i64 %_unwrap1, i64* %"iv'ac", align 8
  br label %invertfor.body

invertfor.cond.cleanup:                           ; preds = %for.cond.cleanup
  br i1 %cmp14, label %invertfor.cond.cleanup.loopexit, label %invertentry

invertfor.body:                                   ; preds = %incinvertfor.body, %mergeinvertfor.body_for.cond.cleanup.loopexit
  %17 = load i64, i64* %"iv'ac", align 8
  %iv.next_unwrap = add nuw nsw i64 %17, 1
  %"arrayidx2'ipg_unwrap" = getelementptr inbounds double, double* %"x'", i64 %iv.next_unwrap
  %18 = load double, double* %"arrayidx2'ipg_unwrap", align 8
  store double 0.000000e+00, double* %"arrayidx2'ipg_unwrap", align 8
  %19 = load double, double* %"mul'de", align 8
  %20 = fadd fast double %19, %18
  store double %20, double* %"mul'de", align 8
  %21 = load double, double* %"mul'de", align 8
  %22 = load i64, i64* %"iv'ac", align 8
  %_unwrap2 = add nsw i32 %size, -1
  %wide.trip.count_unwrap3 = zext i32 %_unwrap2 to i64
  %_unwrap4 = add nsw i64 %wide.trip.count_unwrap3, -1
  %23 = add nuw i64 %_unwrap4, 1
  %24 = load double*, double** %_cache, align 8, !dereferenceable !39, !invariant.group !37
  %25 = getelementptr inbounds double, double* %24, i64 %22
  %26 = load double, double* %25, align 8, !tbaa !7, !invariant.group !41
  %m0diffe = fmul fast double %21, %26
  %27 = load i64, i64* %"iv'ac", align 8
  %28 = add nuw i64 %_unwrap4, 1
  %29 = load double*, double** %_cache5, align 8, !dereferenceable !39, !invariant.group !38
  %30 = getelementptr inbounds double, double* %29, i64 %27
  %31 = load double, double* %30, align 8, !invariant.group !40
  %m1diffe = fmul fast double %21, %31
  store double 0.000000e+00, double* %"mul'de", align 8
  %35 = fadd fast double %34, %m1diffe
  %37 = load double, double* %"arrayidx2'ipg_unwrap", align 8
  %38 = fadd fast double %37, %m1diffe
  store double %38, double* %"arrayidx2'ipg_unwrap", align 8
  store double %m0diffe, double* %"mul'de", align 8
  br i1 %41, label %invertfor.body.preheader, label %incinvertfor.body

incinvertfor.body:                                ; preds = %invertfor.body
  %51 = load i64, i64* %"iv'ac", align 8
  %52 = add nsw i64 %51, -1
  store i64 %52, i64* %"iv'ac", align 8
  br label %invertfor.body
}

declare noalias i8* @malloc(i64)

declare void @free(i8*)

attributes #0 = { ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nofree allocsize(0) "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noinline noreturn nounwind }
attributes #11 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #12 = { nobuiltin nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nofree norecurse nounwind ssp uwtable willreturn mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nounwind }
attributes #15 = { builtin allocsize(0) }
attributes #16 = { noreturn nounwind }
attributes #17 = { builtin nounwind }

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
!16 = !{!17, !17, i64 0}
!17 = !{!"vtable pointer", !10, i64 0}
!18 = distinct !{!18, !12, !13}
!19 = distinct !{!19, !12, !13}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}
!22 = distinct !{!22, !12, !13}
!23 = !{!24, !25, i64 0}
!24 = !{!"_ZTSNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryE", !25, i64 0, !26, i64 8}
!25 = !{!"bool", !9, i64 0}
!26 = !{!"any pointer", !9, i64 0}
!27 = !{i8 0, i8 2}
!28 = !{!29, !26, i64 40}
!29 = !{!"_ZTSNSt3__18ios_baseE", !15, i64 8, !30, i64 16, !30, i64 24, !15, i64 32, !15, i64 36, !26, i64 40, !26, i64 48, !26, i64 56, !26, i64 64, !30, i64 72, !30, i64 80, !26, i64 88, !30, i64 96, !30, i64 104, !26, i64 112, !30, i64 120, !30, i64 128}
!30 = !{!"long", !9, i64 0}
!31 = !{!29, !15, i64 8}
!32 = !{!33, !15, i64 144}
!33 = !{!"_ZTSNSt3__19basic_iosIcNS_11char_traitsIcEEEE", !26, i64 136, !15, i64 144}
!34 = !{!29, !15, i64 32}
!35 = !{!29, !30, i64 24}
!36 = !{!9, !9, i64 0}
!37 = distinct !{}
!38 = distinct !{}
!39 = !{i64 8}
!40 = distinct !{}
!41 = distinct !{}
