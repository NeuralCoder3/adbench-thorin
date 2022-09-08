declare i8* @malloc(i64)

declare void @printDouble(double)
declare void @printLine([0 x i8]*)
declare void @end()
declare void @start()
declare double @exp(double)
declare void @printString([0 x i8]*)

@_201764 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_201794 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_201865 = global {i8, i8} {i8 124, i8 0}
@_201886 = global {i8, i8} {i8 124, i8 0}

define i32 @main(i32 %_205979, [0 x [0 x i8]*]* %_205984) {
main_200795:
    %_201483.i8 = call i8* @malloc(i64 96)
    %_201483 = bitcast i8* %_201483.i8 to [12 x double]*
    %_201488.i8 = call i8* @malloc(i64 160)
    %_201488 = bitcast i8* %_201488.i8 to [20 x double]*
    %_201492.i8 = call i8* @malloc(i64 120)
    %_201492 = bitcast i8* %_201492.i8 to [15 x double]*
    %_201592 = zext i32 0 to i64
    %_201768 = bitcast {i8, i8, i8, i8, i8}* @_201764 to [0 x i8]*
    %_201795 = bitcast {i8, i8, i8, i8, i8}* @_201794 to [0 x i8]*
    br label %range_200811

range_200811:
    %_204044 = phi i32 [ 12, %main_200795 ]
    %_202410 = bitcast [12 x double]* %_201483 to [0 x double]*
    br label %while_head_200826

while_head_200826:
    %_203965 = phi i32 [ 0, %range_200811 ], [ %_203979, %eta_while_head_203961 ]
    %_204051 = icmp slt i32 %_203965, %_204044
    br i1 %_204051, label %while_body_203956, label %break_200835

break_200835:
    br label %range_200836

range_200836:
    %_203932 = phi i32 [ 20, %break_200835 ]
    %_202457 = bitcast [20 x double]* %_201488 to [0 x double]*
    br label %while_head_200837

while_head_200837:
    %_203679 = phi i32 [ 0, %range_200836 ], [ %_203693, %eta_while_head_203675 ]
    %_203939 = icmp slt i32 %_203679, %_203932
    br i1 %_203939, label %while_body_203670, label %break_200841

break_200841:
    br label %range_200842

range_200842:
    %_203646 = phi i32 [ 15, %break_200841 ]
    %_201495 = bitcast [15 x double]* %_201492 to [0 x double]*
    br label %while_head_200843

while_head_200843:
    %_203597 = phi i32 [ 0, %range_200842 ], [ %_203611, %eta_while_head_203593 ]
    %_203653 = icmp slt i32 %_203597, %_203646
    br i1 %_203653, label %while_body_203587, label %break_200847

while_body_203587:
    br label %lambda_203592

lambda_203592:
    %_203618 = phi i32 [ %_203597, %while_body_203587 ]
    %_203621 = zext i32 %_203618 to i64
    %_203631 = getelementptr inbounds [0 x double], [0 x double]* %_201495, i64 0, i64 %_203621
    store double 0x0000000000000000, double* %_203631
    br label %eta_while_head_203593

eta_while_head_203593:
    %_203611 = add nsw i32 1, %_203597
    br label %while_head_200843

break_200847:
    %_201602 = getelementptr inbounds [0 x double], [0 x double]* %_201495, i64 0, i64 %_201592
    store double 0x3ff0000000000000, double* %_201602
    call void @start()
    br label %start_cont_201623

start_cont_201623:
    br label %matrix_unary_entry_201633

matrix_unary_entry_201633:
    %_203458.i8 = call i8* @malloc(i64 96)
    %_203458 = bitcast i8* %_203458.i8 to [12 x double]*
    %_203466.i8 = call i8* @malloc(i64 96)
    %_203466 = bitcast i8* %_203466.i8 to [12 x double]*
    %_203461 = bitcast [12 x double]* %_203458 to [0 x double]*
    %_203469 = bitcast [12 x double]* %_203466 to [0 x double]*
    br label %loop_head_201642

loop_head_201642:
    %_203478 = phi i32 [ 0, %matrix_unary_entry_201633 ], [ %_203563, %exp_diff_impl_cont_203501 ]
    %_203575 = icmp ult i32 %_203478, 12
    br i1 %_203575, label %loop_203474, label %loop_exit_201645

loop_203474:
    %_203488 = getelementptr inbounds [0 x double], [0 x double]* %_202410, i64 0, i32 %_203478
    %_203496 = load double, double* %_203488
    %_203567.ret = call double @exp(double %_203496)
    br label %exp_diff_impl_cont_203501

exp_diff_impl_cont_203501:
    %_203516 = phi double [ %_203567.ret, %loop_203474 ]
    %_203514 = getelementptr inbounds [0 x double], [0 x double]* %_203461, i64 0, i32 %_203478
    store double %_203516, double* %_203514
    %_203533 = getelementptr inbounds [0 x double], [0 x double]* %_203469, i64 0, i32 %_203478
    %_203542 = fmul double 0x3ff0000000000000, %_203516
    store double %_203542, double* %_203533
    %_203563 = add i32 1, %_203478
    br label %loop_head_201642

loop_exit_201645:
    %_203462.0 = insertvalue {{i32, i32}, [0 x double]*} undef, {i32, i32} {i32 3, i32 4}, 0
    %_203462.1 = insertvalue {{i32, i32}, [0 x double]*} %_203462.0, [0 x double]* %_203461, 1
    %_203471.0 = insertvalue {{{i32, i32}, [0 x double]*}, {{i32, i32}, [0 x double]*}} undef, {{i32, i32}, [0 x double]*} %_203462.1, 0
    %_203470.0 = insertvalue {{i32, i32}, [0 x double]*} undef, {i32, i32} {i32 3, i32 4}, 0
    %_203470.1 = insertvalue {{i32, i32}, [0 x double]*} %_203470.0, [0 x double]* %_203469, 1
    %_203471.1 = insertvalue {{{i32, i32}, [0 x double]*}, {{i32, i32}, [0 x double]*}} %_203471.0, {{i32, i32}, [0 x double]*} %_203470.1, 1
    br label %mat_mul_res_201667

mat_mul_res_201667:
    %_202701 = phi {{{i32, i32}, [0 x double]*}, {{i32, i32}, [0 x double]*}} [ %_203471.1, %loop_exit_201645 ]
    br label %matrix_unary_entry_201668

matrix_unary_entry_201668:
    %_203233.i8 = call i8* @malloc(i64 96)
    %_203233 = bitcast i8* %_203233.i8 to [12 x double]*
    %_203241.i8 = call i8* @malloc(i64 96)
    %_203241 = bitcast i8* %_203241.i8 to [12 x double]*
    %_203236 = bitcast [12 x double]* %_203233 to [0 x double]*
    %_203244 = bitcast [12 x double]* %_203241 to [0 x double]*
    br label %loop_head_201669

loop_head_201669:
    %_203263 = phi i32 [ 0, %matrix_unary_entry_201668 ], [ %_203427, %exp_diff_impl_cont_203288 ]
    %_203444 = icmp ult i32 %_203263, 12
    br i1 %_203444, label %loop_203249, label %loop_exit_201670

loop_203249:
    %_203273 = getelementptr inbounds [0 x double], [0 x double]* %_202410, i64 0, i32 %_203263
    %_203281 = load double, double* %_203273
    %_203431.ret = call double @exp(double %_203281)
    br label %exp_diff_impl_cont_203288

exp_diff_impl_cont_203288:
    %_203303 = phi double [ %_203431.ret, %loop_203249 ]
    %_203301 = getelementptr inbounds [0 x double], [0 x double]* %_203236, i64 0, i32 %_203263
    store double %_203303, double* %_203301
    %_203320 = getelementptr inbounds [0 x double], [0 x double]* %_203244, i64 0, i32 %_203263
    %_203406 = fmul double 0x3ff0000000000000, %_203303
    store double %_203406, double* %_203320
    %_203427 = add i32 1, %_203263
    br label %loop_head_201669

loop_exit_201670:
    %_203237.0 = insertvalue {{i32, i32}, [0 x double]*} undef, {i32, i32} {i32 3, i32 4}, 0
    %_203237.1 = insertvalue {{i32, i32}, [0 x double]*} %_203237.0, [0 x double]* %_203236, 1
    %_203246.0 = insertvalue {{{i32, i32}, [0 x double]*}, {{i32, i32}, [0 x double]*}} undef, {{i32, i32}, [0 x double]*} %_203237.1, 0
    %_203245.0 = insertvalue {{i32, i32}, [0 x double]*} undef, {i32, i32} {i32 3, i32 4}, 0
    %_203245.1 = insertvalue {{i32, i32}, [0 x double]*} %_203245.0, [0 x double]* %_203244, 1
    %_203246.1 = insertvalue {{{i32, i32}, [0 x double]*}, {{i32, i32}, [0 x double]*}} %_203246.0, {{i32, i32}, [0 x double]*} %_203245.1, 1
    br label %mat_mul_res_201671

mat_mul_res_201671:
    %_202462 = phi {{{i32, i32}, [0 x double]*}, {{i32, i32}, [0 x double]*}} [ %_203246.1, %loop_exit_201670 ]
    %_202703 = extractvalue {{{i32, i32}, [0 x double]*}, {{i32, i32}, [0 x double]*}} %_202701, 0
    %_202705 = extractvalue {{i32, i32}, [0 x double]*} %_202703, 1
    %_202719 = getelementptr inbounds [0 x double], [0 x double]* %_202705, i64 0, i32 2
    %_202727 = load double, double* %_202719
    %_202464 = extractvalue {{{i32, i32}, [0 x double]*}, {{i32, i32}, [0 x double]*}} %_202462, 1
    %_202466 = extractvalue {{i32, i32}, [0 x double]*} %_202464, 0
    %_202468 = extractvalue {i32, i32} %_202466, 0
    %_202470 = extractvalue {i32, i32} %_202466, 1
    %_203215 = mul i32 %_202468, %_202470
    %_202617 = zext i32 %_202468 to i64
    %_202620 = zext i32 %_202470 to i64
    %_202628 = mul i64 %_202617, %_202620
    %_202778 = mul nuw nsw i64 8, %_202628
    %_202779 = bitcast i64 %_202778 to i64
    %_202781.i8 = call i8* @malloc(i64 %_202779)
    %_202781 = bitcast i8* %_202781.i8 to [0 x double]*
    %_202784 = bitcast [0 x double]* %_202781 to [0 x double]*
    %_202988 = extractvalue {{i32, i32}, [0 x double]*} %_202464, 1
    br label %loop_head_201672

loop_head_201672:
    %_202991 = phi i32 [ 0, %mat_mul_res_201671 ], [ %_203192, %loop_202985 ]
    %_203222 = icmp ult i32 %_202991, %_203215
    br i1 %_203222, label %loop_202985, label %loop_exit_201673

loop_exit_201673:
    call void @end()
    br label %end_cont_specific_201692

end_cont_specific_201692:
    call void @print_matrix_specific_dense_201705(i32 3, i32 4, [0 x double]* %_202410)
    br label %print_matrix_cont_specific_202419

print_matrix_cont_specific_202419:
    call void @print_matrix_specific_dense_201705(i32 4, i32 5, [0 x double]* %_202457)
    br label %print_matrix_cont_specific_202458

print_matrix_cont_specific_202458:
    call void @print_matrix_specific_dense_201705(i32 %_202468, i32 %_202470, [0 x double]* %_202784)
    br label %print_matrix_cont_specific_202785

print_matrix_cont_specific_202785:
    call void @printLine([0 x i8]* %_201768)
    br label %printLine_cont_specific_202787

printLine_cont_specific_202787:
    call void @range_202792(i32 4)
    br label %break_specific_202930

break_specific_202930:
    call void @printLine([0 x i8]* %_201795)
    br label %print_matrix_cont_specific_202932

print_matrix_cont_specific_202932:
    call void @printDouble(double %_202727)
    br label %printDouble_cont_202947

printDouble_cont_202947:
    br label %return_202958

return_202958:
    %_206094 = phi i32 [ 0, %printDouble_cont_202947 ]
    ret i32 %_206094

loop_202985:
    %_203001 = getelementptr inbounds [0 x double], [0 x double]* %_202988, i64 0, i32 %_202991
    %_203009 = load double, double* %_203001
    %_203021 = getelementptr inbounds [0 x double], [0 x double]* %_202784, i64 0, i32 %_202991
    %_203158 = icmp eq i32 2, %_202991
    %_203160 = select i1 %_203158, double 0x3ff0000000000000, double 0x0000000000000000
    %_203171 = fmul double %_203160, %_203009
    store double %_203171, double* %_203021
    %_203192 = add i32 1, %_202991
    br label %loop_head_201672

while_body_203670:
    br label %lambda_203674

lambda_203674:
    %_203700 = phi i32 [ %_203679, %while_body_203670 ]
    %_203703 = zext i32 %_203700 to i64
    %_203713 = getelementptr inbounds [0 x double], [0 x double]* %_202457, i64 0, i64 %_203703
    %_203891 = sitofp i32 %_203700 to double
    %_203904 = fsub double %_203891, 0x4000000000000000
    %_203917 = fdiv double %_203904, 0x4024000000000000
    store double %_203917, double* %_203713
    br label %eta_while_head_203675

eta_while_head_203675:
    %_203693 = add nsw i32 1, %_203679
    br label %while_head_200837

while_body_203956:
    br label %lambda_203960

lambda_203960:
    %_203986 = phi i32 [ %_203965, %while_body_203956 ]
    %_203989 = zext i32 %_203986 to i64
    %_203999 = getelementptr inbounds [0 x double], [0 x double]* %_202410, i64 0, i64 %_203989
    %_204013 = sitofp i32 %_203986 to double
    %_204021 = fsub double %_204013, 0x4000000000000000
    %_204029 = fdiv double %_204021, 0x4024000000000000
    store double %_204029, double* %_203999
    br label %eta_while_head_203961

eta_while_head_203961:
    %_203979 = add nsw i32 1, %_203965
    br label %while_head_200826

}

