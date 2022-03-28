declare i8* @malloc(i64)

declare void @printDouble(double)
declare double @hypot(double, double)
declare double @sqrt(double)


define i32 @main() {
main_29822:
    %_30175.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b333333333333)
    br label %hypot_diff_impl_cont_29867
    
hypot_diff_impl_cont_29867:
    %_29915 = phi double [ %_30175.ret, %main_29822 ]
    %_30173.ret = call double @hypot(double 0x3ff33126e978d4fe, double 0x400b333333333333)
    br label %high_29874
    
high_29874:
    %_30015 = phi double [ %_30173.ret, %hypot_diff_impl_cont_29867 ]
    %_30171.ret = call double @hypot(double 0x3ff3353f7ced9168, double 0x400b333333333333)
    br label %diff_111_222_29885
    
diff_111_222_29885:
    %_30012 = phi double [ %_30171.ret, %high_29874 ]
    %_30169.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b322d0e560418)
    br label %high_29887
    
high_29887:
    %_30046 = phi double [ %_30169.ret, %diff_111_222_29885 ]
    %_30167.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b34395810624e)
    br label %diff_111_222_29889
    
diff_111_222_29889:
    %_30044 = phi double [ %_30167.ret, %high_29887 ]
    call void @printDouble(double %_29915)
    br label %printDouble_cont_29916
    
printDouble_cont_29916:
    %_30021 = fsub double %_30012, %_30015
    %_30028 = fdiv double %_30021, 0x3f50624dd2f1a9fc
    %_30035 = fmul double 0x3ff0000000000000, %_30028
    call void @printDouble(double %_30035)
    br label %printDouble_cont_30036
    
printDouble_cont_30036:
    %_30052 = fsub double %_30044, %_30046
    %_30058 = fdiv double %_30052, 0x3f50624dd2f1a9fc
    %_30065 = fmul double 0x3ff0000000000000, %_30058
    call void @printDouble(double %_30065)
    br label %printDouble_cont_30066
    
printDouble_cont_30066:
    %sqrt_cont_30159.ret = call double @sqrt(double 0x4029ffffffffffff)
    br label %sqrt_cont_30088
    
sqrt_cont_30088:
    %sqrt_30097 = phi double [ %sqrt_cont_30159.ret, %printDouble_cont_30066 ]
    call void @printDouble(double %sqrt_30097)
    br label %printDouble_cont_30098
    
printDouble_cont_30098:
    %_30113 = fdiv double 0x3ff3333333333333, %_29915
    call void @printDouble(double %_30113)
    br label %printDouble_cont_30114
    
printDouble_cont_30114:
    %_30129 = fdiv double 0x400b333333333333, %_29915
    call void @printDouble(double %_30129)
    br label %printDouble_cont_30130
    
printDouble_cont_30130:
    br label %return_30140
    
return_30140:
    %_31013 = phi i32 [ 0, %printDouble_cont_30130 ]
    ret i32 %_31013
    
}


