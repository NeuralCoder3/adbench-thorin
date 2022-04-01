declare i8* @malloc(i64)

declare double @hypot(double, double)
declare void @printDouble(double)
declare double @sqrt(double)


define i32 @main() {
main_29037:
    %_29388.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b333333333333)
    br label %hypot_diff_impl_cont_29082
    
hypot_diff_impl_cont_29082:
    %_29129 = phi double [ %_29388.ret, %main_29037 ]
    %_29386.ret = call double @hypot(double 0x3ff33126e9773333, double 0x400b333333333333)
    br label %high_29089
    
high_29089:
    %_29228 = phi double [ %_29386.ret, %hypot_diff_impl_cont_29082 ]
    %_29384.ret = call double @hypot(double 0x3ff3353f7cef3333, double 0x400b333333333333)
    br label %diff_29096
    
diff_29096:
    %_29225 = phi double [ %_29384.ret, %high_29089 ]
    %_29382.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b322d0e553333)
    br label %high_29098
    
high_29098:
    %_29259 = phi double [ %_29382.ret, %diff_29096 ]
    %_29380.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b343958113333)
    br label %diff_29103
    
diff_29103:
    %_29257 = phi double [ %_29380.ret, %high_29098 ]
    call void @printDouble(double %_29129)
    br label %printDouble_cont_29130
    
printDouble_cont_29130:
    %_29234 = fsub double %_29225, %_29228
    %_29241 = fdiv double %_29234, 0x3f50624de0000000
    %_29248 = fmul double 0x3ff0000000000000, %_29241
    call void @printDouble(double %_29248)
    br label %printDouble_cont_29249
    
printDouble_cont_29249:
    %_29265 = fsub double %_29257, %_29259
    %_29271 = fdiv double %_29265, 0x3f50624de0000000
    %_29278 = fmul double 0x3ff0000000000000, %_29271
    call void @printDouble(double %_29278)
    br label %printDouble_cont_29279
    
printDouble_cont_29279:
    %sqrt_cont_29372.ret = call double @sqrt(double 0x4029ffffffffffff)
    br label %sqrt_cont_29301
    
sqrt_cont_29301:
    %sqrt_29310 = phi double [ %sqrt_cont_29372.ret, %printDouble_cont_29279 ]
    call void @printDouble(double %sqrt_29310)
    br label %printDouble_cont_29311
    
printDouble_cont_29311:
    %_29326 = fdiv double 0x3ff3333333333333, %sqrt_29310
    call void @printDouble(double %_29326)
    br label %printDouble_cont_29327
    
printDouble_cont_29327:
    %_29342 = fdiv double 0x400b333333333333, %sqrt_29310
    call void @printDouble(double %_29342)
    br label %printDouble_cont_29343
    
printDouble_cont_29343:
    br label %return_29353
    
return_29353:
    %_30226 = phi i32 [ 0, %printDouble_cont_29343 ]
    ret i32 %_30226
    
}


