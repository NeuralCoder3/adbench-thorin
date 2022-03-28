declare i8* @malloc(i64)

declare double @hypot(double, double)
declare void @printDouble(double)


define i32 @main() {
main_25534:
    %_25808.ret = call double @hypot(double 0x400199999999999a, double 0x400199999999999a)
    br label %hypot_diff_impl_cont_25574
    
hypot_diff_impl_cont_25574:
    %_25620 = phi double [ %_25808.ret, %main_25534 ]
    %_25806.ret = call double @hypot(double 0x4001989374bc6a7f, double 0x400199999999999a)
    br label %high_25581
    
high_25581:
    %_25720 = phi double [ %_25806.ret, %hypot_diff_impl_cont_25574 ]
    %_25804.ret = call double @hypot(double 0x40019a9fbe76c8b5, double 0x400199999999999a)
    br label %diff_111_222_25592
    
diff_111_222_25592:
    %_25717 = phi double [ %_25804.ret, %high_25581 ]
    %_25802.ret = call double @hypot(double 0x400199999999999a, double 0x4001989374bc6a7f)
    br label %high_25593
    
high_25593:
    %_25751 = phi double [ %_25802.ret, %diff_111_222_25592 ]
    %_25800.ret = call double @hypot(double 0x400199999999999a, double 0x40019a9fbe76c8b5)
    br label %diff_111_222_25594
    
diff_111_222_25594:
    %_25749 = phi double [ %_25800.ret, %high_25593 ]
    call void @printDouble(double %_25620)
    br label %printDouble_cont_25621
    
printDouble_cont_25621:
    %_25726 = fsub double %_25717, %_25720
    %_25733 = fdiv double %_25726, 0x3f50624dd2f1a9fc
    %_25740 = fmul double 0x3ff0000000000000, %_25733
    call void @printDouble(double %_25740)
    br label %printDouble_cont_25741
    
printDouble_cont_25741:
    %_25757 = fsub double %_25749, %_25751
    %_25763 = fdiv double %_25757, 0x3f50624dd2f1a9fc
    %_25770 = fmul double 0x3ff0000000000000, %_25763
    call void @printDouble(double %_25770)
    br label %printDouble_cont_25771
    
printDouble_cont_25771:
    br label %return_25781
    
return_25781:
    %_26406 = phi i32 [ 0, %printDouble_cont_25771 ]
    ret i32 %_26406
    
}


