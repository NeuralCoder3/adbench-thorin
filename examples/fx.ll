; ModuleID = 'product.ll'
source_filename = "product.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

%"class.std::__1::basic_ostream" = type { i32 (...)**, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32 }>
%"class.std::__1::ios_base" = type { i32 (...)**, i32, i64, i64, i32, i32, i8*, i8*, void (i32, %"class.std::__1::ios_base"*, i32)**, i32*, i64, i64, i64*, i64, i64, i8**, i64, i64 }

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
define dso_local void @_Z7productPdS_S_i(double* nocapture readonly %x, double* nocapture readonly %y, double* nocapture %z, i32 %size) local_unnamed_addr #2 {
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

; Function Attrs: nounwind ssp uwtable
define dso_local i64 @_Z22timeSinceEpochMillisecv() local_unnamed_addr #3 {
entry:
  %call = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #9
  %div.i.i = sdiv i64 %call, 1000
  ret i64 %div.i.i
}

; Function Attrs: nounwind
declare i64 @_ZNSt3__16chrono12system_clock3nowEv() local_unnamed_addr #4

; Function Attrs: nounwind ssp uwtable
define dso_local void @_Z5startv() local_unnamed_addr #3 {
entry:
  %call.i = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #9
  %div.i.i.i = sdiv i64 %call.i, 1000
  %conv = trunc i64 %div.i.i.i to i32
  store i32 %conv, i32* @_ZL10start_time, align 4, !tbaa !14
  ret void
}

; Function Attrs: ssp uwtable
define dso_local void @_Z3endv() local_unnamed_addr #5 {
entry:
  %call.i = tail call i64 @_ZNSt3__16chrono12system_clock3nowEv() #9
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
  %call = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #10
  %0 = bitcast i8* %call to double*
  %call3 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #10
  %1 = bitcast i8* %call3 to double*
  %call6 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #10
  %2 = bitcast i8* %call6 to double*
  %call9 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #10
  %3 = bitcast i8* %call9 to double*
  %call12 = tail call noalias nonnull dereferenceable(32) i8* @_Znam(i64 32) #10
  %4 = bitcast i8* %call12 to double*
  br label %for.body

for.body.i:                                       ; preds = %for.body, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body ]
  %arrayidx.i = getelementptr inbounds double, double* %0, i64 %indvars.iv.i
  %5 = load double, double* %arrayidx.i, align 8, !tbaa !7
  %arrayidx2.i = getelementptr inbounds double, double* %1, i64 %indvars.iv.i
  %6 = load double, double* %arrayidx2.i, align 8, !tbaa !7
  %mul3.i = fmul double %5, %6
  %arrayidx5.i = getelementptr inbounds double, double* %2, i64 %indvars.iv.i
  %7 = load double, double* %arrayidx5.i, align 8, !tbaa !7
  %add.i = fadd double %7, %mul3.i
  store double %add.i, double* %arrayidx5.i, align 8, !tbaa !7
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 4
  br i1 %exitcond.not.i, label %for.body31, label %for.body.i, !llvm.loop !11

for.body:                                         ; preds = %for.body, %entry
  %i.0128 = phi i64 [ 0, %entry ], [ %inc, %for.body ]
  %call.i117 = tail call i32 @rand()
  %conv.i118 = sitofp i32 %call.i117 to double
  %div.i119 = fdiv double %conv.i118, 0x41DFFFFFFFC00000
  %mul.i120 = fmul double %div.i119, 2.000000e-01
  %add.i121 = fadd double %mul.i120, -1.000000e-01
  %arrayidx = getelementptr inbounds double, double* %0, i64 %i.0128
  store double %add.i121, double* %arrayidx, align 8, !tbaa !7
  %call.i = tail call i32 @rand()
  %conv.i = sitofp i32 %call.i to double
  %div.i = fdiv double %conv.i, 0x41DFFFFFFFC00000
  %mul.i = fmul double %div.i, 2.000000e-01
  %add.i116 = fadd double %mul.i, -1.000000e-01
  %arrayidx20 = getelementptr inbounds double, double* %1, i64 %i.0128
  store double %add.i116, double* %arrayidx20, align 8, !tbaa !7
  %arrayidx21 = getelementptr inbounds double, double* %2, i64 %i.0128
  store double 0.000000e+00, double* %arrayidx21, align 8, !tbaa !7
  %arrayidx22 = getelementptr inbounds double, double* %3, i64 %i.0128
  store double 0.000000e+00, double* %arrayidx22, align 8, !tbaa !7
  %arrayidx23 = getelementptr inbounds double, double* %4, i64 %i.0128
  store double 0.000000e+00, double* %arrayidx23, align 8, !tbaa !7
  %inc = add nuw nsw i64 %i.0128, 1
  %exitcond135.not = icmp eq i64 %inc, 4
  br i1 %exitcond135.not, label %for.body.i, label %for.body, !llvm.loop !16

for.body31:                                       ; preds = %for.body31, %for.body.i
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.body31 ], [ 0, %for.body.i ]
  %result.0126 = phi double [ %add, %for.body31 ], [ 0.000000e+00, %for.body.i ]
  %arrayidx32 = getelementptr inbounds double, double* %2, i64 %indvars.iv132
  %8 = load double, double* %arrayidx32, align 8, !tbaa !7
  %add = fadd double %result.0126, %8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond134.not = icmp eq i64 %indvars.iv.next133, 4
  br i1 %exitcond134.not, label %for.body41, label %for.body31, !llvm.loop !17

for.body41:                                       ; preds = %for.body41, %for.body31
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %for.body41 ], [ 0, %for.body31 ]
  %result.1124 = phi double [ %add44, %for.body41 ], [ %add, %for.body31 ]
  %arrayidx43 = getelementptr inbounds double, double* %3, i64 %indvars.iv129
  %9 = load double, double* %arrayidx43, align 8, !tbaa !7
  %add44 = fadd double %result.1124, %9
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond131.not = icmp eq i64 %indvars.iv.next130, 4
  br i1 %exitcond131.not, label %for.body53, label %for.body41, !llvm.loop !18

for.cond.cleanup52:                               ; preds = %for.body53
  %conv60 = fptosi double %add56 to i32
  ret i32 %conv60

for.body53:                                       ; preds = %for.body53, %for.body41
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body53 ], [ 0, %for.body41 ]
  %result.2122 = phi double [ %add56, %for.body53 ], [ %add44, %for.body41 ]
  %arrayidx55 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %10 = load double, double* %arrayidx55, align 8, !tbaa !7
  %add56 = fadd double %result.2122, %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 4
  br i1 %exitcond.not, label %for.cond.cleanup52, label %for.body53, !llvm.loop !19
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare nonnull i8* @_Znam(i64) local_unnamed_addr #8

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* nonnull dereferenceable(8)) local_unnamed_addr #1

attributes #0 = { ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree norecurse nounwind ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { ssp uwtable "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse ssp uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nofree allocsize(0) "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }
attributes #10 = { builtin allocsize(0) }

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
