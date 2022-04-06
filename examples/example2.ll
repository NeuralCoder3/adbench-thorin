declare i8* @malloc(i64)

declare void @printDouble(double)


define i32 @main() {
main_40496:
    %_40846.i8 = call i8* @malloc(i64 16)
    %_40846 = bitcast i8* %_40846.i8 to [2 x double]*
    %_41138 = bitcast [2 x double]* %_40846 to [0 x double]*
    %_41222 = zext i32 1 to i64
    %_41230 = getelementptr inbounds [0 x double], [0 x double]* %_41138, i64 0, i64 %_41222
    store double 0x3ff3333333333333, double* %_41230
    %_41241.i8 = call i8* @malloc(i64 16)
    %_41241 = bitcast i8* %_41241.i8 to [2 x double]*
    store [2 x double] zeroinitializer, [2 x double]* %_41241
    %_41445 = getelementptr inbounds [0 x double], [0 x double]* %_41138, i64 0, i64 %_41222
    %_41451 = load double, double* %_41445
    %_41455.i8 = call i8* @malloc(i64 16)
    %_41455 = bitcast i8* %_41455.i8 to [2 x double]*
    store [2 x double] zeroinitializer, [2 x double]* %_41455
    %_41525 = bitcast [2 x double]* %_41455 to [0 x double]*
    %_41533 = getelementptr inbounds [0 x double], [0 x double]* %_41525, i64 0, i64 %_41222
    store double 0x3ff0000000000000, double* %_41533
    %_41545.i8 = call i8* @malloc(i64 16)
    %_41545 = bitcast i8* %_41545.i8 to [2 x double]*
    store [2 x double] zeroinitializer, [2 x double]* %_41545
    %_41556.i8 = call i8* @malloc(i64 16)
    %_41556 = bitcast i8* %_41556.i8 to [2 x double]*
    %a_p_41571 = getelementptr inbounds [0 x double], [0 x double]* %_41525, i64 0, i64 0
    %_41577 = load double, double* %a_p_41571
    %b_p_41596 = getelementptr inbounds [2 x double], [2 x double]* %_41545, i64 0, i64 0
    %_41602 = load double, double* %b_p_41596
    %_41609 = bitcast [2 x double]* %_41556 to [0 x double]*
    %c_p_41617 = getelementptr inbounds [0 x double], [0 x double]* %_41609, i64 0, i64 0
    %_41697 = fadd double %_41577, %_41602
    store double %_41697, double* %c_p_41617
    %a_p_41711 = getelementptr inbounds [0 x double], [0 x double]* %_41525, i64 0, i64 1
    %_41717 = load double, double* %a_p_41711
    %b_p_41727 = getelementptr inbounds [2 x double], [2 x double]* %_41545, i64 0, i64 1
    %_41733 = load double, double* %b_p_41727
    %c_p_41743 = getelementptr inbounds [0 x double], [0 x double]* %_41609, i64 0, i64 1
    %_41754 = fadd double %_41717, %_41733
    store double %_41754, double* %c_p_41743
    %_41776 = fsub double %_41451, 0x4000000000000000
    call void @printDouble(double %_41776)
    br label %printDouble_cont_41777
    
printDouble_cont_41777:
    %_41857 = getelementptr inbounds [0 x double], [0 x double]* %_41609, i64 0, i64 %_41222
    %_41863 = load double, double* %_41857
    call void @printDouble(double %_41863)
    br label %printDouble_cont_41868
    
printDouble_cont_41868:
    call void @printDouble(double 0xbff0000000000000)
    br label %printDouble_cont_41875
    
printDouble_cont_41875:
    br label %return_41884
    
return_41884:
    %_42498 = phi i32 [ 0, %printDouble_cont_41875 ]
    ret i32 %_42498
    
}


