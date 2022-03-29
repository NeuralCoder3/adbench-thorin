declare i8* @malloc(i64)

declare void @printDouble(double)
declare double @hypot(double, double)
declare double @sqrt(double)


define i32 @main() {
main_29898:
    %_30251.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b333333333333)
    br label %hypot_diff_impl_cont_29943
    
hypot_diff_impl_cont_29943:
    %_29991 = phi double [ %_30251.ret, %main_29898 ]
    %_30249.ret = call double @hypot(double 0x3ff33126e978d4fe, double 0x400b333333333333)
    br label %high_29950
    
high_29950:
    %_30091 = phi double [ %_30249.ret, %hypot_diff_impl_cont_29943 ]
    %_30247.ret = call double @hypot(double 0x3ff3353f7ced9168, double 0x400b333333333333)
    br label %diff_111_222_29961
    
diff_111_222_29961:
    %_30088 = phi double [ %_30247.ret, %high_29950 ]
    %_30245.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b322d0e560418)
    br label %high_29963
    
high_29963:
    %_30122 = phi double [ %_30245.ret, %diff_111_222_29961 ]
    %_30243.ret = call double @hypot(double 0x3ff3333333333333, double 0x400b34395810624e)
    br label %diff_111_222_29965
    
diff_111_222_29965:
    %_30120 = phi double [ %_30243.ret, %high_29963 ]
    call void @printDouble(double %_29991)
    br label %printDouble_cont_29992
    
printDouble_cont_29992:
    %_30097 = fsub double %_30088, %_30091
    %_30104 = fdiv double %_30097, 0x3f50624dd2f1a9fc
    %_30111 = fmul double 0x3ff0000000000000, %_30104
    call void @printDouble(double %_30111)
    br label %printDouble_cont_30112
    
printDouble_cont_30112:
    %_30128 = fsub double %_30120, %_30122
    %_30134 = fdiv double %_30128, 0x3f50624dd2f1a9fc
    %_30141 = fmul double 0x3ff0000000000000, %_30134
    call void @printDouble(double %_30141)
    br label %printDouble_cont_30142
    
printDouble_cont_30142:
    %sqrt_cont_30235.ret = call double @sqrt(double 0x4029ffffffffffff)
    br label %sqrt_cont_30164
    
sqrt_cont_30164:
    %sqrt_30173 = phi double [ %sqrt_cont_30235.ret, %printDouble_cont_30142 ]
    call void @printDouble(double %sqrt_30173)
    br label %printDouble_cont_30174
    
printDouble_cont_30174:
    %_30189 = fdiv double 0x3ff3333333333333, %sqrt_30173
    call void @printDouble(double %_30189)
    br label %printDouble_cont_30190
    
printDouble_cont_30190:
    %_30205 = fdiv double 0x400b333333333333, %sqrt_30173
    call void @printDouble(double %_30205)
    br label %printDouble_cont_30206
    
printDouble_cont_30206:
    br label %return_30216
    
return_30216:
    %_31089 = phi i32 [ 0, %printDouble_cont_30206 ]
    ret i32 %_31089
    
}


