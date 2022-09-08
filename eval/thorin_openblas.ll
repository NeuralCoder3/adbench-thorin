declare i8* @malloc(i64)

declare void @printDouble(double)
declare void @dgemm(i8, i32, i32, i32, [0 x double]*, [0 x double]*, [0 x double]*)


define i32 @main(i32 %_164060, [0 x [0 x i8]*]* %_164065) {
main_161937:
    %_162941.i8 = call i8* @malloc(i64 32)
    %_162941 = bitcast i8* %_162941.i8 to [4 x double]*
    %_162945.i8 = call i8* @malloc(i64 32)
    %_162945 = bitcast i8* %_162945.i8 to [4 x double]*
    %_162949.i8 = call i8* @malloc(i64 32)
    %_162949 = bitcast i8* %_162949.i8 to [4 x double]*
    %_163062 = bitcast [4 x double]* %_162941 to [0 x double]*
    %_163069 = bitcast [4 x double]* %_162945 to [0 x double]*
    %_162952 = bitcast [4 x double]* %_162949 to [0 x double]*
    %_163034 = zext i32 0 to i64
    br label %while_head_161955

while_head_161955:
    %_163672 = phi i32 [ 0, %main_161937 ], [ %_163911, %eta_while_body_163668 ]
    %_163969 = icmp slt i32 %_163672, 4
    br i1 %_163969, label %eta_while_body_163668, label %break_161970

eta_while_body_163668:
    %_163675 = zext i32 %_163672 to i64
    %_163685 = getelementptr inbounds [0 x double], [0 x double]* %_163062, i64 0, i64 %_163675
    %_163772 = sitofp i32 %_163672 to double
    store double %_163772, double* %_163685
    %_163789 = getelementptr inbounds [0 x double], [0 x double]* %_163069, i64 0, i64 %_163675
    store double %_163772, double* %_163789
    %_163806 = getelementptr inbounds [0 x double], [0 x double]* %_162952, i64 0, i64 %_163675
    store double 0x0000000000000000, double* %_163806
    %_163911 = add nsw i32 1, %_163672
    br label %while_head_161955

break_161970:
    %_163044 = getelementptr inbounds [0 x double], [0 x double]* %_162952, i64 0, i64 %_163034
    store double 0x3ff0000000000000, double* %_163044
    %_163663.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_162002([0 x double]* %_163062, i32 2, i32 2, [0 x double]* %_163069, i32 2)
    br label %mop_vec_entry_mop_result_163079

mop_vec_entry_mop_result_163079:
    %_163592 = phi {[0 x double]*, {i32, i32}} [ %_163663.ret, %break_161970 ]
    %_163661.ret = call {[0 x double]*, {i32, i32}} @mop_transpose_impl_163092([0 x double]* %_163069)
    br label %mop_transpose_entry_mop_result_163476

mop_transpose_entry_mop_result_163476:
    %_163481 = phi {[0 x double]*, {i32, i32}} [ %_163661.ret, %mop_vec_entry_mop_result_163079 ]
    %_163483 = extractvalue {[0 x double]*, {i32, i32}} %_163481, 0
    %_163485 = extractvalue {[0 x double]*, {i32, i32}} %_163481, 1
    %_163487 = extractvalue {i32, i32} %_163485, 1
    %_163659.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_162002([0 x double]* %_162952, i32 2, i32 2, [0 x double]* %_163483, i32 %_163487)
    br label %mop_vec_entry_mop_result_163488

mop_vec_entry_mop_result_163488:
    %_163527 = phi {[0 x double]*, {i32, i32}} [ %_163659.ret, %mop_transpose_entry_mop_result_163476 ]
    %_163657.ret = call {[0 x double]*, {i32, i32}} @mop_transpose_impl_163092([0 x double]* %_163062)
    br label %mop_transpose_entry_mop_result_163492

mop_transpose_entry_mop_result_163492:
    %_163497 = phi {[0 x double]*, {i32, i32}} [ %_163657.ret, %mop_vec_entry_mop_result_163488 ]
    %_163499 = extractvalue {[0 x double]*, {i32, i32}} %_163497, 0
    %_163501 = extractvalue {[0 x double]*, {i32, i32}} %_163497, 1
    %_163503 = extractvalue {i32, i32} %_163501, 0
    %_163505 = extractvalue {i32, i32} %_163501, 1
    %_163655.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_162002([0 x double]* %_163499, i32 %_163503, i32 %_163505, [0 x double]* %_162952, i32 2)
    br label %mop_vec_entry_mop_result_163506

mop_vec_entry_mop_result_163506:
    %_163564 = phi {[0 x double]*, {i32, i32}} [ %_163655.ret, %mop_transpose_entry_mop_result_163492 ]
    %_163529 = extractvalue {[0 x double]*, {i32, i32}} %_163527, 0
    %_163539 = getelementptr inbounds [0 x double], [0 x double]* %_163529, i64 0, i32 0
    %_163547 = load double, double* %_163539
    call void @printDouble(double %_163547)
    br label %printDouble_cont_specific_163561

printDouble_cont_specific_163561:
    %_163566 = extractvalue {[0 x double]*, {i32, i32}} %_163564, 0
    %_163576 = getelementptr inbounds [0 x double], [0 x double]* %_163566, i64 0, i32 0
    %_163584 = load double, double* %_163576
    call void @printDouble(double %_163584)
    br label %printDouble_cont_specific_163589

printDouble_cont_specific_163589:
    %_163594 = extractvalue {[0 x double]*, {i32, i32}} %_163592, 0
    %_163604 = getelementptr inbounds [0 x double], [0 x double]* %_163594, i64 0, i32 0
    %_163612 = load double, double* %_163604
    call void @printDouble(double %_163612)
    br label %printDouble_cont_163628

printDouble_cont_163628:
    br label %return_163639

return_163639:
    %_165101 = phi i32 [ 0, %printDouble_cont_163628 ]
    ret i32 %_165101

}

