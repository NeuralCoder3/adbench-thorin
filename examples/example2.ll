declare i8* @malloc(i64)

declare void @printDouble(double)
declare void @end()
declare void @start()
declare void @free(i8*)
declare void @dgemm(i8, i32, i32, i32, [0 x double]*, [0 x double]*, [0 x double]*)


define i32 @main(i32 %_193334, [0 x [0 x i8]*]* %_193339) {
main_190357:
    call void @range_190378(i32 1, i32 40)
    br label %break_193203

break_193203:
    call void @printDouble(double undef)
    br label %printDouble_cont_193232

printDouble_cont_193232:
    br label %return_193240

return_193240:
    %_193507 = phi i32 [ 0, %printDouble_cont_193232 ]
    ret i32 %_193507

}

define void @range_190378(i32 %_193190, i32 %_193173) {
range_190378:
    br label %while_head_190393

while_head_190393:
    %_193149 = phi i32 [ %_193190, %range_190378 ], [ %_193165, %eta_while_head_193150 ]
    %_193180 = icmp slt i32 %_193149, %_193173
    br i1 %_193180, label %while_body_190411, label %_190395

_190395:
    ret void

while_body_190411:
    call void @lambda_190427(i32 %_193149)
    br label %eta_while_head_193150

eta_while_head_193150:
    %_193165 = add nsw i32 1, %_193149
    br label %while_head_190393

}

