declare i8* @malloc(i64)

declare void @printDouble(double)


define i32 @main(i32 %_353051, [0 x [0 x i8]*]* %_353056) {
main_350542:
    %_352134.i8 = call i8* @malloc(i64 32)
    %_352134 = bitcast i8* %_352134.i8 to [4 x double]*
    %_352138.i8 = call i8* @malloc(i64 32)
    %_352138 = bitcast i8* %_352138.i8 to [4 x double]*
    %_352142.i8 = call i8* @malloc(i64 32)
    %_352142 = bitcast i8* %_352142.i8 to [4 x double]*
    %_352251 = bitcast [4 x double]* %_352134 to [0 x double]*
    %_352258 = bitcast [4 x double]* %_352138 to [0 x double]*
    %_352145 = bitcast [4 x double]* %_352142 to [0 x double]*
    %_352226 = zext i32 0 to i64
    br label %while_head_350560

while_head_350560:
    %_352668 = phi i32 [ 0, %main_350542 ], [ %_352902, %eta_while_body_352664 ]
    %_352960 = icmp slt i32 %_352668, 4
    br i1 %_352960, label %eta_while_body_352664, label %break_350575

eta_while_body_352664:
    %_352671 = zext i32 %_352668 to i64
    %_352681 = getelementptr inbounds [0 x double], [0 x double]* %_352251, i64 0, i64 %_352671
    %_352768 = sitofp i32 %_352668 to double
    store double %_352768, double* %_352681
    %_352785 = getelementptr inbounds [0 x double], [0 x double]* %_352258, i64 0, i64 %_352671
    store double %_352768, double* %_352785
    %_352802 = getelementptr inbounds [0 x double], [0 x double]* %_352145, i64 0, i64 %_352671
    store double 0x0000000000000000, double* %_352802
    %_352902 = add nsw i32 1, %_352668
    br label %while_head_350560

break_350575:
    %_352236 = getelementptr inbounds [0 x double], [0 x double]* %_352145, i64 0, i64 %_352226
    store double 0x3ff0000000000000, double* %_352236
    %_352656.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_350607([0 x double]* %_352251, i32 2, i32 2, [0 x double]* %_352258, i32 2)
    br label %mop_vec_entry_mop_result_352268

mop_vec_entry_mop_result_352268:
    %_352585 = phi {[0 x double]*, {i32, i32}} [ %_352656.ret, %break_350575 ]
    %_352654.ret = call {[0 x double]*, {i32, i32}} @mop_transpose_impl_352281([0 x double]* %_352258)
    br label %mop_transpose_entry_mop_result_352469

mop_transpose_entry_mop_result_352469:
    %_352474 = phi {[0 x double]*, {i32, i32}} [ %_352654.ret, %mop_vec_entry_mop_result_352268 ]
    %_352476 = extractvalue {[0 x double]*, {i32, i32}} %_352474, 0
    %_352478 = extractvalue {[0 x double]*, {i32, i32}} %_352474, 1
    %_352480 = extractvalue {i32, i32} %_352478, 1
    %_352652.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_350607([0 x double]* %_352145, i32 2, i32 2, [0 x double]* %_352476, i32 %_352480)
    br label %mop_vec_entry_mop_result_352481

mop_vec_entry_mop_result_352481:
    %_352520 = phi {[0 x double]*, {i32, i32}} [ %_352652.ret, %mop_transpose_entry_mop_result_352469 ]
    %_352650.ret = call {[0 x double]*, {i32, i32}} @mop_transpose_impl_352281([0 x double]* %_352251)
    br label %mop_transpose_entry_mop_result_352485

mop_transpose_entry_mop_result_352485:
    %_352490 = phi {[0 x double]*, {i32, i32}} [ %_352650.ret, %mop_vec_entry_mop_result_352481 ]
    %_352492 = extractvalue {[0 x double]*, {i32, i32}} %_352490, 0
    %_352494 = extractvalue {[0 x double]*, {i32, i32}} %_352490, 1
    %_352496 = extractvalue {i32, i32} %_352494, 0
    %_352498 = extractvalue {i32, i32} %_352494, 1
    %_352648.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_350607([0 x double]* %_352492, i32 %_352496, i32 %_352498, [0 x double]* %_352145, i32 2)
    br label %mop_vec_entry_mop_result_352499

mop_vec_entry_mop_result_352499:
    %_352557 = phi {[0 x double]*, {i32, i32}} [ %_352648.ret, %mop_transpose_entry_mop_result_352485 ]
    %_352522 = extractvalue {[0 x double]*, {i32, i32}} %_352520, 0
    %_352532 = getelementptr inbounds [0 x double], [0 x double]* %_352522, i64 0, i32 0
    %_352540 = load double, double* %_352532
    call void @printDouble(double %_352540)
    br label %printDouble_cont_specific_352554

printDouble_cont_specific_352554:
    %_352559 = extractvalue {[0 x double]*, {i32, i32}} %_352557, 0
    %_352569 = getelementptr inbounds [0 x double], [0 x double]* %_352559, i64 0, i32 0
    %_352577 = load double, double* %_352569
    call void @printDouble(double %_352577)
    br label %printDouble_cont_specific_352582

printDouble_cont_specific_352582:
    %_352587 = extractvalue {[0 x double]*, {i32, i32}} %_352585, 0
    %_352597 = getelementptr inbounds [0 x double], [0 x double]* %_352587, i64 0, i32 0
    %_352605 = load double, double* %_352597
    call void @printDouble(double %_352605)
    br label %printDouble_cont_352621

printDouble_cont_352621:
    br label %return_352632

return_352632:
    %_354092 = phi i32 [ 0, %printDouble_cont_352621 ]
    ret i32 %_354092

}

