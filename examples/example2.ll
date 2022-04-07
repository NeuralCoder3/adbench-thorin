declare i8* @malloc(i64)

declare void @printDouble(double)


define i32 @main() {
main_29365:
    %_29789.i8 = call i8* @malloc(i64 32)
    %_29789 = bitcast i8* %_29789.i8 to [4 x double]*
    %_30073 = bitcast [4 x double]* %_29789 to [0 x double]*
    %_30153 = zext i32 0 to i64
    %_30161 = getelementptr inbounds [0 x double], [0 x double]* %_30073, i64 0, i64 %_30153
    store double 0x3ff3333333333333, double* %_30161
    %_30180 = zext i32 1 to i64
    %_30188 = getelementptr inbounds [0 x double], [0 x double]* %_30073, i64 0, i64 %_30180
    store double 0x3ff4cccccccccccd, double* %_30188
    %_30207 = zext i32 2 to i64
    %_30215 = getelementptr inbounds [0 x double], [0 x double]* %_30073, i64 0, i64 %_30207
    store double 0x3ff6666666666666, double* %_30215
    %_30234 = zext i32 3 to i64
    %_30242 = getelementptr inbounds [0 x double], [0 x double]* %_30073, i64 0, i64 %_30234
    store double 0x3ff8000000000000, double* %_30242
    %_30257 = load double, double* %_30161
    %_30336 = fcmp ogt double %_30257, 0x0000000000000000
    br i1 %_30336, label %if_then_29508, label %if_else_29378
    
if_else_29378:
    br label %_cont_29394
    
_cont_29394:
    %_29463 = phi double [ 0x0000000000000000, %if_else_29378 ]
    %_cont_29501.ret = call {double, double} @zero_pb_lit_29410(double 0x3ff0000000000000)
    br label %_cont_29440
    
_cont_29440:
    %_29472 = phi double [ %_cont_29501.ret, %_cont_29394 ]
    call void @printDouble(double %_29463)
    br label %printDouble_cont_29464
    
printDouble_cont_29464:
    call void @printDouble(double %_29472)
    br label %printDouble_cont_29473
    
if_then_29508:
    br label %_cont_29509
    
_cont_29509:
    %_29535 = phi double [ %_30257, %if_then_29508 ]
    %_cont_29545.ret = call {double, double} @extract_pb_29514(double 0x3ff0000000000000)
    br label %_cont_29530
    
_cont_29530:
    %_29539 = phi double [ %_cont_29545.ret, %_cont_29509 ]
    call void @printDouble(double %_29535)
    br label %printDouble_cont_29536
    
printDouble_cont_29536:
    call void @printDouble(double %_29539)
    br label %printDouble_cont_29473
    
printDouble_cont_29473:
    br label %return_29483
    
return_29483:
    %_31202 = phi i32 [ 0, %printDouble_cont_29473 ]
    ret i32 %_31202
    
}

define {double, double} @extract_pb_29514(double %_29524) {
extract_pb_29514:
    br label %_29515
    
_29515:
    %_31441 = phi double [ 0x0000000000000000, %extract_pb_29514 ]
    %_31421 = phi double [ %_29524, %extract_pb_29514 ]
    {double, double} ret_val

    ret_val.e0 = %_31421;

    ret_val.e1 = %_31441;

    ret ret_val
    
}

define {double, double} @zero_pb_lit_29410(double %_31560) {
zero_pb_lit_29410:
    br label %_29412
    
_29412:
    %_31606 = phi double [ 0x0000000000000000, %zero_pb_lit_29410 ]
    %_31620 = phi double [ 0x0000000000000000, %zero_pb_lit_29410 ]
    {double, double} ret_val

    ret_val.e0 = %_31606;

    ret_val.e1 = %_31620;

    ret ret_val
    
}


