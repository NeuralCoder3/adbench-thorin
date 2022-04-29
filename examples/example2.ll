declare i8* @malloc(i64)

declare void @printDouble(double)


define i32 @main() {
main_53506:
    %_54094.i8 = call i8* @malloc(i64 24)
    %_54094 = bitcast i8* %_54094.i8 to [3 x double]*
    %_54098.i8 = call i8* @malloc(i64 24)
    %_54098 = bitcast i8* %_54098.i8 to [3 x double]*
    %_54102.i8 = call i8* @malloc(i64 24)
    %_54102 = bitcast i8* %_54102.i8 to [3 x double]*
    %_54447 = bitcast [3 x double]* %_54094 to [0 x double]*
    %_54546 = zext i32 0 to i64
    %_54556 = getelementptr inbounds [0 x double], [0 x double]* %_54447, i64 0, i64 %_54546
    store double 0x4000000000000000, double* %_54556
    %_54577 = zext i32 1 to i64
    %_54587 = getelementptr inbounds [0 x double], [0 x double]* %_54447, i64 0, i64 %_54577
    store double 0x0000000000000000, double* %_54587
    %_54609 = zext i32 2 to i64
    %_54619 = getelementptr inbounds [0 x double], [0 x double]* %_54447, i64 0, i64 %_54609
    store double 0x0000000000000000, double* %_54619
    %_54632 = bitcast [3 x double]* %_54098 to [0 x double]*
    %_54642 = getelementptr inbounds [0 x double], [0 x double]* %_54632, i64 0, i64 %_54546
    store double 0x3ff0000000000000, double* %_54642
    %_54666 = getelementptr inbounds [0 x double], [0 x double]* %_54632, i64 0, i64 %_54577
    store double 0x0000000000000000, double* %_54666
    %_54686 = getelementptr inbounds [0 x double], [0 x double]* %_54632, i64 0, i64 %_54609
    store double 0x0000000000000000, double* %_54686
    %_54699 = bitcast [3 x double]* %_54102 to [0 x double]*
    %_54709 = getelementptr inbounds [0 x double], [0 x double]* %_54699, i64 0, i64 %_54546
    store double 0x4008000000000000, double* %_54709
    %_54722.i8 = call i8* @malloc(i64 24)
    %_54722 = bitcast i8* %_54722.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_54722
    %_54737.i8 = call i8* @malloc(i64 24)
    %_54737 = bitcast i8* %_54737.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_54737
    %_54978 = getelementptr inbounds [0 x double], [0 x double]* %_54447, i64 0, i64 %_54546
    %_54986 = load double, double* %_54978
    %_54997 = getelementptr inbounds [0 x double], [0 x double]* %_54632, i64 0, i64 %_54546
    %_55005 = load double, double* %_54997
    %_55218.i8 = call i8* @malloc(i64 24)
    %_55218 = bitcast i8* %_55218.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_55218
    %_55230 = bitcast [3 x double]* %_55218 to [0 x double]*
    %_55240 = getelementptr inbounds [0 x double], [0 x double]* %_55230, i64 0, i64 %_54546
    %_55249 = fmul double 0x3ff0000000000000, %_55005
    store double %_55249, double* %_55240
    %_55258.i8 = call i8* @malloc(i64 24)
    %_55258 = bitcast i8* %_55258.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_55258
    %_55271.i8 = call i8* @malloc(i64 24)
    %_55271 = bitcast i8* %_55271.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_55271
    %_55283 = bitcast [3 x double]* %_55271 to [0 x double]*
    %_55293 = getelementptr inbounds [0 x double], [0 x double]* %_55283, i64 0, i64 %_54546
    %_55302 = fmul double 0x3ff0000000000000, %_54986
    store double %_55302, double* %_55293
    %_55311.i8 = call i8* @malloc(i64 24)
    %_55311 = bitcast i8* %_55311.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_55311
    %_55324.i8 = call i8* @malloc(i64 24)
    %_55324 = bitcast i8* %_55324.i8 to [3 x double]*
    %_55327 = bitcast [3 x double]* %_55324 to [0 x double]*
    br label %add_loop_head_53528

add_loop_head_53528:
    %_55821 = phi i64 [ 0, %main_53506 ], [ %_55905, %add_loop_body_55817 ]
    %_55915 = icmp ult i64 %_55821, 3
    br i1 %_55915, label %add_loop_body_55817, label %add_loop_exit_53534

add_loop_body_55817:
    %a_p_55831 = getelementptr inbounds [0 x double], [0 x double]* %_55230, i64 0, i64 %_55821
    %_55839 = load double, double* %a_p_55831
    %b_p_55851 = getelementptr inbounds [3 x double], [3 x double]* %_55311, i64 0, i64 %_55821
    %_55859 = load double, double* %b_p_55851
    %c_p_55871 = getelementptr inbounds [0 x double], [0 x double]* %_55327, i64 0, i64 %_55821
    %_55884 = fadd double %_55839, %_55859
    store double %_55884, double* %c_p_55871
    %_55905 = add i64 1, %_55821
    br label %add_loop_head_53528

add_loop_exit_53534:
    %_55426.i8 = call i8* @malloc(i64 24)
    %_55426 = bitcast i8* %_55426.i8 to [3 x double]*
    %_55429 = bitcast [3 x double]* %_55426 to [0 x double]*
    br label %add_loop_head_53536

add_loop_head_53536:
    %_55561 = phi i64 [ 0, %add_loop_exit_53534 ], [ %_55751, %add_loop_body_55552 ]
    %_55807 = icmp ult i64 %_55561, 3
    br i1 %_55807, label %add_loop_body_55552, label %add_loop_exit_53537

add_loop_exit_53537:
    %_55018 = fmul double %_55005, %_54986
    call void @printDouble(double %_55018)
    br label %printDouble_cont_55019

printDouble_cont_55019:
    %_55337 = getelementptr inbounds [0 x double], [0 x double]* %_55327, i64 0, i64 %_54546
    %_55345 = load double, double* %_55337
    call void @printDouble(double %_55345)
    br label %printDouble_cont_55350

printDouble_cont_55350:
    %_55369 = getelementptr inbounds [0 x double], [0 x double]* %_55327, i64 0, i64 %_54577
    %_55377 = load double, double* %_55369
    call void @printDouble(double %_55377)
    br label %printDouble_cont_55382

printDouble_cont_55382:
    %_55401 = getelementptr inbounds [0 x double], [0 x double]* %_55327, i64 0, i64 %_54609
    %_55409 = load double, double* %_55401
    call void @printDouble(double %_55409)
    br label %printDouble_cont_55414

printDouble_cont_55414:
    %_55439 = getelementptr inbounds [0 x double], [0 x double]* %_55429, i64 0, i64 %_54546
    %_55447 = load double, double* %_55439
    call void @printDouble(double %_55447)
    br label %printDouble_cont_55452

printDouble_cont_55452:
    %_55471 = getelementptr inbounds [0 x double], [0 x double]* %_55429, i64 0, i64 %_54577
    %_55479 = load double, double* %_55471
    call void @printDouble(double %_55479)
    br label %printDouble_cont_55484

printDouble_cont_55484:
    %_55503 = getelementptr inbounds [0 x double], [0 x double]* %_55429, i64 0, i64 %_54609
    %_55511 = load double, double* %_55503
    call void @printDouble(double %_55511)
    br label %printDouble_cont_55516

printDouble_cont_55516:
    br label %return_55527

return_55527:
    %_57330 = phi i32 [ 0, %printDouble_cont_55516 ]
    ret i32 %_57330

add_loop_body_55552:
    %a_p_55580 = getelementptr inbounds [3 x double], [3 x double]* %_55258, i64 0, i64 %_55561
    %_55588 = load double, double* %a_p_55580
    %b_p_55605 = getelementptr inbounds [0 x double], [0 x double]* %_55283, i64 0, i64 %_55561
    %_55613 = load double, double* %b_p_55605
    %c_p_55627 = getelementptr inbounds [0 x double], [0 x double]* %_55429, i64 0, i64 %_55561
    %_55644 = fadd double %_55588, %_55613
    store double %_55644, double* %c_p_55627
    %_55751 = add i64 1, %_55561
    br label %add_loop_head_53536

}