define void @range_202792(i32 %_202913) {
range_202792:
    br label %while_head_202793

while_head_202793:
    %_202890 = phi i32 [ 0, %range_202792 ], [ %_202906, %eta_while_head_202891 ]
    %_202920 = icmp slt i32 %_202890, %_202913
    br i1 %_202920, label %while_body_202800, label %_202794

_202794:
    ret void

while_body_202800:
    call void @lambda_specific_202801(i32 %_202890)
    br label %eta_while_head_202891

eta_while_head_202891:
    %_202906 = add nsw i32 1, %_202890
    br label %while_head_202793

}

define void @print_matrix_specific_dense_201705(i32 %_202364, i32 %_202201, [0 x double]* %_202116) {
print_matrix_specific_dense_201705:
    %_201768 = bitcast {i8, i8, i8, i8, i8}* @_201764 to [0 x i8]*
    %_201868 = bitcast {i8, i8}* @_201865 to [0 x i8]*
    %_201887 = bitcast {i8, i8}* @_201886 to [0 x i8]*
    %_201795 = bitcast {i8, i8, i8, i8, i8}* @_201794 to [0 x i8]*
    call void @printLine([0 x i8]* %_201768)
    br label %printLine_cont_specific_201777

printLine_cont_specific_201777:
    br label %range_201778

range_201778:
    %_202345 = phi i32 [ %_202364, %printLine_cont_specific_201777 ]
    br label %while_head_201779

while_head_201779:
    %_201983 = phi i32 [ 0, %range_201778 ], [ %_201997, %eta_while_head_201890 ]
    %_202352 = icmp slt i32 %_201983, %_202345
    br i1 %_202352, label %while_body_201808, label %break_specific_201788

while_body_201808:
    br label %lambda_specific_201814

lambda_specific_201814:
    %_202203 = phi i32 [ %_201983, %while_body_201808 ]
    call void @printString([0 x i8]* %_201868)
    br label %printString_cont_specific_201877

printString_cont_specific_201877:
    br label %range_201878

range_201878:
    %_202318 = phi i32 [ %_202201, %printString_cont_specific_201877 ]
    %_202211 = mul i32 %_202201, %_202203
    br label %while_head_201879

while_head_201879:
    %_202248 = phi i32 [ 0, %range_201878 ], [ %_202262, %eta_while_head_202244 ]
    %_202325 = icmp slt i32 %_202248, %_202318
    br i1 %_202325, label %while_body_202002, label %break_specific_201880

while_body_202002:
    br label %lambda_specific_202003

lambda_specific_202003:
    %_202213 = phi i32 [ %_202248, %while_body_202002 ]
    %_202221 = add i32 %_202211, %_202213
    %_202231 = getelementptr inbounds [0 x double], [0 x double]* %_202116, i64 0, i32 %_202221
    %_202239 = load double, double* %_202231
    call void @printDouble(double %_202239)
    br label %eta_while_head_202244

eta_while_head_202244:
    %_202262 = add nsw i32 1, %_202248
    br label %while_head_201879

break_specific_201880:
    call void @printLine([0 x i8]* %_201887)
    br label %eta_while_head_201890

eta_while_head_201890:
    %_201997 = add nsw i32 1, %_201983
    br label %while_head_201779

break_specific_201788:
    call void @printLine([0 x i8]* %_201795)
    br label %_201796

_201796:
    ret void

}

