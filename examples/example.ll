declare i8* @malloc(i64)

declare double @log(double)
declare void @printDouble(double)


define i32 @main() {
main_21665:
    %_21860.ret = call double @log(double 0x3ff3333333333333)
    br label %log_diff_impl_cont_21704
    
log_diff_impl_cont_21704:
    %_21809 = phi double [ %_21860.ret, %main_21665 ]
    %_21816 = fmul double 0x4000000000000000, %_21809
    call void @printDouble(double %_21816)
    br label %printDouble_cont_21817
    
printDouble_cont_21817:
    call void @printDouble(double 0x3ffaaaaaaaaaaaab)
    br label %printDouble_cont_21824
    
printDouble_cont_21824:
    call void @printDouble(double 0x0000000000000000)
    br label %printDouble_cont_21831
    
printDouble_cont_21831:
    br label %return_21841
    
return_21841:
    %_22176 = phi i32 [ 0, %printDouble_cont_21831 ]
    ret i32 %_22176
    
}


