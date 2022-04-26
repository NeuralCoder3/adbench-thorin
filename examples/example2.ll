declare i8* @malloc(i64)

declare void @printDouble(double)


define i32 @main() {
main_50189:
    %_50672.i8 = call i8* @malloc(i64 24)
    %_50672 = bitcast i8* %_50672.i8 to [3 x double]*
    %_50676.i8 = call i8* @malloc(i64 24)
    %_50676 = bitcast i8* %_50676.i8 to [3 x double]*
    %_51031 = bitcast [3 x double]* %_50676 to [0 x double]*
    %_51131 = zext i32 0 to i64
    %_51141 = getelementptr inbounds [0 x double], [0 x double]* %_51031, i64 0, i64 %_51131
    store double 0x4040000000000000, double* %_51141
    %_51162 = zext i32 1 to i64
    %_51172 = getelementptr inbounds [0 x double], [0 x double]* %_51031, i64 0, i64 %_51162
    store double 0x4014000000000000, double* %_51172
    %_51193 = zext i32 2 to i64
    %_51203 = getelementptr inbounds [0 x double], [0 x double]* %_51031, i64 0, i64 %_51193
    store double 0x4010000000000000, double* %_51203
    %_51216.i8 = call i8* @malloc(i64 24)
    %_51216 = bitcast i8* %_51216.i8 to [3 x double]*
    %_51442 = bitcast [3 x double]* %_50672 to [0 x double]*
    %_51452 = getelementptr inbounds [0 x double], [0 x double]* %_51442, i64 0, i64 %_51193
    %_51460 = load double, double* %_51452
    %_51465 = bitcast [3 x double]* %_51216 to [0 x double]*
    %_51475 = getelementptr inbounds [0 x double], [0 x double]* %_51465, i64 0, i64 %_51131
    store double %_51460, double* %_51475
    %_51492 = load double, double* %_51475
    %_51496.i8 = call i8* @malloc(i64 24)
    %_51496 = bitcast i8* %_51496.i8 to [3 x double]*
    store [3 x double] zeroinitializer, [3 x double]* %_51496
    %_51587 = bitcast [3 x double]* %_51496 to [0 x double]*
    %_51597 = getelementptr inbounds [0 x double], [0 x double]* %_51587, i64 0, i64 %_51193
    store double 0x3ff0000000000000, double* %_51597
    call void @printDouble(double %_51492)
    br label %printDouble_cont_51612

printDouble_cont_51612:
    %_51714 = getelementptr inbounds [0 x double], [0 x double]* %_51587, i64 0, i64 %_51131
    %_51722 = load double, double* %_51714
    call void @printDouble(double %_51722)
    br label %printDouble_cont_51727

printDouble_cont_51727:
    %_51746 = getelementptr inbounds [0 x double], [0 x double]* %_51587, i64 0, i64 %_51162
    %_51754 = load double, double* %_51746
    call void @printDouble(double %_51754)
    br label %printDouble_cont_51759

printDouble_cont_51759:
    %_51777 = getelementptr inbounds [0 x double], [0 x double]* %_51587, i64 0, i64 %_51193
    %_51785 = load double, double* %_51777
    call void @printDouble(double %_51785)
    br label %printDouble_cont_51790

printDouble_cont_51790:
    br label %return_51801

return_51801:
    %_52486 = phi i32 [ 0, %printDouble_cont_51790 ]
    ret i32 %_52486

}


