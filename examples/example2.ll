declare i8* @malloc(i64)

declare void @printDouble(double)
declare void @printLine([0 x i8]*)
declare void @printString([0 x i8]*)

@_139786 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_141103 = global {i8, i8} {i8 124, i8 0}
@_141151 = global {i8, i8} {i8 124, i8 0}
@_139846 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_139862 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_139880 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_139978 = global {i8, i8} {i8 124, i8 0}
@_140005 = global {i8, i8} {i8 124, i8 0}

define i32 @main() {
main_139614:
    %_140751.i8 = call i8* @malloc(i64 32)
    %_140751 = bitcast i8* %_140751.i8 to [4 x double]*
    %_140756 = bitcast [4 x double]* %_140751 to [0 x double]*
    %_140767 = getelementptr inbounds [0 x double], [0 x double]* %_140756, i64 0, i64 0
    store double 0x4000000000000000, double* %_140767
    %_140789 = getelementptr inbounds [0 x double], [0 x double]* %_140756, i64 0, i64 1
    store double 0x3ff0000000000000, double* %_140789
    %_140808 = getelementptr inbounds [0 x double], [0 x double]* %_140756, i64 0, i64 2
    store double 0x4022000000000000, double* %_140808
    %_140831 = getelementptr inbounds [0 x double], [0 x double]* %_140756, i64 0, i64 3
    store double 0x0000000000000000, double* %_140831
    %_140846.i8 = call i8* @malloc(i64 16)
    %_140846 = bitcast i8* %_140846.i8 to [2 x double]*
    %_140881 = bitcast [2 x double]* %_140846 to [0 x double]*
    %_140891 = getelementptr inbounds [0 x double], [0 x double]* %_140881, i64 0, i64 0
    store double 0x3ff0000000000000, double* %_140891
    %_140908 = getelementptr inbounds [0 x double], [0 x double]* %_140881, i64 0, i64 1
    store double 0x3ff0000000000000, double* %_140908
    %_141112.i8 = call i8* @malloc(i64 16)
    %_141112 = bitcast i8* %_141112.i8 to [2 x double]*
    %_141440.i8 = call i8* @malloc(i64 8)
    %_141440 = bitcast i8* %_141440.i8 to [2 x i32]*
    %_141115 = bitcast [2 x double]* %_141112 to [0 x double]*
    %_141443 = bitcast [2 x i32]* %_141440 to [0 x i32]*
    %_139794 = bitcast {i8, i8, i8, i8, i8}* @_139786 to [0 x i8]*
    %_141104 = bitcast {i8, i8}* @_141103 to [0 x i8]*
    %_141152 = bitcast {i8, i8}* @_141151 to [0 x i8]*
    %_139847 = bitcast {i8, i8, i8, i8, i8}* @_139846 to [0 x i8]*
    %_139863 = bitcast {i8, i8, i8, i8, i8}* @_139862 to [0 x i8]*
    %_139881 = bitcast {i8, i8, i8, i8, i8}* @_139880 to [0 x i8]*
    %_139981 = bitcast {i8, i8}* @_139978 to [0 x i8]*
    %_140006 = bitcast {i8, i8}* @_140005 to [0 x i8]*
    br label %loop_head_139636

loop_head_139636:
    %_141854 = phi i64 [ 0, %main_139614 ], [ %_141913, %loop_exit_141815 ]
    %_142115 = icmp ult i64 %_141854, 2
    br i1 %_142115, label %loop_141809, label %loop_exit_139642

loop_141809:
    %_141960 = mul i64 2, %_141854
    br label %loop_head_141814

loop_head_141814:
    %_141923 = phi i64 [ 0, %loop_141809 ], [ %_141937, %left_max_141943 ], [ %_141937, %right_max_141919 ]
    %_141892 = phi i32 [ 0, %loop_141809 ], [ %_141991, %left_max_141943 ], [ %_141892, %right_max_141919 ]
    %_141869 = phi double [ 0xffefffffffffffff, %loop_141809 ], [ %_141986, %left_max_141943 ], [ %_141869, %right_max_141919 ]
    %_142098 = icmp ult i64 %_141923, 2
    br i1 %_142098, label %loop_141916, label %loop_exit_141815

loop_141916:
    %_141968 = add i64 %_141923, %_141960
    %_141978 = getelementptr inbounds [0 x double], [0 x double]* %_140756, i64 0, i64 %_141968
    %_141986 = load double, double* %_141978
    %_142086 = fcmp ogt double %_141986, %_141869
    %_141937 = add i64 1, %_141923
    br i1 %_142086, label %left_max_141943, label %right_max_141919

left_max_141943:
    %_141991 = trunc i64 %_141923 to i32
    br label %loop_head_141814

right_max_141919:
    br label %loop_head_141814

loop_exit_141815:
    %_141864 = getelementptr inbounds [0 x double], [0 x double]* %_141115, i64 0, i64 %_141854
    store double %_141869, double* %_141864
    %_141889 = getelementptr inbounds [0 x i32], [0 x i32]* %_141443, i64 0, i64 %_141854
    store i32 %_141892, i32* %_141889
    %_141913 = add i64 1, %_141854
    br label %loop_head_139636

loop_exit_139642:
    %_140917.i8 = call i8* @malloc(i64 32)
    %_140917 = bitcast i8* %_140917.i8 to [4 x double]*
    %_140920 = bitcast [4 x double]* %_140917 to [0 x double]*
    br label %loop_head_139644

loop_head_139644:
    %_141530 = phi i64 [ 0, %loop_exit_139642 ], [ %_141749, %loop_141204 ]
    %_141800 = icmp ult i64 %_141530, 2
    br i1 %_141800, label %loop_141204, label %loop_exit_139645

loop_141204:
    %_141533 = trunc i64 %_141530 to i32
    %_141543 = getelementptr inbounds [0 x i32], [0 x i32]* %_141443, i64 0, i32 %_141533
    %_141551 = load i32, i32* %_141543
    %_141568 = getelementptr inbounds [0 x double], [0 x double]* %_140881, i64 0, i32 %_141551
    %_141576 = load double, double* %_141568
    %_141677 = mul i32 2, %_141533
    %_141685 = add i32 %_141551, %_141677
    %_141695 = getelementptr inbounds [0 x double], [0 x double]* %_140920, i64 0, i32 %_141685
    store double %_141576, double* %_141695
    %_141749 = add i64 1, %_141530
    br label %loop_head_139644

loop_exit_139645:
    call void @printLine([0 x i8]* %_139794)
    br label %printLine_cont_139806

printLine_cont_139806:
    br label %range_139819

range_139819:
    br label %while_head_139831

while_head_139831:
    %_141157 = phi i64 [ 0, %range_139819 ], [ %_141171, %eta_while_head_141153 ]
    %_141190 = icmp ult i64 %_141157, 2
    br i1 %_141190, label %eta_while_body_141091, label %break_139840

eta_while_body_141091:
    br label %lambda_141095

lambda_141095:
    %_141117 = phi i64 [ %_141157, %eta_while_body_141091 ]
    call void @printString([0 x i8]* %_141104)
    br label %printString_cont_141109

printString_cont_141109:
    %_141127 = getelementptr inbounds [0 x double], [0 x double]* %_141115, i64 0, i64 %_141117
    %_141135 = load double, double* %_141127
    call void @printDouble(double %_141135)
    br label %printDouble_cont_141145

printDouble_cont_141145:
    call void @printLine([0 x i8]* %_141152)
    br label %eta_while_head_141153

eta_while_head_141153:
    %_141171 = add i64 1, %_141157
    br label %while_head_139831

break_139840:
    call void @printLine([0 x i8]* %_139847)
    br label %print_vector_cont_139860

print_vector_cont_139860:
    call void @printLine([0 x i8]* %_139863)
    br label %printLine_cont_139868

printLine_cont_139868:
    br label %range_139869

range_139869:
    br label %while_head_139870

while_head_139870:
    %_140113 = phi i64 [ 0, %range_139869 ], [ %_140127, %eta_while_head_140009 ]
    %_141077 = icmp ult i64 %_140113, 2
    br i1 %_141077, label %eta_while_body_139919, label %break_139874

break_139874:
    call void @printLine([0 x i8]* %_139881)
    br label %print_matrix_cont_139887

print_matrix_cont_139887:
    br label %return_139902

return_139902:
    %_143910 = phi i32 [ 0, %print_matrix_cont_139887 ]
    ret i32 %_143910

eta_while_body_139919:
    br label %lambda_139924

lambda_139924:
    %_140926 = phi i64 [ %_140113, %eta_while_body_139919 ]
    call void @printString([0 x i8]* %_139981)
    br label %printString_cont_139993

printString_cont_139993:
    br label %range_139994

range_139994:
    %_140940 = mul i64 2, %_140926
    br label %while_head_139995

while_head_139995:
    %_140977 = phi i64 [ 0, %range_139994 ], [ %_140991, %eta_while_head_140973 ]
    %_141055 = icmp ult i64 %_140977, 2
    br i1 %_141055, label %eta_while_body_140132, label %break_139999

eta_while_body_140132:
    br label %lambda_140136

lambda_140136:
    %_140942 = phi i64 [ %_140977, %eta_while_body_140132 ]
    %_140950 = add i64 %_140940, %_140942
    %_140960 = getelementptr inbounds [0 x double], [0 x double]* %_140920, i64 0, i64 %_140950
    %_140968 = load double, double* %_140960
    call void @printDouble(double %_140968)
    br label %eta_while_head_140973

eta_while_head_140973:
    %_140991 = add i64 1, %_140977
    br label %while_head_139995

break_139999:
    call void @printLine([0 x i8]* %_140006)
    br label %eta_while_head_140009

eta_while_head_140009:
    %_140127 = add i64 1, %_140113
    br label %while_head_139870

}


