declare i8* @malloc(i64)

declare void @read_ba_instance([0 x i8]*, i32, i32, i32, [0 x double]*, [0 x double]*, [0 x double]*, [0 x i32]*, [0 x double]*)
declare double @sin(double)
declare void @printDouble(double)
declare void @printInteger(i32)
declare void @read_ba_size([0 x i8]*, i32*, i32*, i32*)
declare double @sqrt(double)
declare double @cos(double)
declare void @ba_objective(i32, i32, i32, [0 x double]*, [0 x double]*, [0 x double]*, [0 x i32]*, [0 x double]*, [0 x double]*, [0 x double]*)

@_29486 = global [38 x i8] [i8 98, i8 101, i8 110, i8 99, i8 104, i8 109, i8 97, i8 114, i8 107, i8 47, i8 98, i8 97, i8 47, i8 98, i8 97, i8 49, i8 95, i8 110, i8 52, i8 57, i8 95, i8 109, i8 55, i8 55, i8 55, i8 54, i8 95, i8 112, i8 51, i8 49, i8 56, i8 52, i8 51, i8 46, i8 116, i8 120, i8 116, i8 0]

define i32 @main() {
main_29334:
    %p_29432 = alloca i32
    %m_29421 = alloca i32
    %n_29410 = alloca i32
    store i32 2, i32* %n_29410
    store i32 5, i32* %m_29421
    store i32 1000, i32* %p_29432
    %_29487 = bitcast [38 x i8]* @_29486 to [0 x i8]*
    %_29936 = zext i32 0 to i64
    %_30572 = zext i32 3 to i64
    %_30600 = zext i32 1 to i64
    %_30624 = zext i32 2 to i64
    %_31075 = zext i32 9 to i64
    %_31143 = zext i32 6 to i64
    %_31153 = zext i32 7 to i64
    %_31182 = zext i32 8 to i64
    call void @read_ba_size([0 x i8]* %_29487, i32* %n_29410, i32* %m_29421, i32* %p_29432)
    br label %read_ba_size_cont_29488
    
read_ba_size_cont_29488:
    %_29627 = load i32, i32* %n_29410
    %_29632 = mul nsw i32 11, %_29627
    %_29633 = zext i32 %_29632 to i64
    %_29679 = mul nuw nsw i64 8, %_29633
    %_29680 = bitcast i64 %_29679 to i64
    %_29682.i8 = call i8* @malloc(i64 %_29680)
    %_29682 = bitcast i8* %_29682.i8 to [0 x double]*
    %_29685 = load i32, i32* %m_29421
    %_29688 = mul nsw i32 3, %_29685
    %_29689 = zext i32 %_29688 to i64
    %_29700 = mul nuw nsw i64 8, %_29689
    %_29701 = bitcast i64 %_29700 to i64
    %_29703.i8 = call i8* @malloc(i64 %_29701)
    %_29703 = bitcast i8* %_29703.i8 to [0 x double]*
    %_29706 = load i32, i32* %p_29432
    %_29708 = zext i32 %_29706 to i64
    %_29719 = mul nuw nsw i64 8, %_29708
    %_29720 = bitcast i64 %_29719 to i64
    %_29722.i8 = call i8* @malloc(i64 %_29720)
    %_29722 = bitcast i8* %_29722.i8 to [0 x double]*
    %_29725 = load i32, i32* %p_29432
    %_29728 = mul nsw i32 2, %_29725
    %_29729 = zext i32 %_29728 to i64
    %_29741 = mul nuw nsw i64 4, %_29729
    %_29742 = bitcast i64 %_29741 to i64
    %_29744.i8 = call i8* @malloc(i64 %_29742)
    %_29744 = bitcast i8* %_29744.i8 to [0 x i32]*
    %_29747 = load i32, i32* %p_29432
    %_29750 = mul nsw i32 2, %_29747
    %_29751 = zext i32 %_29750 to i64
    %_29762 = mul nuw nsw i64 8, %_29751
    %_29763 = bitcast i64 %_29762 to i64
    %_29765.i8 = call i8* @malloc(i64 %_29763)
    %_29765 = bitcast i8* %_29765.i8 to [0 x double]*
    %_29768 = load i32, i32* %n_29410
    %_29771 = load i32, i32* %m_29421
    %_29774 = load i32, i32* %p_29432
    %_29784 = bitcast [0 x double]* %_29682 to [0 x double]*
    %_29790 = bitcast [0 x double]* %_29703 to [0 x double]*
    %_29796 = bitcast [0 x double]* %_29722 to [0 x double]*
    %_29802 = bitcast [0 x i32]* %_29744 to [0 x i32]*
    %_29808 = bitcast [0 x double]* %_29765 to [0 x double]*
    call void @read_ba_instance([0 x i8]* %_29487, i32 %_29768, i32 %_29771, i32 %_29774, [0 x double]* %_29784, [0 x double]* %_29790, [0 x double]* %_29796, [0 x i32]* %_29802, [0 x double]* %_29808)
    br label %read_ba_instance_cont_29809
    
read_ba_instance_cont_29809:
    %_29827 = load i32, i32* %n_29410
    call void @printInteger(i32 %_29827)
    br label %printInteger_cont_29830
    
printInteger_cont_29830:
    %_29840 = load i32, i32* %m_29421
    call void @printInteger(i32 %_29840)
    br label %printInteger_cont_29843
    
printInteger_cont_29843:
    %_29853 = load i32, i32* %p_29432
    call void @printInteger(i32 %_29853)
    br label %printInteger_cont_29856
    
printInteger_cont_29856:
    %_29938 = getelementptr inbounds [0 x double], [0 x double]* %_29784, i64 0, i64 %_29936
    %_29940 = load double, double* %_29938
    call void @printDouble(double %_29940)
    br label %printDouble_cont_29943
    
printDouble_cont_29943:
    %_29992 = load i32, i32* %p_29432
    %_29995 = mul nsw i32 2, %_29992
    %_29996 = zext i32 %_29995 to i64
    %_30007 = mul nuw nsw i64 8, %_29996
    %_30008 = bitcast i64 %_30007 to i64
    %_30010.i8 = call i8* @malloc(i64 %_30008)
    %_30010 = bitcast i8* %_30010.i8 to [0 x double]*
    %_30013 = load i32, i32* %p_29432
    %_30015 = zext i32 %_30013 to i64
    %_30034 = mul nuw nsw i64 8, %_30015
    %_30035 = bitcast i64 %_30034 to i64
    %_30037.i8 = call i8* @malloc(i64 %_30035)
    %_30037 = bitcast i8* %_30037.i8 to [0 x double]*
    %_30232 = load i32, i32* %n_29410
    %_30235 = load i32, i32* %m_29421
    %_30238 = load i32, i32* %p_29432
    %_30086 = bitcast [0 x double]* %_30010 to [0 x double]*
    br label %while_head_29949
    
while_head_29949:
    %_30481 = phi i32 [ 0, %printDouble_cont_29943 ], [ %_31277, %sqsum_cont_30990 ]
    %_31675 = icmp slt i32 %_30481, %_30238
    br i1 %_31675, label %while_body_30248, label %break_29959
    
while_body_30248:
    %_30483 = mul nsw i32 2, %_30481
    %_30484 = zext i32 %_30483 to i64
    %_30486 = getelementptr inbounds [0 x i32], [0 x i32]* %_29802, i64 0, i64 %_30484
    %_30488 = load i32, i32* %_30486
    %_30495 = add nsw i32 1, %_30483
    %_30496 = zext i32 %_30495 to i64
    %_30498 = getelementptr inbounds [0 x i32], [0 x i32]* %_29802, i64 0, i64 %_30496
    %_30500 = load i32, i32* %_30498
    %_30502 = zext i32 %_30481 to i64
    %_30504 = getelementptr inbounds [0 x double], [0 x double]* %_29796, i64 0, i64 %_30502
    %_30506 = load double, double* %_30504
    %_30509.i8 = call i8* @malloc(i64 16)
    %_30509 = bitcast i8* %_30509.i8 to [2 x double]*
    %_30512.i8 = call i8* @malloc(i64 16)
    %_30512 = bitcast i8* %_30512.i8 to [2 x double]*
    %_30516.i8 = call i8* @malloc(i64 24)
    %_30516 = bitcast i8* %_30516.i8 to [3 x double]*
    %_30536 = mul nsw i32 3, %_30500
    %_30537 = zext i32 %_30536 to i64
    %_30539 = getelementptr inbounds [0 x double], [0 x double]* %_29790, i64 0, i64 %_30537
    %_30540 = bitcast double* %_30539 to [0 x double]*
    %_30542 = getelementptr inbounds [0 x double], [0 x double]* %_30540, i64 0, i64 %_29936
    %_30544 = load double, double* %_30542
    %_30567 = mul nsw i32 11, %_30488
    %_30568 = zext i32 %_30567 to i64
    %_30570 = getelementptr inbounds [0 x double], [0 x double]* %_29784, i64 0, i64 %_30568
    %_30571 = bitcast double* %_30570 to [0 x double]*
    %_30574 = getelementptr inbounds [0 x double], [0 x double]* %_30571, i64 0, i64 %_30572
    %_30575 = bitcast double* %_30574 to [0 x double]*
    %_30577 = getelementptr inbounds [0 x double], [0 x double]* %_30575, i64 0, i64 %_29936
    %_30579 = load double, double* %_30577
    %_30589 = bitcast [2 x double]* %_30512 to [0 x double]*
    %_30591 = getelementptr inbounds [0 x double], [0 x double]* %_30589, i64 0, i64 %_29936
    %_30597 = fsub double %_30544, %_30579
    store double %_30597, double* %_30591
    %_30602 = getelementptr inbounds [0 x double], [0 x double]* %_30540, i64 0, i64 %_30600
    %_30604 = load double, double* %_30602
    %_30607 = getelementptr inbounds [0 x double], [0 x double]* %_30575, i64 0, i64 %_30600
    %_30609 = load double, double* %_30607
    %_30615 = getelementptr inbounds [0 x double], [0 x double]* %_30589, i64 0, i64 %_30600
    %_30621 = fsub double %_30604, %_30609
    store double %_30621, double* %_30615
    %_30626 = getelementptr inbounds [0 x double], [0 x double]* %_30540, i64 0, i64 %_30624
    %_30628 = load double, double* %_30626
    %_30631 = getelementptr inbounds [0 x double], [0 x double]* %_30575, i64 0, i64 %_30624
    %_30633 = load double, double* %_30631
    %_30639 = getelementptr inbounds [0 x double], [0 x double]* %_30589, i64 0, i64 %_30624
    %_30645 = fsub double %_30628, %_30633
    store double %_30645, double* %_30639
    %_30657 = getelementptr inbounds [0 x double], [0 x double]* %_30571, i64 0, i64 %_30600
    %_30658 = bitcast double* %_30657 to [0 x double]*
    %sqsum_cont_31672.ret = call double @sqsum_30263(i32 3, [0 x double]* %_30658)
    br label %sqsum_cont_30659
    
sqsum_cont_30659:
    %sqsum_31372 = phi double [ %sqsum_cont_31672.ret, %while_body_30248 ]
    %_31667 = fcmp une double %sqsum_31372, 0x0000000000000000
    %_30939 = bitcast [3 x double]* %_30516 to [0 x double]*
    br i1 %_31667, label %if_then_31342, label %if_else_30667
    
if_then_31342:
    %_31366.i8 = call i8* @malloc(i64 24)
    %_31366 = bitcast i8* %_31366.i8 to [3 x double]*
    %_31369.i8 = call i8* @malloc(i64 24)
    %_31369 = bitcast i8* %_31369.i8 to [3 x double]*
    %sqrt_cont_31649.ret = call double @sqrt(double %sqsum_31372)
    br label %sqrt_cont_31373
    
sqrt_cont_31373:
    %sqrt_31387 = phi double [ %sqrt_cont_31649.ret, %if_then_31342 ]
    %cos_cont_31647.ret = call double @cos(double %sqrt_31387)
    br label %cos_cont_31388
    
cos_cont_31388:
    %cos_31473 = phi double [ %cos_cont_31647.ret, %sqrt_cont_31373 ]
    %sin_cont_31645.ret = call double @sin(double %sqrt_31387)
    br label %sin_cont_31401
    
sin_cont_31401:
    %sin_31480 = phi double [ %sin_cont_31645.ret, %cos_cont_31388 ]
    %_31413 = bitcast [3 x double]* %_31366 to [0 x double]*
    %_31625 = fdiv double 0x3ff0000000000000, %sqrt_31387
    br label %while_head_31402
    
while_head_31402:
    %_31607 = phi i32 [ 0, %sin_cont_31401 ], [ %_31632, %while_body_31596 ]
    %_31637 = icmp slt i32 %_31607, 3
    br i1 %_31637, label %while_body_31596, label %break_31406
    
while_body_31596:
    %_31608 = zext i32 %_31607 to i64
    %_31610 = getelementptr inbounds [0 x double], [0 x double]* %_30658, i64 0, i64 %_31608
    %_31612 = load double, double* %_31610
    %_31618 = getelementptr inbounds [0 x double], [0 x double]* %_31413, i64 0, i64 %_31608
    %_31628 = fmul double %_31625, %_31612
    store double %_31628, double* %_31618
    %_31632 = add nsw i32 1, %_31607
    br label %while_head_31402
    
break_31406:
    %_31415 = bitcast [3 x double]* %_31369 to [0 x double]*
    call void @cross_30680([0 x double]* %_31413, [0 x double]* %_30589, [0 x double]* %_31415)
    br label %cross_cont_31416
    
cross_cont_31416:
    %_31513 = getelementptr inbounds [0 x double], [0 x double]* %_31413, i64 0, i64 %_29936
    %_31515 = load double, double* %_31513
    %_31522 = load double, double* %_30591
    %_31534 = getelementptr inbounds [0 x double], [0 x double]* %_31413, i64 0, i64 %_30600
    %_31536 = load double, double* %_31534
    %_31543 = load double, double* %_30615
    %_31557 = getelementptr inbounds [0 x double], [0 x double]* %_31413, i64 0, i64 %_30624
    %_31559 = load double, double* %_31557
    %_31566 = load double, double* %_30639
    %_31497 = fsub double 0x3ff0000000000000, %cos_31473
    %_31525 = fmul double %_31515, %_31522
    %_31546 = fmul double %_31536, %_31543
    %_31548 = fadd double %_31525, %_31546
    %_31569 = fmul double %_31559, %_31566
    %_31571 = fadd double %_31548, %_31569
    %_31573 = fmul double %_31497, %_31571
    br label %while_head_31417
    
while_head_31417:
    %_31443 = phi i32 [ 0, %cross_cont_31416 ], [ %_31582, %while_body_31424 ]
    %_31587 = icmp slt i32 %_31443, 3
    br i1 %_31587, label %while_body_31424, label %break_31421
    
while_body_31424:
    %_31444 = zext i32 %_31443 to i64
    %_31446 = getelementptr inbounds [0 x double], [0 x double]* %_30589, i64 0, i64 %_31444
    %_31448 = load double, double* %_31446
    %_31451 = getelementptr inbounds [0 x double], [0 x double]* %_31415, i64 0, i64 %_31444
    %_31453 = load double, double* %_31451
    %_31456 = getelementptr inbounds [0 x double], [0 x double]* %_31413, i64 0, i64 %_31444
    %_31458 = load double, double* %_31456
    %_31464 = getelementptr inbounds [0 x double], [0 x double]* %_30939, i64 0, i64 %_31444
    %_31476 = fmul double %cos_31473, %_31448
    %_31483 = fmul double %sin_31480, %_31453
    %_31485 = fadd double %_31476, %_31483
    %_31576 = fmul double %_31573, %_31458
    %_31578 = fadd double %_31485, %_31576
    store double %_31578, double* %_31464
    %_31582 = add nsw i32 1, %_31443
    br label %while_head_31417
    
break_31421:
    br label %if_join_30910
    
if_else_30667:
    %_30891.i8 = call i8* @malloc(i64 24)
    %_30891 = bitcast i8* %_30891.i8 to [3 x double]*
    %_30898 = bitcast [3 x double]* %_30891 to [0 x double]*
    call void @cross_30680([0 x double]* %_30658, [0 x double]* %_30589, [0 x double]* %_30898)
    br label %cross_cont_30899
    
cross_cont_30899:
    br label %while_head_30900
    
while_head_30900:
    %_31298 = phi i32 [ 0, %cross_cont_30899 ], [ %_31324, %while_body_31284 ]
    %_31329 = icmp slt i32 %_31298, 3
    br i1 %_31329, label %while_body_31284, label %break_30904
    
while_body_31284:
    %_31299 = zext i32 %_31298 to i64
    %_31301 = getelementptr inbounds [0 x double], [0 x double]* %_30589, i64 0, i64 %_31299
    %_31303 = load double, double* %_31301
    %_31306 = getelementptr inbounds [0 x double], [0 x double]* %_30898, i64 0, i64 %_31299
    %_31308 = load double, double* %_31306
    %_31314 = getelementptr inbounds [0 x double], [0 x double]* %_30939, i64 0, i64 %_31299
    %_31320 = fadd double %_31303, %_31308
    store double %_31320, double* %_31314
    %_31324 = add nsw i32 1, %_31298
    br label %while_head_30900
    
break_30904:
    br label %if_join_30910
    
if_join_30910:
    %_30941 = getelementptr inbounds [0 x double], [0 x double]* %_30939, i64 0, i64 %_29936
    %_30943 = load double, double* %_30941
    %_30946 = getelementptr inbounds [0 x double], [0 x double]* %_30939, i64 0, i64 %_30624
    %_30948 = load double, double* %_30946
    %_30955 = bitcast [2 x double]* %_30509 to [0 x double]*
    %_30957 = getelementptr inbounds [0 x double], [0 x double]* %_30955, i64 0, i64 %_29936
    %_30965 = fdiv double %_30943, %_30948
    store double %_30965, double* %_30957
    %_30969 = getelementptr inbounds [0 x double], [0 x double]* %_30939, i64 0, i64 %_30600
    %_30971 = load double, double* %_30969
    %_30974 = load double, double* %_30946
    %_30981 = getelementptr inbounds [0 x double], [0 x double]* %_30955, i64 0, i64 %_30600
    %_30987 = fdiv double %_30971, %_30974
    store double %_30987, double* %_30981
    %sqsum_cont_31281.ret = call double @sqsum_30263(i32 2, [0 x double]* %_30955)
    br label %sqsum_cont_30990
    
sqsum_cont_30990:
    %sqsum_31103 = phi double [ %sqsum_cont_31281.ret, %if_join_30910 ]
    %_31077 = getelementptr inbounds [0 x double], [0 x double]* %_30571, i64 0, i64 %_31075
    %_31078 = bitcast double* %_31077 to [0 x double]*
    %_31080 = getelementptr inbounds [0 x double], [0 x double]* %_31078, i64 0, i64 %_29936
    %_31082 = load double, double* %_31080
    %_31085 = getelementptr inbounds [0 x double], [0 x double]* %_31078, i64 0, i64 %_30600
    %_31087 = load double, double* %_31085
    %_31090 = load double, double* %_30957
    %_31106 = fmul double %sqsum_31103, %_31082
    %_31108 = fadd double 0x3ff0000000000000, %_31106
    %_31116 = fmul double %sqsum_31103, %_31087
    %_31118 = fmul double %sqsum_31103, %_31116
    %_31120 = fadd double %_31108, %_31118
    %_31123 = fmul double %_31120, %_31090
    store double %_31123, double* %_30957
    %_31127 = load double, double* %_30981
    %_31133 = fmul double %_31120, %_31127
    store double %_31133, double* %_30981
    %_31137 = load double, double* %_30957
    %_31145 = getelementptr inbounds [0 x double], [0 x double]* %_30571, i64 0, i64 %_31143
    %_31147 = load double, double* %_31145
    %_31155 = getelementptr inbounds [0 x double], [0 x double]* %_30571, i64 0, i64 %_31153
    %_31157 = load double, double* %_31155
    %_31166 = fmul double %_31137, %_31147
    %_31169 = fadd double %_31166, %_31157
    store double %_31169, double* %_30957
    %_31173 = load double, double* %_30981
    %_31176 = load double, double* %_31145
    %_31184 = getelementptr inbounds [0 x double], [0 x double]* %_30571, i64 0, i64 %_31182
    %_31186 = load double, double* %_31184
    %_31195 = fmul double %_31173, %_31176
    %_31198 = fadd double %_31195, %_31186
    store double %_31198, double* %_30981
    %_31202 = load double, double* %_30957
    %_31213 = getelementptr inbounds [0 x double], [0 x double]* %_29808, i64 0, i64 %_30484
    %_31214 = bitcast double* %_31213 to [0 x double]*
    %_31216 = getelementptr inbounds [0 x double], [0 x double]* %_31214, i64 0, i64 %_29936
    %_31218 = load double, double* %_31216
    %_31232 = getelementptr inbounds [0 x double], [0 x double]* %_30086, i64 0, i64 %_30484
    %_31233 = bitcast double* %_31232 to [0 x double]*
    %_31235 = getelementptr inbounds [0 x double], [0 x double]* %_31233, i64 0, i64 %_29936
    %_31245 = fsub double %_31202, %_31218
    %_31247 = fmul double %_30506, %_31245
    store double %_31247, double* %_31235
    %_31251 = load double, double* %_30981
    %_31254 = getelementptr inbounds [0 x double], [0 x double]* %_31214, i64 0, i64 %_30600
    %_31256 = load double, double* %_31254
    %_31262 = getelementptr inbounds [0 x double], [0 x double]* %_31233, i64 0, i64 %_30600
    %_31271 = fsub double %_31251, %_31256
    %_31273 = fmul double %_30506, %_31271
    store double %_31273, double* %_31262
    %_31277 = add nsw i32 1, %_30481
    br label %while_head_29949
    
break_29959:
    %_30039 = bitcast [0 x double]* %_30037 to [0 x double]*
    br label %while_head_29960
    
while_head_29960:
    %_30151 = phi i32 [ 0, %break_29959 ], [ %_30205, %while_body_30136 ]
    %_30241 = icmp slt i32 %_30151, %_30238
    br i1 %_30241, label %while_body_30136, label %ba_cont_29967
    
while_body_30136:
    %_30152 = zext i32 %_30151 to i64
    %_30154 = getelementptr inbounds [0 x double], [0 x double]* %_29796, i64 0, i64 %_30152
    %_30156 = load double, double* %_30154
    %_30163 = getelementptr inbounds [0 x double], [0 x double]* %_30039, i64 0, i64 %_30152
    %_30193 = fmul double %_30156, %_30156
    %_30195 = fsub double 0x3ff0000000000000, %_30193
    store double %_30195, double* %_30163
    %_30205 = add nsw i32 1, %_30151
    br label %while_head_29960
    
ba_cont_29967:
    %_30041 = getelementptr inbounds [0 x double], [0 x double]* %_30039, i64 0, i64 %_29936
    %_30043 = load double, double* %_30041
    call void @printDouble(double %_30043)
    br label %printDouble_cont_30046
    
printDouble_cont_30046:
    %_30070 = load i32, i32* %n_29410
    %_30073 = load i32, i32* %m_29421
    %_30076 = load i32, i32* %p_29432
    call void @ba_objective(i32 %_30070, i32 %_30073, i32 %_30076, [0 x double]* %_29784, [0 x double]* %_29790, [0 x double]* %_29796, [0 x i32]* %_29802, [0 x double]* %_29808, [0 x double]* %_30086, [0 x double]* %_30039)
    br label %ba_objective_cont_30087
    
ba_objective_cont_30087:
    %_30098 = load double, double* %_30041
    call void @printDouble(double %_30098)
    br label %runGmmBenchmark_cont_30110
    
runGmmBenchmark_cont_30110:
    br label %return_30119
    
return_30119:
    %_31695 = phi i32 [ 0, %runGmmBenchmark_cont_30110 ]
    ret i32 %_31695
    
}