define void @lambda_190427(i32 %_191086) {
lambda_190427:
    %_192217 = alloca double
    %_192188 = alloca double
    %_192127 = alloca double
    %_191094 = mul i32 %_191086, %_191086
    %_191110 = mul i32 2500, %_191094
    %_191113 = zext i32 %_191110 to i64
    %_191332 = mul nuw nsw i64 8, %_191113
    %_191333 = bitcast i64 %_191332 to i64
    %_191335.i8 = call i8* @malloc(i64 %_191333)
    %_191335 = bitcast i8* %_191335.i8 to [0 x double]*
    %_191339.i8 = call i8* @malloc(i64 %_191333)
    %_191339 = bitcast i8* %_191339.i8 to [0 x double]*
    %_191343.i8 = call i8* @malloc(i64 %_191333)
    %_191343 = bitcast i8* %_191343.i8 to [0 x double]*
    %_191382 = zext i32 0 to i64
    br label %range_190432

range_190432:
    %_193139 = phi i32 [ 0, %lambda_190427 ]
    %_193124 = phi i32 [ %_191110, %lambda_190427 ]
    %_191697 = bitcast [0 x double]* %_191335 to [0 x double]*
    %_191755 = bitcast [0 x double]* %_191339 to [0 x double]*
    %_191346 = bitcast [0 x double]* %_191343 to [0 x double]*
    br label %while_head_190433

while_head_190433:
    %_192906 = phi i32 [ %_193139, %range_190432 ], [ %_192920, %eta_while_head_192900 ]
    %_193131 = icmp slt i32 %_192906, %_193124
    br i1 %_193131, label %while_body_192893, label %break_190439

while_body_192893:
    br label %lambda_192897

lambda_192897:
    %_192927 = phi i32 [ %_192906, %while_body_192893 ]
    %_192930 = zext i32 %_192927 to i64
    %_192940 = getelementptr inbounds [0 x double], [0 x double]* %_191697, i64 0, i64 %_192930
    %_193027 = sitofp i32 %_192927 to double
    store double %_193027, double* %_192940
    %_193044 = getelementptr inbounds [0 x double], [0 x double]* %_191755, i64 0, i64 %_192930
    store double %_193027, double* %_193044
    %_193061 = getelementptr inbounds [0 x double], [0 x double]* %_191346, i64 0, i64 %_192930
    store double 0x0000000000000000, double* %_193061
    br label %eta_while_head_192900

eta_while_head_192900:
    %_192920 = add nsw i32 1, %_192906
    br label %while_head_190433

break_190439:
    %_191392 = getelementptr inbounds [0 x double], [0 x double]* %_191346, i64 0, i64 %_191382
    store double 0x3ff0000000000000, double* %_191392
    call void @start()
    br label %start_cont_191410

start_cont_191410:
    %_191752 = mul nsw i32 50, %_191086
    %_192890.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_191430([0 x double]* %_191697, i32 %_191752, i32 %_191752, [0 x double]* %_191755, i32 %_191752)
    br label %mop_vec_entry_mop_result_191764

mop_vec_entry_mop_result_191764:
    %_192091 = phi {[0 x double]*, {i32, i32}} [ %_192890.ret, %start_cont_191410 ]
    br label %mop_transpose_impl_191777

mop_transpose_impl_191777:
    %_192780 = phi [0 x double]* [ %_191755, %mop_vec_entry_mop_result_191764 ]
    %_192250 = zext i32 %_191752 to i64
    %_192258 = mul i64 %_192250, %_192250
    %_192345 = mul nuw nsw i64 8, %_192258
    %_192346 = bitcast i64 %_192345 to i64
    %_192702.i8 = call i8* @malloc(i64 %_192346)
    %_192702 = bitcast i8* %_192702.i8 to [0 x double]*
    %_192705 = bitcast [0 x double]* %_192702 to [0 x double]*
    br label %loop_head_191786

loop_head_191786:
    %_192715 = phi i32 [ 0, %mop_transpose_impl_191777 ], [ %_192729, %loop_exit_192711 ]
    %_192878 = icmp ult i32 %_192715, %_191752
    br i1 %_192878, label %loop_192709, label %loop_exit_191789

loop_exit_191789:
    %_192706.0 = insertvalue {[0 x double]*, {i32, i32}} undef, [0 x double]* %_192705, 0
    %_192352.0 = insertvalue {i32, i32} undef, i32 %_191752, 0
    %_192352.1 = insertvalue {i32, i32} %_192352.0, i32 %_191752, 1
    %_192706.1 = insertvalue {[0 x double]*, {i32, i32}} %_192706.0, {i32, i32} %_192352.1, 1
    br label %mop_transpose_entry_mop_result_191798

mop_transpose_entry_mop_result_191798:
    %_191803 = phi {[0 x double]*, {i32, i32}} [ %_192706.1, %loop_exit_191789 ]
    %_191805 = extractvalue {[0 x double]*, {i32, i32}} %_191803, 0
    %_191807 = extractvalue {[0 x double]*, {i32, i32}} %_191803, 1
    %_191809 = extractvalue {i32, i32} %_191807, 1
    %_192696.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_191430([0 x double]* %_191346, i32 %_191752, i32 %_191752, [0 x double]* %_191805, i32 %_191809)
    br label %mop_vec_entry_mop_result_191810

mop_vec_entry_mop_result_191810:
    %_192042 = phi {[0 x double]*, {i32, i32}} [ %_192696.ret, %mop_transpose_entry_mop_result_191798 ]
    br label %mop_transpose_impl_191811

mop_transpose_impl_191811:
    %_192541 = phi [0 x double]* [ %_191697, %mop_vec_entry_mop_result_191810 ]
    %_192348.i8 = call i8* @malloc(i64 %_192346)
    %_192348 = bitcast i8* %_192348.i8 to [0 x double]*
    %_192351 = bitcast [0 x double]* %_192348 to [0 x double]*
    br label %loop_head_191812

loop_head_191812:
    %_192399 = phi i32 [ 0, %mop_transpose_impl_191811 ], [ %_192413, %loop_exit_192360 ]
    %_192684 = icmp ult i32 %_192399, %_191752
    br i1 %_192684, label %loop_192358, label %loop_exit_191813

loop_exit_191813:
    %_192353.0 = insertvalue {[0 x double]*, {i32, i32}} undef, [0 x double]* %_192351, 0
    %_192353.1 = insertvalue {[0 x double]*, {i32, i32}} %_192353.0, {i32, i32} %_192352.1, 1
    br label %mop_transpose_entry_mop_result_191814

mop_transpose_entry_mop_result_191814:
    %_191819 = phi {[0 x double]*, {i32, i32}} [ %_192353.1, %loop_exit_191813 ]
    %_191821 = extractvalue {[0 x double]*, {i32, i32}} %_191819, 0
    %_191823 = extractvalue {[0 x double]*, {i32, i32}} %_191819, 1
    %_191825 = extractvalue {i32, i32} %_191823, 0
    %_191827 = extractvalue {i32, i32} %_191823, 1
    %_192246.ret = call {[0 x double]*, {i32, i32}} @mop_vec_impl_191430([0 x double]* %_191821, i32 %_191825, i32 %_191827, [0 x double]* %_191346, i32 %_191752)
    br label %mop_vec_entry_mop_result_191828

mop_vec_entry_mop_result_191828:
    %_192066 = phi {[0 x double]*, {i32, i32}} [ %_192246.ret, %mop_transpose_entry_mop_result_191814 ]
    call void @end()
    br label %end_cont_specific_191849

end_cont_specific_191849:
    %_192044 = extractvalue {[0 x double]*, {i32, i32}} %_192042, 0
    %_192054 = getelementptr inbounds [0 x double], [0 x double]* %_192044, i64 0, i32 0
    %_192062 = load double, double* %_192054
    %_192068 = extractvalue {[0 x double]*, {i32, i32}} %_192066, 0
    %_192078 = getelementptr inbounds [0 x double], [0 x double]* %_192068, i64 0, i32 0
    %_192086 = load double, double* %_192078
    %_192093 = extractvalue {[0 x double]*, {i32, i32}} %_192091, 0
    %_192103 = getelementptr inbounds [0 x double], [0 x double]* %_192093, i64 0, i32 0
    %_192111 = load double, double* %_192103
    %_192121 = load double, double* %_192103
    store double %_192121, double* %_192127
    %_192171 = bitcast double* %_192127 to i8*
    call void @free(i8* %_192171)
    br label %free_cont_specific_192174

free_cont_specific_192174:
    %_192183 = load double, double* %_192054
    store double %_192183, double* %_192188
    %_192202 = bitcast double* %_192188 to i8*
    call void @free(i8* %_192202)
    br label %free_cont_specific_192203

free_cont_specific_192203:
    %_192212 = load double, double* %_192078
    store double %_192212, double* %_192217
    %_192231 = bitcast double* %_192217 to i8*
    call void @free(i8* %_192231)
    br label %_192232

_192232:
    ret void

loop_192358:
    %_192502 = mul i32 %_191086, %_192399
    %_192518 = mul i32 50, %_192502
    br label %loop_head_192359

loop_head_192359:
    %_192521 = phi i32 [ 0, %loop_192358 ], [ %_192614, %loop_192416 ]
    %_192669 = icmp ult i32 %_192521, %_191752
    br i1 %_192669, label %loop_192416, label %loop_exit_192360

loop_exit_192360:
    %_192413 = add i32 1, %_192399
    br label %loop_head_191812

loop_192416:
    %_192529 = add i32 %_192518, %_192521
    %_192539 = getelementptr inbounds [0 x double], [0 x double]* %_192351, i64 0, i32 %_192529
    %_192549 = mul i32 %_191086, %_192521
    %_192565 = mul i32 50, %_192549
    %_192573 = add i32 %_192399, %_192565
    %_192583 = getelementptr inbounds [0 x double], [0 x double]* %_192541, i64 0, i32 %_192573
    %_192591 = load double, double* %_192583
    store double %_192591, double* %_192539
    %_192614 = add i32 1, %_192521
    br label %loop_head_192359

loop_192709:
    %_192741 = mul i32 %_191086, %_192715
    %_192757 = mul i32 50, %_192741
    br label %loop_head_192710

loop_head_192710:
    %_192760 = phi i32 [ 0, %loop_192709 ], [ %_192853, %loop_192732 ]
    %_192863 = icmp ult i32 %_192760, %_191752
    br i1 %_192863, label %loop_192732, label %loop_exit_192711

loop_exit_192711:
    %_192729 = add i32 1, %_192715
    br label %loop_head_191786

loop_192732:
    %_192768 = add i32 %_192757, %_192760
    %_192778 = getelementptr inbounds [0 x double], [0 x double]* %_192705, i64 0, i32 %_192768
    %_192788 = mul i32 %_191086, %_192760
    %_192804 = mul i32 50, %_192788
    %_192812 = add i32 %_192715, %_192804
    %_192822 = getelementptr inbounds [0 x double], [0 x double]* %_192780, i64 0, i32 %_192812
    %_192830 = load double, double* %_192822
    store double %_192830, double* %_192778
    %_192853 = add i32 1, %_192760
    br label %loop_head_192710

}

