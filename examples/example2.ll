declare i8* @malloc(i64)

declare void @printDouble(double)
declare double @exp(double)


define i32 @main() {
main_89091:
    %_89541.i8 = call i8* @malloc(i64 24)
    %_89541 = bitcast i8* %_89541.i8 to [3 x double]*
    %_89545.i8 = call i8* @malloc(i64 24)
    %_89545 = bitcast i8* %_89545.i8 to [3 x double]*
    %_89549.i8 = call i8* @malloc(i64 24)
    %_89549 = bitcast i8* %_89549.i8 to [3 x double]*
    %_89906 = bitcast [3 x double]* %_89541 to [0 x double]*
    %_90008 = zext i32 0 to i64
    %_90018 = getelementptr inbounds [0 x double], [0 x double]* %_89906, i64 0, i64 %_90008
    store double 0x4000000000000000, double* %_90018
    %_90039 = zext i32 1 to i64
    %_90049 = getelementptr inbounds [0 x double], [0 x double]* %_89906, i64 0, i64 %_90039
    store double 0x0000000000000000, double* %_90049
    %_90071 = zext i32 2 to i64
    %_90081 = getelementptr inbounds [0 x double], [0 x double]* %_89906, i64 0, i64 %_90071
    store double 0x0000000000000000, double* %_90081
    %_90094 = bitcast [3 x double]* %_89545 to [0 x double]*
    %_90104 = getelementptr inbounds [0 x double], [0 x double]* %_90094, i64 0, i64 %_90008
    store double 0x3ff0000000000000, double* %_90104
    %_90128 = getelementptr inbounds [0 x double], [0 x double]* %_90094, i64 0, i64 %_90039
    store double 0x0000000000000000, double* %_90128
    %_90148 = getelementptr inbounds [0 x double], [0 x double]* %_90094, i64 0, i64 %_90071
    store double 0x0000000000000000, double* %_90148
    %_90161 = bitcast [3 x double]* %_89549 to [0 x double]*
    %_90171 = getelementptr inbounds [0 x double], [0 x double]* %_90161, i64 0, i64 %_90008
    store double 0x4008000000000000, double* %_90171
    %_90184.i8 = call i8* @malloc(i64 24)
    %_90184 = bitcast i8* %_90184.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_90184
    %_90199.i8 = call i8* @malloc(i64 24)
    %_90199 = bitcast i8* %_90199.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_90199
    %_90212.i8 = call i8* @malloc(i64 24)
    %_90212 = bitcast i8* %_90212.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_90212
    %_90453 = getelementptr inbounds [0 x double], [0 x double]* %_89906, i64 0, i64 %_90008
    %_90461 = load double, double* %_90453
    %_90472 = getelementptr inbounds [0 x double], [0 x double]* %_90094, i64 0, i64 %_90008
    %_90480 = load double, double* %_90472
    %_90582 = fmul double %_90461, %_90480
    %_92256.ret = call double @exp(double %_90582)
    br label %exp_diff_impl_cont_90589

exp_diff_impl_cont_90589:
    %_90649 = phi double [ %_92256.ret, %main_89091 ]
    %_90660 = getelementptr inbounds [0 x double], [0 x double]* %_90161, i64 0, i64 %_90008
    %_90668 = load double, double* %_90660
    %_91669.i8 = call i8* @malloc(i64 24)
    %_91669 = bitcast i8* %_91669.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_91669
    %_91681 = bitcast [3 x double]* %_91669 to [0 x double]*
    %_91691 = getelementptr inbounds [0 x double], [0 x double]* %_91681, i64 0, i64 %_90008
    %_91700 = fmul double 0x3ff0000000000000, %_90668
    %_91711 = fmul double %_90649, %_91700
    %_91722 = fmul double %_90480, %_91711
    store double %_91722, double* %_91691
    %_91731.i8 = call i8* @malloc(i64 24)
    %_91731 = bitcast i8* %_91731.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_91731
    %_91744.i8 = call i8* @malloc(i64 24)
    %_91744 = bitcast i8* %_91744.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_91744
    %_91757.i8 = call i8* @malloc(i64 24)
    %_91757 = bitcast i8* %_91757.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_91757
    %_91769 = bitcast [3 x double]* %_91757 to [0 x double]*
    %_91779 = getelementptr inbounds [0 x double], [0 x double]* %_91769, i64 0, i64 %_90008
    %_91790 = fmul double %_90461, %_91711
    store double %_91790, double* %_91779
    %_91799.i8 = call i8* @malloc(i64 24)
    %_91799 = bitcast i8* %_91799.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_91799
    %_91812.i8 = call i8* @malloc(i64 24)
    %_91812 = bitcast i8* %_91812.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_91812
    %_91825.i8 = call i8* @malloc(i64 24)
    %_91825 = bitcast i8* %_91825.i8 to [3 x double]*
    %_91828 = bitcast [3 x double]* %_91825 to [0 x double]*
    br label %add_loop_head_90604

add_loop_head_90604:
    %_92152 = phi i64 [ 0, %exp_diff_impl_cont_90589 ], [ %_92236, %add_loop_body_92148 ]
    %_92246 = icmp ult i64 %_92152, 3
    br i1 %_92246, label %add_loop_body_92148, label %add_loop_exit_90609

add_loop_exit_90609:
    %_91543.i8 = call i8* @malloc(i64 24)
    %_91543 = bitcast i8* %_91543.i8 to [3 x double]*
    %_91546 = bitcast [3 x double]* %_91543 to [0 x double]*
    br label %add_loop_head_90610

add_loop_head_90610:
    %_92045 = phi i64 [ 0, %add_loop_exit_90609 ], [ %_92129, %add_loop_body_92041 ]
    %_92139 = icmp ult i64 %_92045, 3
    br i1 %_92139, label %add_loop_body_92041, label %add_loop_exit_90611

add_loop_body_92041:
    %a_p_92055 = getelementptr inbounds [3 x double], [3 x double]* %_91731, i64 0, i64 %_92045
    %_92063 = load double, double* %a_p_92055
    %b_p_92075 = getelementptr inbounds [0 x double], [0 x double]* %_91769, i64 0, i64 %_92045
    %_92083 = load double, double* %b_p_92075
    %c_p_92095 = getelementptr inbounds [0 x double], [0 x double]* %_91546, i64 0, i64 %_92045
    %_92108 = fadd double %_92063, %_92083
    store double %_92108, double* %c_p_92095
    %_92129 = add i64 1, %_92045
    br label %add_loop_head_90610

add_loop_exit_90611:
    %_91289.i8 = call i8* @malloc(i64 24)
    %_91289 = bitcast i8* %_91289.i8 to [3 x double]*
    %_91292 = bitcast [3 x double]* %_91289 to [0 x double]*
    br label %add_loop_head_90612

add_loop_head_90612:
    %_91938 = phi i64 [ 0, %add_loop_exit_90611 ], [ %_92022, %add_loop_body_91934 ]
    %_92032 = icmp ult i64 %_91938, 3
    br i1 %_92032, label %add_loop_body_91934, label %add_loop_exit_90613

add_loop_exit_90613:
    %_90878.i8 = call i8* @malloc(i64 24)
    %_90878 = bitcast i8* %_90878.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_90878
    %_90890 = bitcast [3 x double]* %_90878 to [0 x double]*
    %_90900 = getelementptr inbounds [0 x double], [0 x double]* %_90890, i64 0, i64 %_90008
    %_90909 = fmul double 0x3ff0000000000000, %_90649
    store double %_90909, double* %_90900
    %_90918.i8 = call i8* @malloc(i64 24)
    %_90918 = bitcast i8* %_90918.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_90918
    %_90931.i8 = call i8* @malloc(i64 24)
    %_90931 = bitcast i8* %_90931.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_90931
    %_90944.i8 = call i8* @malloc(i64 24)
    %_90944 = bitcast i8* %_90944.i8 to [3 x double]*
    %_90947 = bitcast [3 x double]* %_90944 to [0 x double]*
    br label %add_loop_head_90614

add_loop_head_90614:
    %_91831 = phi i64 [ 0, %add_loop_exit_90613 ], [ %_91915, %add_loop_body_91664 ]
    %_91925 = icmp ult i64 %_91831, 3
    br i1 %_91925, label %add_loop_body_91664, label %add_loop_exit_90615

add_loop_body_91664:
    %a_p_91841 = getelementptr inbounds [0 x double], [0 x double]* %_91828, i64 0, i64 %_91831
    %_91849 = load double, double* %a_p_91841
    %b_p_91861 = getelementptr inbounds [3 x double], [3 x double]* %_90918, i64 0, i64 %_91831
    %_91869 = load double, double* %b_p_91861
    %c_p_91881 = getelementptr inbounds [0 x double], [0 x double]* %_90947, i64 0, i64 %_91831
    %_91894 = fadd double %_91849, %_91869
    store double %_91894, double* %c_p_91881
    %_91915 = add i64 1, %_91831
    br label %add_loop_head_90614

add_loop_exit_90615:
    %_91046.i8 = call i8* @malloc(i64 24)
    %_91046 = bitcast i8* %_91046.i8 to [3 x double]*
    %_91049 = bitcast [3 x double]* %_91046 to [0 x double]*
    br label %add_loop_head_90616

add_loop_head_90616:
    %_91549 = phi i64 [ 0, %add_loop_exit_90615 ], [ %_91645, %add_loop_body_91539 ]
    %_91655 = icmp ult i64 %_91549, 3
    br i1 %_91655, label %add_loop_body_91539, label %add_loop_exit_90617

add_loop_body_91539:
    %a_p_91559 = getelementptr inbounds [0 x double], [0 x double]* %_91546, i64 0, i64 %_91549
    %_91567 = load double, double* %a_p_91559
    %b_p_91591 = getelementptr inbounds [3 x double], [3 x double]* %_90931, i64 0, i64 %_91549
    %_91599 = load double, double* %b_p_91591
    %c_p_91611 = getelementptr inbounds [0 x double], [0 x double]* %_91049, i64 0, i64 %_91549
    %_91624 = fadd double %_91567, %_91599
    store double %_91624, double* %c_p_91611
    %_91645 = add i64 1, %_91549
    br label %add_loop_head_90616

add_loop_exit_90617:
    %_91148.i8 = call i8* @malloc(i64 24)
    %_91148 = bitcast i8* %_91148.i8 to [3 x double]*
    %_91151 = bitcast [3 x double]* %_91148 to [0 x double]*
    br label %add_loop_head_90618

add_loop_head_90618:
    %_91295 = phi i64 [ 0, %add_loop_exit_90617 ], [ %_91473, %add_loop_body_91280 ]
    %_91529 = icmp ult i64 %_91295, 3
    br i1 %_91529, label %add_loop_body_91280, label %add_loop_exit_90619

add_loop_exit_90619:
    %_90679 = fmul double %_90649, %_90668
    call void @printDouble(double %_90679)
    br label %printDouble_cont_90680

printDouble_cont_90680:
    %_90957 = getelementptr inbounds [0 x double], [0 x double]* %_90947, i64 0, i64 %_90008
    %_90965 = load double, double* %_90957
    call void @printDouble(double %_90965)
    br label %printDouble_cont_90970

printDouble_cont_90970:
    %_90989 = getelementptr inbounds [0 x double], [0 x double]* %_90947, i64 0, i64 %_90039
    %_90997 = load double, double* %_90989
    call void @printDouble(double %_90997)
    br label %printDouble_cont_91002

printDouble_cont_91002:
    %_91021 = getelementptr inbounds [0 x double], [0 x double]* %_90947, i64 0, i64 %_90071
    %_91029 = load double, double* %_91021
    call void @printDouble(double %_91029)
    br label %printDouble_cont_91034

printDouble_cont_91034:
    %_91059 = getelementptr inbounds [0 x double], [0 x double]* %_91049, i64 0, i64 %_90008
    %_91067 = load double, double* %_91059
    call void @printDouble(double %_91067)
    br label %printDouble_cont_91072

printDouble_cont_91072:
    %_91091 = getelementptr inbounds [0 x double], [0 x double]* %_91049, i64 0, i64 %_90039
    %_91099 = load double, double* %_91091
    call void @printDouble(double %_91099)
    br label %printDouble_cont_91104

printDouble_cont_91104:
    %_91123 = getelementptr inbounds [0 x double], [0 x double]* %_91049, i64 0, i64 %_90071
    %_91131 = load double, double* %_91123
    call void @printDouble(double %_91131)
    br label %printDouble_cont_91136

printDouble_cont_91136:
    %_91161 = getelementptr inbounds [0 x double], [0 x double]* %_91151, i64 0, i64 %_90008
    %_91169 = load double, double* %_91161
    call void @printDouble(double %_91169)
    br label %printDouble_cont_91174

printDouble_cont_91174:
    %_91193 = getelementptr inbounds [0 x double], [0 x double]* %_91151, i64 0, i64 %_90039
    %_91201 = load double, double* %_91193
    call void @printDouble(double %_91201)
    br label %printDouble_cont_91206

printDouble_cont_91206:
    %_91225 = getelementptr inbounds [0 x double], [0 x double]* %_91151, i64 0, i64 %_90071
    %_91233 = load double, double* %_91225
    call void @printDouble(double %_91233)
    br label %printDouble_cont_91238

printDouble_cont_91238:
    br label %return_91249

return_91249:
    %_94730 = phi i32 [ 0, %printDouble_cont_91238 ]
    ret i32 %_94730

add_loop_body_91280:
    %a_p_91305 = getelementptr inbounds [0 x double], [0 x double]* %_91292, i64 0, i64 %_91295
    %_91313 = load double, double* %a_p_91305
    %b_p_91327 = getelementptr inbounds [0 x double], [0 x double]* %_90890, i64 0, i64 %_91295
    %_91335 = load double, double* %b_p_91327
    %c_p_91349 = getelementptr inbounds [0 x double], [0 x double]* %_91151, i64 0, i64 %_91295
    %_91366 = fadd double %_91313, %_91335
    store double %_91366, double* %c_p_91349
    %_91473 = add i64 1, %_91295
    br label %add_loop_head_90618

add_loop_body_91934:
    %a_p_91948 = getelementptr inbounds [3 x double], [3 x double]* %_91744, i64 0, i64 %_91938
    %_91956 = load double, double* %a_p_91948
    %b_p_91968 = getelementptr inbounds [3 x double], [3 x double]* %_91812, i64 0, i64 %_91938
    %_91976 = load double, double* %b_p_91968
    %c_p_91988 = getelementptr inbounds [0 x double], [0 x double]* %_91292, i64 0, i64 %_91938
    %_92001 = fadd double %_91956, %_91976
    store double %_92001, double* %c_p_91988
    %_92022 = add i64 1, %_91938
    br label %add_loop_head_90612

add_loop_body_92148:
    %a_p_92162 = getelementptr inbounds [0 x double], [0 x double]* %_91681, i64 0, i64 %_92152
    %_92170 = load double, double* %a_p_92162
    %b_p_92182 = getelementptr inbounds [3 x double], [3 x double]* %_91799, i64 0, i64 %_92152
    %_92190 = load double, double* %b_p_92182
    %c_p_92202 = getelementptr inbounds [0 x double], [0 x double]* %_91828, i64 0, i64 %_92152
    %_92215 = fadd double %_92170, %_92190
    store double %_92215, double* %c_p_92202
    %_92236 = add i64 1, %_92152
    br label %add_loop_head_90604

}


