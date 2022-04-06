declare i8* @malloc(i64)

declare double @log(double)
declare void @printDouble(double)


define i32 @main() {
main_21601:
    %_21796.ret = call double @log(double 0x3ff3333333333333)
    br label %log_diff_impl_cont_21640
    
log_diff_impl_cont_21640:
    %_21745 = phi double [ %_21796.ret, %main_21601 ]
    %_21752 = fmul double 0x4000000000000000, %_21745
    call void @printDouble(double %_21752)
    br label %printDouble_cont_21753
    
printDouble_cont_21753:
    call void @printDouble(double 0x3ffaaaaaaaaaaaab)
    br label %printDouble_cont_21760
    
printDouble_cont_21760:
    call void @printDouble(double 0x0000000000000000)
    br label %printDouble_cont_21767
    
printDouble_cont_21767:
    br label %return_21777
    
return_21777:
    %_22112 = phi i32 [ 0, %printDouble_cont_21767 ]
    ret i32 %_22112
    
}