define {[0 x double]*, {i32, i32}} @mop_transpose_impl_163092([0 x double]* %_163325) {
mop_transpose_impl_163092:
    %_163115.i8 = call i8* @malloc(i64 32)
    %_163115 = bitcast i8* %_163115.i8 to [4 x double]*
    %_163118 = bitcast [4 x double]* %_163115 to [0 x double]*
    br label %loop_head_163101

loop_head_163101:
    %_163174 = phi i32 [ 0, %mop_transpose_impl_163092 ], [ %_163188, %loop_exit_163130 ]
    %_163458 = icmp ult i32 %_163174, 2
    br i1 %_163458, label %loop_163128, label %loop_exit_163104

loop_163128:
    %_163210 = mul i32 2, %_163174
    br label %loop_head_163129

loop_head_163129:
    %_163213 = phi i32 [ 0, %loop_163128 ], [ %_163388, %loop_163191 ]
    %_163443 = icmp ult i32 %_163213, 2
    br i1 %_163443, label %loop_163191, label %loop_exit_163130

loop_exit_163130:
    %_163188 = add i32 1, %_163174
    br label %loop_head_163101

loop_163191:
    %_163221 = add i32 %_163210, %_163213
    %_163231 = getelementptr inbounds [0 x double], [0 x double]* %_163118, i64 0, i32 %_163221
    %_163339 = mul i32 2, %_163213
    %_163347 = add i32 %_163174, %_163339
    %_163357 = getelementptr inbounds [0 x double], [0 x double]* %_163325, i64 0, i32 %_163347
    %_163365 = load double, double* %_163357
    store double %_163365, double* %_163231
    %_163388 = add i32 1, %_163213
    br label %loop_head_163129

loop_exit_163104:
    %_163120.0 = insertvalue {[0 x double]*, {i32, i32}} undef, [0 x double]* %_163118, 0
    %_163120.1 = insertvalue {[0 x double]*, {i32, i32}} %_163120.0, {i32, i32} {i32 2, i32 2}, 1
    br label %_163105

_163105:
    %_165664 = phi {[0 x double]*, {i32, i32}} [ %_163120.1, %loop_exit_163104 ]
    ret {[0 x double]*, {i32, i32}} %_165664

}

define {[0 x double]*, {i32, i32}} @mop_vec_impl_162002([0 x double]* %_162032, i32 %_162023, i32 %_162029, [0 x double]* %_162035, i32 %_162026) {
mop_vec_impl_162002:
    %_162319 = zext i32 %_162023 to i64
    %_162322 = zext i32 %_162026 to i64
    %_162330 = mul i64 %_162319, %_162322
    %_162503 = mul nuw nsw i64 8, %_162330
    %_162504 = bitcast i64 %_162503 to i64
    %_162506.i8 = call i8* @malloc(i64 %_162504)
    %_162506 = bitcast i8* %_162506.i8 to [0 x double]*
    %_162509 = bitcast [0 x double]* %_162506 to [0 x double]*
    call void @dgemm(i8 0, i32 %_162023, i32 %_162026, i32 %_162029, [0 x double]* %_162032, [0 x double]* %_162035, [0 x double]* %_162509)
    br label %result_mop_vec_162518

result_mop_vec_162518:
    %_162527.0 = insertvalue {[0 x double]*, {i32, i32}} undef, [0 x double]* %_162509, 0
    %_162526.0 = insertvalue {i32, i32} undef, i32 %_162023, 0
    %_162526.1 = insertvalue {i32, i32} %_162526.0, i32 %_162026, 1
    %_162527.1 = insertvalue {[0 x double]*, {i32, i32}} %_162527.0, {i32, i32} %_162526.1, 1
    br label %_162519

_162519:
    %_166006 = phi {[0 x double]*, {i32, i32}} [ %_162527.1, %result_mop_vec_162518 ]
    ret {[0 x double]*, {i32, i32}} %_166006

}