define {[0 x double]*, {i32, i32}} @mop_vec_impl_350607([0 x double]* %_351806, i32 %_350913, i32 %_351809, [0 x double]* %_351645, i32 %_350919) {
mop_vec_impl_350607:
    %_350916 = zext i32 %_350913 to i64
    %_350922 = zext i32 %_350919 to i64
    %_350930 = mul i64 %_350916, %_350922
    %_351106 = mul nuw nsw i64 8, %_350930
    %_351107 = bitcast i64 %_351106 to i64
    %_351109.i8 = call i8* @malloc(i64 %_351107)
    %_351109 = bitcast i8* %_351109.i8 to [0 x double]*
    %_351112 = bitcast [0 x double]* %_351109 to [0 x double]*
    br label %loop_head_350616

loop_head_350616:
    %_351173 = phi i32 [ 0, %mop_vec_impl_350607 ], [ %_351187, %loop_exit_351126 ]
    %_352048 = icmp ult i32 %_351173, %_350913
    br i1 %_352048, label %loop_351122, label %loop_exit_350619

loop_351122:
    %_351693 = mul i32 %_350919, %_351173
    br label %loop_head_351123

loop_head_351123:
    %_351979 = phi i32 [ 0, %loop_351122 ], [ %_352023, %loop_351975 ]
    %_352033 = icmp ult i32 %_351979, %_350919
    br i1 %_352033, label %loop_351975, label %loop_exit_351124

loop_exit_351124:
    %_351817 = mul i32 %_351173, %_351809
    br label %loop_head_351125

loop_head_351125:
    %_351196 = phi i32 [ 0, %loop_exit_351124 ], [ %_351210, %loop_exit_351192 ]
    %_351967 = icmp ult i32 %_351196, %_351809
    br i1 %_351967, label %loop_351190, label %loop_exit_351126

loop_351190:
    %_351654 = mul i32 %_350919, %_351196
    %_351825 = add i32 %_351196, %_351817
    %_351835 = getelementptr inbounds [0 x double], [0 x double]* %_351806, i64 0, i32 %_351825
    br label %loop_head_351191

loop_head_351191:
    %_351657 = phi i32 [ 0, %loop_351190 ], [ %_351896, %loop_351213 ]
    %_351951 = icmp ult i32 %_351657, %_350919
    br i1 %_351951, label %loop_351213, label %loop_exit_351192

loop_351213:
    %_351665 = add i32 %_351654, %_351657
    %_351675 = getelementptr inbounds [0 x double], [0 x double]* %_351645, i64 0, i32 %_351665
    %_351683 = load double, double* %_351675
    %_351701 = add i32 %_351657, %_351693
    %_351711 = getelementptr inbounds [0 x double], [0 x double]* %_351112, i64 0, i32 %_351701
    %_351843 = load double, double* %_351835
    %_351854 = fmul double %_351683, %_351843
    %_351864 = load double, double* %_351711
    %_351875 = fadd double %_351854, %_351864
    store double %_351875, double* %_351711
    %_351896 = add i32 1, %_351657
    br label %loop_head_351191

loop_exit_351192:
    %_351210 = add i32 1, %_351196
    br label %loop_head_351125

loop_exit_351126:
    %_351187 = add i32 1, %_351173
    br label %loop_head_350616

loop_351975:
    %_351987 = add i32 %_351693, %_351979
    %_351997 = getelementptr inbounds [0 x double], [0 x double]* %_351112, i64 0, i32 %_351987
    store double 0x0000000000000000, double* %_351997
    %_352023 = add i32 1, %_351979
    br label %loop_head_351123

loop_exit_350619:
    %_351114.0 = insertvalue {[0 x double]*, {i32, i32}} undef, [0 x double]* %_351112, 0
    %_351113.0 = insertvalue {i32, i32} undef, i32 %_350913, 0
    %_351113.1 = insertvalue {i32, i32} %_351113.0, i32 %_350919, 1
    %_351114.1 = insertvalue {[0 x double]*, {i32, i32}} %_351114.0, {i32, i32} %_351113.1, 1
    br label %_350621

_350621:
    %_355036 = phi {[0 x double]*, {i32, i32}} [ %_351114.1, %loop_exit_350619 ]
    ret {[0 x double]*, {i32, i32}} %_355036

}

