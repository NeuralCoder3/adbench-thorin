declare i8* @malloc(i64)

declare void @printDouble(double)
declare void @printFloat(float)
declare void @printLong(i64)


define i32 @main() {
main_87070:
    %_87360.i8 = call i8* @malloc(i64 12)
    %_87360 = bitcast i8* %_87360.i8 to [3 x float]*
    %_87646 = bitcast [3 x float]* %_87360 to [0 x float]*
    %_87730 = zext i32 0 to i64
    %_87738 = getelementptr inbounds [0 x float], [0 x float]* %_87646, i64 0, i64 %_87730
    store float 0x4014000000000000, float* %_87738
    %_87757 = zext i32 1 to i64
    %_87765 = getelementptr inbounds [0 x float], [0 x float]* %_87646, i64 0, i64 %_87757
    store float 0x4000000000000000, float* %_87765
    %_87785 = zext i32 2 to i64
    %_87793 = getelementptr inbounds [0 x float], [0 x float]* %_87646, i64 0, i64 %_87785
    store float 0x4000000000000000, float* %_87793
    %_87800.i8 = call i8* @malloc(i64 12)
    %_87800 = bitcast i8* %_87800.i8 to [3 x float]*
    store [3 x float] zeroinitializer, [3 x float]* %_87800
    %_87818 = load float, float* %_87738
    %_87826 = load float, float* %_87765
    %_87834 = load float, float* %_87793
    %_87838.i8 = call i8* @malloc(i64 12)
    %_87838 = bitcast i8* %_87838.i8 to [3 x float]*
    store [3 x float] zeroinitializer, [3 x float]* %_87838
    %_87848 = bitcast [3 x float]* %_87838 to [0 x float]*
    %_87856 = getelementptr inbounds [0 x float], [0 x float]* %_87848, i64 0, i64 %_87730
    %_87943 = fmul float 0x4000000000000000, %_87834
    %_87950 = fadd float %_87818, %_87943
    %_87957 = fmul float 0x3ff0000000000000, %_87950
    store float %_87957, float* %_87856
    %_87964.i8 = call i8* @malloc(i64 12)
    %_87964 = bitcast i8* %_87964.i8 to [3 x float]*
    store [3 x float] zeroinitializer, [3 x float]* %_87964
    %_87974 = bitcast [3 x float]* %_87964 to [0 x float]*
    %_87982 = getelementptr inbounds [0 x float], [0 x float]* %_87974, i64 0, i64 %_87785
    %_87991 = fmul float 0x4000000000000000, %_87957
    store float %_87991, float* %_87982
    %_87998.i8 = call i8* @malloc(i64 12)
    %_87998 = bitcast i8* %_87998.i8 to [3 x float]*
    %a_p_88021 = getelementptr inbounds [3 x float], [3 x float]* %_87800, i64 0, i64 0
    %_88027 = load float, float* %a_p_88021
    %b_p_88040 = getelementptr inbounds [0 x float], [0 x float]* %_87974, i64 0, i64 0
    %_88046 = load float, float* %b_p_88040
    %_88053 = bitcast [3 x float]* %_87998 to [0 x float]*
    %c_p_88061 = getelementptr inbounds [0 x float], [0 x float]* %_88053, i64 0, i64 0
    %_88072 = fadd float %_88027, %_88046
    store float %_88072, float* %c_p_88061
    %a_p_88086 = getelementptr inbounds [3 x float], [3 x float]* %_87800, i64 0, i64 1
    %_88092 = load float, float* %a_p_88086
    %b_p_88102 = getelementptr inbounds [0 x float], [0 x float]* %_87974, i64 0, i64 1
    %_88108 = load float, float* %b_p_88102
    %c_p_88118 = getelementptr inbounds [0 x float], [0 x float]* %_88053, i64 0, i64 1
    %_88129 = fadd float %_88092, %_88108
    store float %_88129, float* %c_p_88118
    %a_p_88143 = getelementptr inbounds [3 x float], [3 x float]* %_87800, i64 0, i64 2
    %_88149 = load float, float* %a_p_88143
    %b_p_88159 = getelementptr inbounds [0 x float], [0 x float]* %_87974, i64 0, i64 2
    %_88165 = load float, float* %b_p_88159
    %c_p_88175 = getelementptr inbounds [0 x float], [0 x float]* %_88053, i64 0, i64 2
    %_88186 = fadd float %_88149, %_88165
    store float %_88186, float* %c_p_88175
    %_88193.i8 = call i8* @malloc(i64 12)
    %_88193 = bitcast i8* %_88193.i8 to [3 x float]*
    %a_p_88203 = getelementptr inbounds [0 x float], [0 x float]* %_87848, i64 0, i64 0
    %_88209 = load float, float* %a_p_88203
    %_88217 = load float, float* %c_p_88061
    %_88222 = bitcast [3 x float]* %_88193 to [0 x float]*
    %c_p_88230 = getelementptr inbounds [0 x float], [0 x float]* %_88222, i64 0, i64 0
    %_88241 = fadd float %_88209, %_88217
    store float %_88241, float* %c_p_88230
    %a_p_88254 = getelementptr inbounds [0 x float], [0 x float]* %_87848, i64 0, i64 1
    %_88260 = load float, float* %a_p_88254
    %_88268 = load float, float* %c_p_88118
    %c_p_88278 = getelementptr inbounds [0 x float], [0 x float]* %_88222, i64 0, i64 1
    %_88289 = fadd float %_88260, %_88268
    store float %_88289, float* %c_p_88278
    %a_p_88302 = getelementptr inbounds [0 x float], [0 x float]* %_87848, i64 0, i64 2
    %_88308 = load float, float* %a_p_88302
    %_88316 = load float, float* %c_p_88175
    %c_p_88326 = getelementptr inbounds [0 x float], [0 x float]* %_88222, i64 0, i64 2
    %_88337 = fadd float %_88308, %_88316
    store float %_88337, float* %c_p_88326
    %_88344.i8 = call i8* @malloc(i64 12)
    %_88344 = bitcast i8* %_88344.i8 to [3 x float]*
    store [3 x float] zeroinitializer, [3 x float]* %_88344
    %_88354 = bitcast [3 x float]* %_88344 to [0 x float]*
    %_88362 = getelementptr inbounds [0 x float], [0 x float]* %_88354, i64 0, i64 %_87730
    store float %_87957, float* %_88362
    %_88369.i8 = call i8* @malloc(i64 12)
    %_88369 = bitcast i8* %_88369.i8 to [3 x float]*
    store [3 x float] zeroinitializer, [3 x float]* %_88369
    %_88379 = bitcast [3 x float]* %_88369 to [0 x float]*
    %_88387 = getelementptr inbounds [0 x float], [0 x float]* %_88379, i64 0, i64 %_87785
    store float %_87991, float* %_88387
    %_88394.i8 = call i8* @malloc(i64 12)
    %_88394 = bitcast i8* %_88394.i8 to [3 x float]*
    %_88402 = load float, float* %a_p_88021
    %b_p_88412 = getelementptr inbounds [0 x float], [0 x float]* %_88379, i64 0, i64 0
    %_88418 = load float, float* %b_p_88412
    %_88423 = bitcast [3 x float]* %_88394 to [0 x float]*
    %c_p_88431 = getelementptr inbounds [0 x float], [0 x float]* %_88423, i64 0, i64 0
    %_88442 = fadd float %_88402, %_88418
    store float %_88442, float* %c_p_88431
    %_88453 = load float, float* %a_p_88086
    %b_p_88463 = getelementptr inbounds [0 x float], [0 x float]* %_88379, i64 0, i64 1
    %_88469 = load float, float* %b_p_88463
    %c_p_88479 = getelementptr inbounds [0 x float], [0 x float]* %_88423, i64 0, i64 1
    %_88490 = fadd float %_88453, %_88469
    store float %_88490, float* %c_p_88479
    %_88501 = load float, float* %a_p_88143
    %b_p_88511 = getelementptr inbounds [0 x float], [0 x float]* %_88379, i64 0, i64 2
    %_88517 = load float, float* %b_p_88511
    %c_p_88527 = getelementptr inbounds [0 x float], [0 x float]* %_88423, i64 0, i64 2
    %_88538 = fadd float %_88501, %_88517
    store float %_88538, float* %c_p_88527
    %_88545.i8 = call i8* @malloc(i64 12)
    %_88545 = bitcast i8* %_88545.i8 to [3 x float]*
    %a_p_88555 = getelementptr inbounds [0 x float], [0 x float]* %_88354, i64 0, i64 0
    %_88561 = load float, float* %a_p_88555
    %_88569 = load float, float* %c_p_88431
    %_88574 = bitcast [3 x float]* %_88545 to [0 x float]*
    %c_p_88582 = getelementptr inbounds [0 x float], [0 x float]* %_88574, i64 0, i64 0
    %_88593 = fadd float %_88561, %_88569
    store float %_88593, float* %c_p_88582
    %a_p_88606 = getelementptr inbounds [0 x float], [0 x float]* %_88354, i64 0, i64 1
    %_88612 = load float, float* %a_p_88606
    %_88620 = load float, float* %c_p_88479
    %c_p_88630 = getelementptr inbounds [0 x float], [0 x float]* %_88574, i64 0, i64 1
    %_88641 = fadd float %_88612, %_88620
    store float %_88641, float* %c_p_88630
    %a_p_88654 = getelementptr inbounds [0 x float], [0 x float]* %_88354, i64 0, i64 2
    %_88660 = load float, float* %a_p_88654
    %_88668 = load float, float* %c_p_88527
    %c_p_88678 = getelementptr inbounds [0 x float], [0 x float]* %_88574, i64 0, i64 2
    %_88689 = fadd float %_88660, %_88668
    store float %_88689, float* %c_p_88678
    %_88696.i8 = call i8* @malloc(i64 12)
    %_88696 = bitcast i8* %_88696.i8 to [3 x float]*
    %_88704 = load float, float* %c_p_88230
    %_88712 = load float, float* %c_p_88582
    %_88717 = bitcast [3 x float]* %_88696 to [0 x float]*
    %c_p_88725 = getelementptr inbounds [0 x float], [0 x float]* %_88717, i64 0, i64 0
    %_88736 = fadd float %_88704, %_88712
    store float %_88736, float* %c_p_88725
    %_88747 = load float, float* %c_p_88278
    %_88755 = load float, float* %c_p_88630
    %c_p_88765 = getelementptr inbounds [0 x float], [0 x float]* %_88717, i64 0, i64 1
    %_88776 = fadd float %_88747, %_88755
    store float %_88776, float* %c_p_88765
    %_88787 = load float, float* %c_p_88326
    %_88795 = load float, float* %c_p_88678
    %c_p_88805 = getelementptr inbounds [0 x float], [0 x float]* %_88717, i64 0, i64 2
    %_88816 = fadd float %_88787, %_88795
    store float %_88816, float* %c_p_88805
    call void @printLong(i64 3)
    br label %printLong_cont_88823
    
printLong_cont_88823:
    %_88853 = getelementptr inbounds [0 x float], [0 x float]* %_88717, i64 0, i64 %_87730
    %_88859 = load float, float* %_88853
    call void @printFloat(float %_88859)
    br label %printFloat_cont_88864
    
printFloat_cont_88864:
    %_88881 = getelementptr inbounds [0 x float], [0 x float]* %_88717, i64 0, i64 %_87757
    %_88887 = load float, float* %_88881
    call void @printFloat(float %_88887)
    br label %printFloat_cont_88892
    
printFloat_cont_88892:
    %_88909 = getelementptr inbounds [0 x float], [0 x float]* %_88717, i64 0, i64 %_87785
    %_88915 = load float, float* %_88909
    call void @printFloat(float %_88915)
    br label %printFloat_cont_88920
    
printFloat_cont_88920:
    call void @printDouble(double 0x0000000000000000)
    br label %printDouble_cont_88941
    
printDouble_cont_88941:
    br label %return_88950
    
return_88950:
    %_90385 = phi i32 [ 0, %printDouble_cont_88941 ]
    ret i32 %_90385
    
}