define void @lambda_specific_202801(i32 %_205672) {
lambda_specific_202801:
    %_201868 = bitcast {i8, i8}* @_201865 to [0 x i8]*
    %_201887 = bitcast {i8, i8}* @_201886 to [0 x i8]*
    call void @printString([0 x i8]* %_201868)
    br label %printString_cont_specific_202805

printString_cont_specific_202805:
    call void @range_202806(i32 5)
    br label %break_specific_202874

break_specific_202874:
    call void @printLine([0 x i8]* %_201887)
    br label %_202876

_202876:
    ret void

}

define void @range_202806(i32 %_202857) {
range_202806:
    br label %while_head_202807

while_head_202807:
    %_202834 = phi i32 [ 0, %range_202806 ], [ %_202850, %eta_while_head_202835 ]
    %_202864 = icmp slt i32 %_202834, %_202857
    br i1 %_202864, label %while_body_202814, label %_202808

while_body_202814:
    call void @lambda_specific_202815(i32 %_202834)
    br label %eta_while_head_202835

eta_while_head_202835:
    %_202850 = add nsw i32 1, %_202834
    br label %while_head_202807

_202808:
    ret void

}

define void @lambda_specific_202815(i32 %_205457) {
lambda_specific_202815:
    call void @printDouble(double 0x0000000000000000)
    br label %_202824

_202824:
    ret void

}