define {[0 x double]*, {i32, i32}} @mop_vec_impl_191430([0 x double]* %_191456, i32 %_191447, i32 %_191453, [0 x double]* %_191459, i32 %_191450) {
mop_vec_impl_191430:
    %_191570 = zext i32 %_191447 to i64
    %_191573 = zext i32 %_191450 to i64
    %_191581 = mul i64 %_191570, %_191573
    %_191665 = mul nuw nsw i64 8, %_191581
    %_191666 = bitcast i64 %_191665 to i64
    %_191668.i8 = call i8* @malloc(i64 %_191666)
    %_191668 = bitcast i8* %_191668.i8 to [0 x double]*
    %_191671 = bitcast [0 x double]* %_191668 to [0 x double]*
    call void @dgemm(i8 0, i32 %_191447, i32 %_191450, i32 %_191453, [0 x double]* %_191456, [0 x double]* %_191459, [0 x double]* %_191671)
    br label %result_mop_vec_191680

result_mop_vec_191680:
    %_191689.0 = insertvalue {[0 x double]*, {i32, i32}} undef, [0 x double]* %_191671, 0
    %_191688.0 = insertvalue {i32, i32} undef, i32 %_191447, 0
    %_191688.1 = insertvalue {i32, i32} %_191688.0, i32 %_191450, 1
    %_191689.1 = insertvalue {[0 x double]*, {i32, i32}} %_191689.0, {i32, i32} %_191688.1, 1
    br label %_191681

_191681:
    %_196520 = phi {[0 x double]*, {i32, i32}} [ %_191689.1, %result_mop_vec_191680 ]
    ret {[0 x double]*, {i32, i32}} %_196520

}


