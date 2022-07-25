declare i8* @malloc(i64)

declare void @printString([0 x i8]*)
declare void @printDouble(double)
declare void @printLine([0 x i8]*)

@_275416 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_275453 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_275544 = global {i8, i8} {i8 124, i8 0}
@_275565 = global {i8, i8} {i8 124, i8 0}

define i32 @main() {
main_274180:
    %_275213.i8 = call i8* @malloc(i64 32)
    %_275213 = bitcast i8* %_275213.i8 to [4 x double]*
    %_275217.i8 = call i8* @malloc(i64 32)
    %_275217 = bitcast i8* %_275217.i8 to [4 x double]*
    %_275307 = bitcast [4 x double]* %_275213 to [0 x double]*
    %_275420 = bitcast {i8, i8, i8, i8, i8}* @_275416 to [0 x i8]*
    %_275454 = bitcast {i8, i8, i8, i8, i8}* @_275453 to [0 x i8]*
    %_275547 = bitcast {i8, i8}* @_275544 to [0 x i8]*
    %_275566 = bitcast {i8, i8}* @_275565 to [0 x i8]*
    call void @matrix_init_274220([0 x double]* %_275307, double 0x3ff0000000000000)
    br label %matrix_init_cont_275324

matrix_init_cont_275324:
    %_275328 = bitcast [4 x double]* %_275217 to [0 x double]*
    call void @matrix_init_274220([0 x double]* %_275328, double 0x4000000000000000)
    br label %matrix_init_cont_275338

matrix_init_cont_275338:
    br label %loop_head_275347

loop_head_275347:
    %_275828 = phi i64 [ 0, %matrix_init_cont_275338 ], [ %_276057, %loop_275824 ]
    %_276109 = icmp ult i64 %_275828, 4
    br i1 %_276109, label %loop_275824, label %mop_asub_entry_mop_result_275356

loop_275824:
    %_275838 = getelementptr inbounds [0 x double], [0 x double]* %_275307, i64 0, i64 %_275828
    %_275846 = load double, double* %_275838
    %_275858 = getelementptr inbounds [0 x double], [0 x double]* %_275328, i64 0, i64 %_275828
    %_275866 = load double, double* %_275858
    %_275959 = fsub double %_275846, %_275866
    store double %_275959, double* %_275838
    %_276057 = add i64 1, %_275828
    br label %loop_head_275347

mop_asub_entry_mop_result_275356:
    call void @printLine([0 x i8]* %_275420)
    br label %printLine_cont_275429

printLine_cont_275429:
    br label %range_275436

range_275436:
    br label %while_head_275440

while_head_275440:
    %_275573 = phi i64 [ 0, %range_275436 ], [ %_275587, %eta_while_head_275569 ]
    %_275810 = icmp ult i64 %_275573, 2
    br i1 %_275810, label %eta_while_body_275491, label %break_275447

break_275447:
    call void @printLine([0 x i8]* %_275454)
    br label %print_matrix_cont_275466

print_matrix_cont_275466:
    br label %return_275477

return_275477:
    %_276847 = phi i32 [ 0, %print_matrix_cont_275466 ]
    ret i32 %_276847

eta_while_body_275491:
    br label %lambda_275496

lambda_275496:
    %_275705 = phi i64 [ %_275573, %eta_while_body_275491 ]
    call void @printString([0 x i8]* %_275547)
    br label %printString_cont_275553

printString_cont_275553:
    br label %range_275554

range_275554:
    %_275719 = mul i64 2, %_275705
    br label %while_head_275555

while_head_275555:
    %_275756 = phi i64 [ 0, %range_275554 ], [ %_275770, %eta_while_head_275752 ]
    %_275788 = icmp ult i64 %_275756, 2
    br i1 %_275788, label %eta_while_body_275592, label %break_275559

break_275559:
    call void @printLine([0 x i8]* %_275566)
    br label %eta_while_head_275569

eta_while_head_275569:
    %_275587 = add i64 1, %_275573
    br label %while_head_275440

eta_while_body_275592:
    br label %lambda_275596

lambda_275596:
    %_275721 = phi i64 [ %_275756, %eta_while_body_275592 ]
    %_275729 = add i64 %_275719, %_275721
    %_275739 = getelementptr inbounds [0 x double], [0 x double]* %_275307, i64 0, i64 %_275729
    %_275747 = load double, double* %_275739
    call void @printDouble(double %_275747)
    br label %eta_while_head_275752

eta_while_head_275752:
    %_275770 = add i64 1, %_275756
    br label %while_head_275555

}

define void @matrix_init_274220([0 x double]* %_274762, double %_274902) {
matrix_init_274220:
    br label %while_head_274239

while_head_274239:
    %_274397 = phi i64 [ 0, %matrix_init_274220 ], [ %_274411, %break_274285 ]
    %_275105 = icmp ult i64 %_274397, 2
    br i1 %_275105, label %eta_while_body_274266, label %_274247

eta_while_body_274266:
    %_274782 = mul i64 2, %_274397
    br label %while_head_274270

while_head_274270:
    %_274785 = phi i64 [ 0, %eta_while_body_274266 ], [ %_275028, %eta_while_body_274417 ]
    %_275086 = icmp ult i64 %_274785, 2
    br i1 %_275086, label %eta_while_body_274417, label %break_274285

eta_while_body_274417:
    %_274793 = add i64 %_274782, %_274785
    %_274803 = getelementptr inbounds [0 x double], [0 x double]* %_274762, i64 0, i64 %_274793
    %_274994 = uitofp i64 %_274793 to double
    %_275003 = fadd double %_274902, %_274994
    store double %_275003, double* %_274803
    %_275028 = add i64 1, %_274785
    br label %while_head_274270

break_274285:
    %_274411 = add i64 1, %_274397
    br label %while_head_274239

_274247:
    ret void

}