define void @cross_30680([0 x double]* %a_30755, [0 x double]* %b_30765, [0 x double]* %out_30789) {
cross_30680:
    %_30600 = zext i32 1 to i64
    %_30757 = getelementptr inbounds [0 x double], [0 x double]* %a_30755, i64 0, i64 %_30600
    %_30759 = load double, double* %_30757
    %_30624 = zext i32 2 to i64
    %_30767 = getelementptr inbounds [0 x double], [0 x double]* %b_30765, i64 0, i64 %_30624
    %_30769 = load double, double* %_30767
    %_30772 = getelementptr inbounds [0 x double], [0 x double]* %a_30755, i64 0, i64 %_30624
    %_30774 = load double, double* %_30772
    %_30777 = getelementptr inbounds [0 x double], [0 x double]* %b_30765, i64 0, i64 %_30600
    %_30779 = load double, double* %_30777
    %_29936 = zext i32 0 to i64
    %_30791 = getelementptr inbounds [0 x double], [0 x double]* %out_30789, i64 0, i64 %_29936
    %_30799 = fmul double %_30759, %_30769
    %_30805 = fmul double %_30774, %_30779
    %_30807 = fsub double %_30799, %_30805
    store double %_30807, double* %_30791
    %_30811 = load double, double* %_30772
    %_30814 = getelementptr inbounds [0 x double], [0 x double]* %b_30765, i64 0, i64 %_29936
    %_30816 = load double, double* %_30814
    %_30819 = getelementptr inbounds [0 x double], [0 x double]* %a_30755, i64 0, i64 %_29936
    %_30821 = load double, double* %_30819
    %_30824 = load double, double* %_30767
    %_30830 = getelementptr inbounds [0 x double], [0 x double]* %out_30789, i64 0, i64 %_30600
    %_30838 = fmul double %_30811, %_30816
    %_30844 = fmul double %_30821, %_30824
    %_30846 = fsub double %_30838, %_30844
    store double %_30846, double* %_30830
    %_30850 = load double, double* %_30819
    %_30853 = load double, double* %_30777
    %_30856 = load double, double* %_30757
    %_30859 = load double, double* %_30814
    %_30865 = getelementptr inbounds [0 x double], [0 x double]* %out_30789, i64 0, i64 %_30624
    %_30873 = fmul double %_30850, %_30853
    %_30879 = fmul double %_30856, %_30859
    %_30881 = fsub double %_30873, %_30879
    store double %_30881, double* %_30865
    br label %return_30687
    
return_30687:
    ret void
    
}

define double @sqsum_30263(i32 %n_30367, [0 x double]* %x_30330) {
sqsum_30263:
    %res_30300 = alloca double
    store double 0x0000000000000000, double* %res_30300
    br label %while_head_30264
    
while_head_30264:
    %_30332 = phi i32 [ 0, %sqsum_30263 ], [ %_30358, %while_body_30305 ]
    %_30369 = icmp slt i32 %_30332, %n_30367
    br i1 %_30369, label %while_body_30305, label %break_30268
    
while_body_30305:
    %_30323 = load double, double* %res_30300
    %_30333 = zext i32 %_30332 to i64
    %_30335 = getelementptr inbounds [0 x double], [0 x double]* %x_30330, i64 0, i64 %_30333
    %_30337 = load double, double* %_30335
    %_30340 = load double, double* %_30335
    %_30352 = fmul double %_30337, %_30340
    %_30354 = fadd double %_30323, %_30352
    store double %_30354, double* %res_30300
    %_30358 = add nsw i32 1, %_30332
    br label %while_head_30264
    
break_30268:
    %_30303 = load double, double* %res_30300
    br label %return_30275
    
return_30275:
    %_31719 = phi double [ %_30303, %break_30268 ]
    ret double %_31719
    
}