define {[0 x double]*, {i32, i32}} @mop_transpose_impl_352281([0 x double]* %_352363) {
mop_transpose_impl_352281:
    %_352294.i8 = call i8* @malloc(i64 32)
    %_352294 = bitcast i8* %_352294.i8 to [4 x double]*
    %_352297 = bitcast [4 x double]* %_352294 to [0 x double]*
    br label %loop_head_352282

loop_head_352282:
    %_352308 = phi i32 [ 0, %mop_transpose_impl_352281 ], [ %_352322, %loop_exit_352304 ]
    %_352451 = icmp ult i32 %_352308, 2
    br i1 %_352451, label %loop_352302, label %loop_exit_352283

loop_exit_352283:
    %_352299.0 = insertvalue {[0 x double]*, {i32, i32}} undef, [0 x double]* %_352297, 0
    %_352299.1 = insertvalue {[0 x double]*, {i32, i32}} %_352299.0, {i32, i32} {i32 2, i32 2}, 1
    br label %_352284

_352284:
    %_355376 = phi {[0 x double]*, {i32, i32}} [ %_352299.1, %loop_exit_352283 ]
    ret {[0 x double]*, {i32, i32}} %_355376

loop_352302:
    %_352340 = mul i32 2, %_352308
    br label %loop_head_352303

loop_head_352303:
    %_352343 = phi i32 [ 0, %loop_352302 ], [ %_352426, %loop_352325 ]
    %_352436 = icmp ult i32 %_352343, 2
    br i1 %_352436, label %loop_352325, label %loop_exit_352304

loop_352325:
    %_352351 = add i32 %_352340, %_352343
    %_352361 = getelementptr inbounds [0 x double], [0 x double]* %_352297, i64 0, i32 %_352351
    %_352377 = mul i32 2, %_352343
    %_352385 = add i32 %_352308, %_352377
    %_352395 = getelementptr inbounds [0 x double], [0 x double]* %_352363, i64 0, i32 %_352385
    %_352403 = load double, double* %_352395
    store double %_352403, double* %_352361
    %_352426 = add i32 1, %_352343
    br label %loop_head_352303

loop_exit_352304:
    %_352322 = add i32 1, %_352308
    br label %loop_head_352282

}


