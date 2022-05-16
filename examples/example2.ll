declare i8* @malloc(i64)

declare void @printDouble(double)
declare void @printString([0 x i8]*)
declare void @printLine([0 x i8]*)

@_332826 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_332896 = global {i8, i8} {i8 124, i8 0}
@_333063 = global {i8, i8} {i8 124, i8 0}
@_333103 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}

define i32 @main() {
main_332016:
    %_332256.i8 = call i8* @malloc(i64 32)
    %_332256 = bitcast i8* %_332256.i8 to [4 x double]*
    %_332260.i8 = call i8* @malloc(i64 32)
    %_332260 = bitcast i8* %_332260.i8 to [4 x double]*
    %_332264.i8 = call i8* @malloc(i64 32)
    %_332264 = bitcast i8* %_332264.i8 to [4 x double]*
    %_332619 = bitcast [4 x double]* %_332256 to [0 x double]*
    %_332630 = getelementptr inbounds [0 x double], [0 x double]* %_332619, i64 0, i64 0
    store double 0x3ff0000000000000, double* %_332630
    %_332660 = getelementptr inbounds [0 x double], [0 x double]* %_332619, i64 0, i64 1
    store double 0x4000000000000000, double* %_332660
    %_332683 = getelementptr inbounds [0 x double], [0 x double]* %_332619, i64 0, i64 2
    store double 0x4008000000000000, double* %_332683
    %_332706 = getelementptr inbounds [0 x double], [0 x double]* %_332619, i64 0, i64 3
    store double 0x4010000000000000, double* %_332706
    %_332717 = bitcast [4 x double]* %_332260 to [0 x double]*
    %_332727 = getelementptr inbounds [0 x double], [0 x double]* %_332717, i64 0, i64 0
    store double 0x4000000000000000, double* %_332727
    %_332744 = getelementptr inbounds [0 x double], [0 x double]* %_332717, i64 0, i64 1
    store double 0x4008000000000000, double* %_332744
    %_332761 = getelementptr inbounds [0 x double], [0 x double]* %_332717, i64 0, i64 2
    store double 0x4010000000000000, double* %_332761
    %_332778 = getelementptr inbounds [0 x double], [0 x double]* %_332717, i64 0, i64 3
    store double 0x4014000000000000, double* %_332778
    %_332830 = bitcast {i8, i8, i8, i8, i8}* @_332826 to [0 x i8]*
    %_332899 = bitcast {i8, i8}* @_332896 to [0 x i8]*
    %_333064 = bitcast {i8, i8}* @_333063 to [0 x i8]*
    %_333104 = bitcast {i8, i8, i8, i8, i8}* @_333103 to [0 x i8]*
    call void @printLine([0 x i8]* %_332830)
    br label %printLine_cont_332843

printLine_cont_332843:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_332911

printString_cont_332911:
    %_333026 = load double, double* %_332630
    call void @printDouble(double %_333026)
    br label %eta_while_head_333043

eta_while_head_333043:
    %_333052 = load double, double* %_332660
    call void @printDouble(double %_333052)
    br label %eta_while_head_333057

eta_while_head_333057:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_333065

eta_while_head_333065:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_333067

printString_cont_333067:
    %_333076 = load double, double* %_332683
    call void @printDouble(double %_333076)
    br label %eta_while_head_333081

eta_while_head_333081:
    %_333090 = load double, double* %_332706
    call void @printDouble(double %_333090)
    br label %eta_while_head_333095

eta_while_head_333095:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_333097

eta_while_head_333097:
    call void @printLine([0 x i8]* %_333104)
    br label %print_matrix_cont_333116

print_matrix_cont_333116:
    call void @printLine([0 x i8]* %_332830)
    br label %printLine_cont_333118

printLine_cont_333118:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_333120

printString_cont_333120:
    %_333129 = load double, double* %_332727
    call void @printDouble(double %_333129)
    br label %eta_while_head_333134

eta_while_head_333134:
    %_333143 = load double, double* %_332744
    call void @printDouble(double %_333143)
    br label %eta_while_head_333148

eta_while_head_333148:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_333150

eta_while_head_333150:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_333152

printString_cont_333152:
    %_333161 = load double, double* %_332761
    call void @printDouble(double %_333161)
    br label %eta_while_head_333166

eta_while_head_333166:
    %_333175 = load double, double* %_332778
    call void @printDouble(double %_333175)
    br label %eta_while_head_333180

eta_while_head_333180:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_333182

eta_while_head_333182:
    call void @printLine([0 x i8]* %_333104)
    br label %print_matrix_cont_333188

print_matrix_cont_333188:
    %_333192 = bitcast [4 x double]* %_332264 to [0 x double]*
    %_333202 = getelementptr inbounds [0 x double], [0 x double]* %_333192, i64 0, i64 0
    store double 0x3ff0000000000000, double* %_333202
    %_333219 = getelementptr inbounds [0 x double], [0 x double]* %_333192, i64 0, i64 1
    store double 0x0000000000000000, double* %_333219
    %_333241 = getelementptr inbounds [0 x double], [0 x double]* %_333192, i64 0, i64 2
    store double 0x0000000000000000, double* %_333241
    %_333258 = getelementptr inbounds [0 x double], [0 x double]* %_333192, i64 0, i64 3
    store double 0x0000000000000000, double* %_333258
    call void @printLine([0 x i8]* %_332830)
    br label %printLine_cont_333266

printLine_cont_333266:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_333268

printString_cont_333268:
    %_333277 = load double, double* %_333202
    call void @printDouble(double %_333277)
    br label %eta_while_head_333282

eta_while_head_333282:
    %_333291 = load double, double* %_333219
    call void @printDouble(double %_333291)
    br label %eta_while_head_333296

eta_while_head_333296:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_333298

eta_while_head_333298:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_333300

printString_cont_333300:
    %_333309 = load double, double* %_333241
    call void @printDouble(double %_333309)
    br label %eta_while_head_333314

eta_while_head_333314:
    %_333323 = load double, double* %_333258
    call void @printDouble(double %_333323)
    br label %eta_while_head_333328

eta_while_head_333328:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_333330

eta_while_head_333330:
    call void @printLine([0 x i8]* %_333104)
    br label %print_matrix_cont_333336

print_matrix_cont_333336:
    %_333374.i8 = call i8* @malloc(i64 32)
    %_333374 = bitcast i8* %_333374.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_333374
    %_333389.i8 = call i8* @malloc(i64 32)
    %_333389 = bitcast i8* %_333389.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_333389
    %_333402.i8 = call i8* @malloc(i64 32)
    %_333402 = bitcast i8* %_333402.i8 to [4 x double]*
    %_333412 = load double, double* %_332630
    %_333422 = load double, double* %_332630
    %_333432 = load double, double* %_332660
    %_333442 = load double, double* %_332683
    %_333447 = bitcast [4 x double]* %_333402 to [0 x double]*
    %_333457 = getelementptr inbounds [0 x double], [0 x double]* %_333447, i64 0, i64 0
    %_333561 = fmul double %_333412, %_333422
    %_333570 = fadd double 0x0000000000000000, %_333561
    %_333583 = fmul double %_333432, %_333442
    %_333594 = fadd double %_333570, %_333583
    store double %_333594, double* %_333457
    %_333609 = load double, double* %_332630
    %_333619 = load double, double* %_332660
    %_333629 = load double, double* %_332660
    %_333639 = load double, double* %_332706
    %_333651 = getelementptr inbounds [0 x double], [0 x double]* %_333447, i64 0, i64 1
    %_333664 = fmul double %_333609, %_333619
    %_333673 = fadd double 0x0000000000000000, %_333664
    %_333686 = fmul double %_333629, %_333639
    %_333697 = fadd double %_333673, %_333686
    store double %_333697, double* %_333651
    %_333712 = load double, double* %_332683
    %_333722 = load double, double* %_332630
    %_333732 = load double, double* %_332706
    %_333742 = load double, double* %_332683
    %_333754 = getelementptr inbounds [0 x double], [0 x double]* %_333447, i64 0, i64 2
    %_333767 = fmul double %_333712, %_333722
    %_333776 = fadd double 0x0000000000000000, %_333767
    %_333789 = fmul double %_333732, %_333742
    %_333800 = fadd double %_333776, %_333789
    store double %_333800, double* %_333754
    %_333815 = load double, double* %_332683
    %_333825 = load double, double* %_332660
    %_333835 = load double, double* %_332706
    %_333845 = load double, double* %_332706
    %_333857 = getelementptr inbounds [0 x double], [0 x double]* %_333447, i64 0, i64 3
    %_333870 = fmul double %_333815, %_333825
    %_333879 = fadd double 0x0000000000000000, %_333870
    %_333892 = fmul double %_333835, %_333845
    %_333903 = fadd double %_333879, %_333892
    store double %_333903, double* %_333857
    %_333912.i8 = call i8* @malloc(i64 32)
    %_333912 = bitcast i8* %_333912.i8 to [4 x double]*
    %_333922 = load double, double* %_332630
    %_333927 = bitcast [4 x double]* %_333912 to [0 x double]*
    %_333937 = getelementptr inbounds [0 x double], [0 x double]* %_333927, i64 0, i64 0
    store double %_333922, double* %_333937
    %_333954 = load double, double* %_332660
    %_333966 = getelementptr inbounds [0 x double], [0 x double]* %_333927, i64 0, i64 2
    store double %_333954, double* %_333966
    %_333983 = load double, double* %_332683
    %_333995 = getelementptr inbounds [0 x double], [0 x double]* %_333927, i64 0, i64 1
    store double %_333983, double* %_333995
    %_334012 = load double, double* %_332706
    %_334024 = getelementptr inbounds [0 x double], [0 x double]* %_333927, i64 0, i64 3
    store double %_334012, double* %_334024
    %_334035.i8 = call i8* @malloc(i64 32)
    %_334035 = bitcast i8* %_334035.i8 to [4 x double]*
    %_334045 = load double, double* %_333937
    %_334055 = load double, double* %_333202
    %_334065 = load double, double* %_333995
    %_334075 = load double, double* %_333241
    %_334080 = bitcast [4 x double]* %_334035 to [0 x double]*
    %_334090 = getelementptr inbounds [0 x double], [0 x double]* %_334080, i64 0, i64 0
    %_334103 = fmul double %_334045, %_334055
    %_334112 = fadd double 0x0000000000000000, %_334103
    %_334125 = fmul double %_334065, %_334075
    %_334136 = fadd double %_334112, %_334125
    store double %_334136, double* %_334090
    %_334151 = load double, double* %_333937
    %_334161 = load double, double* %_333219
    %_334171 = load double, double* %_333995
    %_334181 = load double, double* %_333258
    %_334193 = getelementptr inbounds [0 x double], [0 x double]* %_334080, i64 0, i64 1
    %_334206 = fmul double %_334151, %_334161
    %_334215 = fadd double 0x0000000000000000, %_334206
    %_334228 = fmul double %_334171, %_334181
    %_334239 = fadd double %_334215, %_334228
    store double %_334239, double* %_334193
    %_334254 = load double, double* %_333966
    %_334264 = load double, double* %_333202
    %_334274 = load double, double* %_334024
    %_334284 = load double, double* %_333241
    %_334296 = getelementptr inbounds [0 x double], [0 x double]* %_334080, i64 0, i64 2
    %_334309 = fmul double %_334254, %_334264
    %_334318 = fadd double 0x0000000000000000, %_334309
    %_334331 = fmul double %_334274, %_334284
    %_334342 = fadd double %_334318, %_334331
    store double %_334342, double* %_334296
    %_334357 = load double, double* %_333966
    %_334367 = load double, double* %_333219
    %_334377 = load double, double* %_334024
    %_334387 = load double, double* %_333258
    %_334399 = getelementptr inbounds [0 x double], [0 x double]* %_334080, i64 0, i64 3
    %_334412 = fmul double %_334357, %_334367
    %_334421 = fadd double 0x0000000000000000, %_334412
    %_334434 = fmul double %_334377, %_334387
    %_334445 = fadd double %_334421, %_334434
    store double %_334445, double* %_334399
    %_334454.i8 = call i8* @malloc(i64 32)
    %_334454 = bitcast i8* %_334454.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_334454
    %_334467.i8 = call i8* @malloc(i64 32)
    %_334467 = bitcast i8* %_334467.i8 to [4 x double]*
    %_334477 = load double, double* %_332630
    %_334482 = bitcast [4 x double]* %_334467 to [0 x double]*
    %_334492 = getelementptr inbounds [0 x double], [0 x double]* %_334482, i64 0, i64 0
    store double %_334477, double* %_334492
    %_334509 = load double, double* %_332660
    %_334521 = getelementptr inbounds [0 x double], [0 x double]* %_334482, i64 0, i64 2
    store double %_334509, double* %_334521
    %_334538 = load double, double* %_332683
    %_334550 = getelementptr inbounds [0 x double], [0 x double]* %_334482, i64 0, i64 1
    store double %_334538, double* %_334550
    %_334567 = load double, double* %_332706
    %_334579 = getelementptr inbounds [0 x double], [0 x double]* %_334482, i64 0, i64 3
    store double %_334567, double* %_334579
    %_334590.i8 = call i8* @malloc(i64 32)
    %_334590 = bitcast i8* %_334590.i8 to [4 x double]*
    %_334600 = load double, double* %_333202
    %_334610 = load double, double* %_334492
    %_334620 = load double, double* %_333219
    %_334630 = load double, double* %_334521
    %_334635 = bitcast [4 x double]* %_334590 to [0 x double]*
    %_334645 = getelementptr inbounds [0 x double], [0 x double]* %_334635, i64 0, i64 0
    %_334658 = fmul double %_334600, %_334610
    %_334667 = fadd double 0x0000000000000000, %_334658
    %_334680 = fmul double %_334620, %_334630
    %_334691 = fadd double %_334667, %_334680
    store double %_334691, double* %_334645
    %_334706 = load double, double* %_333202
    %_334716 = load double, double* %_334550
    %_334726 = load double, double* %_333219
    %_334736 = load double, double* %_334579
    %_334748 = getelementptr inbounds [0 x double], [0 x double]* %_334635, i64 0, i64 1
    %_334761 = fmul double %_334706, %_334716
    %_334770 = fadd double 0x0000000000000000, %_334761
    %_334783 = fmul double %_334726, %_334736
    %_334794 = fadd double %_334770, %_334783
    store double %_334794, double* %_334748
    %_334809 = load double, double* %_333241
    %_334819 = load double, double* %_334492
    %_334829 = load double, double* %_333258
    %_334839 = load double, double* %_334521
    %_334851 = getelementptr inbounds [0 x double], [0 x double]* %_334635, i64 0, i64 2
    %_334864 = fmul double %_334809, %_334819
    %_334873 = fadd double 0x0000000000000000, %_334864
    %_334886 = fmul double %_334829, %_334839
    %_334897 = fadd double %_334873, %_334886
    store double %_334897, double* %_334851
    %_334912 = load double, double* %_333241
    %_334922 = load double, double* %_334550
    %_334932 = load double, double* %_333258
    %_334942 = load double, double* %_334579
    %_334954 = getelementptr inbounds [0 x double], [0 x double]* %_334635, i64 0, i64 3
    %_334967 = fmul double %_334912, %_334922
    %_334976 = fadd double 0x0000000000000000, %_334967
    %_334989 = fmul double %_334932, %_334942
    %_335000 = fadd double %_334976, %_334989
    store double %_335000, double* %_334954
    %_335009.i8 = call i8* @malloc(i64 32)
    %_335009 = bitcast i8* %_335009.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_335009
    %_335022.i8 = call i8* @malloc(i64 32)
    %_335022 = bitcast i8* %_335022.i8 to [4 x double]*
    %_335032 = load double, double* %_334090
    %_335042 = load double, double* %_334645
    %_335047 = bitcast [4 x double]* %_335022 to [0 x double]*
    %_335057 = getelementptr inbounds [0 x double], [0 x double]* %_335047, i64 0, i64 0
    %_335070 = fadd double %_335032, %_335042
    store double %_335070, double* %_335057
    %_335085 = load double, double* %_334193
    %_335095 = load double, double* %_334748
    %_335107 = getelementptr inbounds [0 x double], [0 x double]* %_335047, i64 0, i64 1
    %_335120 = fadd double %_335085, %_335095
    store double %_335120, double* %_335107
    %_335135 = load double, double* %_334296
    %_335145 = load double, double* %_334851
    %_335157 = getelementptr inbounds [0 x double], [0 x double]* %_335047, i64 0, i64 2
    %_335170 = fadd double %_335135, %_335145
    store double %_335170, double* %_335157
    %_335185 = load double, double* %_334399
    %_335195 = load double, double* %_334954
    %_335207 = getelementptr inbounds [0 x double], [0 x double]* %_335047, i64 0, i64 3
    %_335220 = fadd double %_335185, %_335195
    store double %_335220, double* %_335207
    %_335229.i8 = call i8* @malloc(i64 32)
    %_335229 = bitcast i8* %_335229.i8 to [4 x double]*
    %_335232 = bitcast [4 x double]* %_334454 to [0 x double]*
    %_335242 = getelementptr inbounds [0 x double], [0 x double]* %_335232, i64 0, i64 0
    %_335250 = load double, double* %_335242
    %_335253 = bitcast [4 x double]* %_335009 to [0 x double]*
    %_335263 = getelementptr inbounds [0 x double], [0 x double]* %_335253, i64 0, i64 0
    %_335271 = load double, double* %_335263
    %_335276 = bitcast [4 x double]* %_335229 to [0 x double]*
    %_335286 = getelementptr inbounds [0 x double], [0 x double]* %_335276, i64 0, i64 0
    %_335299 = fadd double %_335250, %_335271
    store double %_335299, double* %_335286
    %_335316 = getelementptr inbounds [0 x double], [0 x double]* %_335232, i64 0, i64 1
    %_335324 = load double, double* %_335316
    %_335336 = getelementptr inbounds [0 x double], [0 x double]* %_335253, i64 0, i64 1
    %_335344 = load double, double* %_335336
    %_335356 = getelementptr inbounds [0 x double], [0 x double]* %_335276, i64 0, i64 1
    %_335369 = fadd double %_335324, %_335344
    store double %_335369, double* %_335356
    %_335386 = getelementptr inbounds [0 x double], [0 x double]* %_335232, i64 0, i64 2
    %_335394 = load double, double* %_335386
    %_335406 = getelementptr inbounds [0 x double], [0 x double]* %_335253, i64 0, i64 2
    %_335414 = load double, double* %_335406
    %_335426 = getelementptr inbounds [0 x double], [0 x double]* %_335276, i64 0, i64 2
    %_335439 = fadd double %_335394, %_335414
    store double %_335439, double* %_335426
    %_335456 = getelementptr inbounds [0 x double], [0 x double]* %_335232, i64 0, i64 3
    %_335464 = load double, double* %_335456
    %_335476 = getelementptr inbounds [0 x double], [0 x double]* %_335253, i64 0, i64 3
    %_335484 = load double, double* %_335476
    %_335496 = getelementptr inbounds [0 x double], [0 x double]* %_335276, i64 0, i64 3
    %_335509 = fadd double %_335464, %_335484
    store double %_335509, double* %_335496
    call void @printLine([0 x i8]* %_332830)
    br label %printLine_cont_335517

printLine_cont_335517:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_335519

printString_cont_335519:
    %_335528 = load double, double* %_335057
    call void @printDouble(double %_335528)
    br label %eta_while_head_335533

eta_while_head_335533:
    %_335542 = load double, double* %_335107
    call void @printDouble(double %_335542)
    br label %eta_while_head_335547

eta_while_head_335547:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_335549

eta_while_head_335549:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_335551

printString_cont_335551:
    %_335560 = load double, double* %_335157
    call void @printDouble(double %_335560)
    br label %eta_while_head_335565

eta_while_head_335565:
    %_335574 = load double, double* %_335207
    call void @printDouble(double %_335574)
    br label %eta_while_head_335579

eta_while_head_335579:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_335581

eta_while_head_335581:
    call void @printLine([0 x i8]* %_333104)
    br label %print_matrix_cont_335587

print_matrix_cont_335587:
    call void @printLine([0 x i8]* %_332830)
    br label %printLine_cont_335589

printLine_cont_335589:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_335591

printString_cont_335591:
    %_335600 = load double, double* %_335286
    call void @printDouble(double %_335600)
    br label %eta_while_head_335605

eta_while_head_335605:
    %_335614 = load double, double* %_335356
    call void @printDouble(double %_335614)
    br label %eta_while_head_335619

eta_while_head_335619:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_335621

eta_while_head_335621:
    call void @printString([0 x i8]* %_332899)
    br label %printString_cont_335623

printString_cont_335623:
    %_335632 = load double, double* %_335426
    call void @printDouble(double %_335632)
    br label %eta_while_head_335637

eta_while_head_335637:
    %_335646 = load double, double* %_335496
    call void @printDouble(double %_335646)
    br label %eta_while_head_335651

eta_while_head_335651:
    call void @printLine([0 x i8]* %_333064)
    br label %eta_while_head_335653

eta_while_head_335653:
    call void @printLine([0 x i8]* %_333104)
    br label %print_matrix_cont_335659

print_matrix_cont_335659:
    br label %return_335670

return_335670:
    %_340811 = phi i32 [ 0, %print_matrix_cont_335659 ]
    ret i32 %_340811

}


