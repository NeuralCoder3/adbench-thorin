
declare double @llvm.exp.f64(double)
declare double @llvm.log.f64(double)
declare i8* @malloc(i64)
declare void @printDouble(double)
declare double @tanh(double)
declare void @printString([0 x i8]*)
declare void @read_lstm_instance([0 x i8]*, i32*, i32*, i32*, [0 x double]**, [0 x double]**, [0 x double]**, [0 x double]**)

@_479562 = global [23 x i8] [i8 78, i8 111, i8 32, i8 66, i8 101, i8 110, i8 99, i8 104, i8 109, i8 97, i8 114, i8 107, i8 32, i8 115, i8 112, i8 101, i8 99, i8 105, i8 102, i8 105, i8 101, i8 100, i8 0]

define i32 @main(i32 %argc_479598, [0 x [0 x i8]*]* %argv_476649) {
main_476517:
    %sum_477801 = alloca double
    %input_477394 = alloca [0 x double]*
    %count_477093 = alloca i32
    %total_477047 = alloca double
    %sequence_476829 = alloca [0 x double]*
    %state_476824 = alloca [0 x double]*
    %extra_params_476819 = alloca [0 x double]*
    %main_params_476814 = alloca [0 x double]*
    %b_476809 = alloca i32
    %c_476804 = alloca i32
    %l_476799 = alloca i32
    %_479603 = icmp slt i32 %argc_479598, 2
    %_476671 = zext i32 1 to i64
    %_479582 = bitcast [23 x i8]* @_479562 to [0 x i8]*
    br i1 %_479603, label %if_then_479542, label %if_else_476536

if_else_476536:
    %_476681 = getelementptr inbounds [0 x [0 x i8]*], [0 x [0 x i8]*]* %argv_476649, i64 0, i64 %_476671
    %_476689 = load [0 x i8]*, [0 x i8]** %_476681
    call void @printString([0 x i8]* %_476689)
    br label %printString_cont_476694

printString_cont_476694:
    call void @read_lstm_instance([0 x i8]* %_476689, i32* %l_476799, i32* %c_476804, i32* %b_476809, [0 x double]** %main_params_476814, [0 x double]** %extra_params_476819, [0 x double]** %state_476824, [0 x double]** %sequence_476829)
    br label %read_lstm_instance_cont_476846

read_lstm_instance_cont_476846:
    %_476982 = load i32, i32* %l_476799
    %_476992 = load i32, i32* %c_476804
    %_477002 = load i32, i32* %b_476809
    %_479524 = add nsw i32 4294967295, %_476992
    %_479529 = mul nsw i32 %_477002, %_479524
    %_477012 = load [0 x double]*, [0 x double]** %main_params_476814
    %_477022 = load [0 x double]*, [0 x double]** %extra_params_476819
    %_477032 = load [0 x double]*, [0 x double]** %state_476824
    %_477042 = load [0 x double]*, [0 x double]** %sequence_476829
    store double 0x0000000000000000, double* %total_477047
    store i32 0, i32* %count_477093
    store [0 x double]* %_477042, [0 x double]** %input_477394
    %_477573 = zext i32 %_477002 to i64
    %_477607 = mul nsw nuw i64 %_477573, 8
    %_477609.i8 = call i8* @malloc(i64 %_477607)
    %_477609 = bitcast i8* %_477609.i8 to [0 x double]*
    %_477613.i8 = call i8* @malloc(i64 %_477607)
    %_477613 = bitcast i8* %_477613.i8 to [0 x double]*
    %_477730 = bitcast [0 x double]* %_477609 to [0 x double]*
    %_479344 = mul nsw i32 2, %_476982
    %_479349 = mul nsw i32 %_477002, %_479344
    %_479356 = add nsw i32 4294967295, %_479349
    %_477616 = bitcast [0 x double]* %_477613 to [0 x double]*
    %_478048 = mul nsw i32 2, %_477002
    %_479188 = mul nsw i32 3, %_477002
    br label %for_476861

for_476861:
    %step_477301 = phi i32 [ 1, %read_lstm_instance_cont_476846 ], [ %step_477301, %yield_477283 ]
    %begin_477295 = phi i32 [ 0, %read_lstm_instance_cont_476846 ], [ %_477306, %yield_477283 ]
    %end_477311 = phi i32 [ %_479529, %read_lstm_instance_cont_476846 ], [ %end_477311, %yield_477283 ]
    %_479509 = icmp ult i32 %begin_477295, %end_477311
    br i1 %_479509, label %lambda_477211, label %_476864

_476864:
    br label %break_476869

break_476869:
    %_477057 = load double, double* %total_477047
    %_477103 = load i32, i32* %count_477093
    %_477130 = fsub double 0x8000000000000000, %_477057
    %_477166 = sitofp i32 %_477103 to double
    %_477171 = fdiv double %_477130, %_477166
    call void @printDouble(double %_477171)
    br label %eta_if_join_477175

eta_if_join_477175:
    br label %if_join_477178

lambda_477211:
    %_479396 = load [0 x double]*, [0 x double]** %input_477394
    br label %while_head_477220

while_head_477220:
    %_479401 = phi i32 [ 0, %lambda_477211 ], [ %_479484, %while_body_479372 ]
    %_479495 = icmp slt i32 %_479401, %_477002
    br i1 %_479495, label %while_body_479372, label %break_477227

while_body_479372:
    %_479402 = zext i32 %_479401 to i64
    %_479412 = getelementptr inbounds [0 x double], [0 x double]* %_479396, i64 0, i64 %_479402
    %_479420 = load double, double* %_479412
    %_479432 = getelementptr inbounds [0 x double], [0 x double]* %_477022, i64 0, i64 %_479402
    %_479440 = load double, double* %_479432
    %_479455 = getelementptr inbounds [0 x double], [0 x double]* %_477730, i64 0, i64 %_479402
    %_479466 = fmul double %_479420, %_479440
    store double %_479466, double* %_479455
    %_479484 = add nsw i32 1, %_479401
    br label %while_head_477220

break_477227:
    br label %while_head_477235

while_head_477235:
    %_477973 = phi [0 x double]* [ %_477730, %break_477227 ], [ %_478218, %lstm_model_cont_478185 ]
    %_478191 = phi i32 [ 0, %break_477227 ], [ %_478196, %lstm_model_cont_478185 ]
    %_479361 = icmp sle i32 %_478191, %_479356
    br i1 %_479361, label %while_body_478146, label %break_477242

break_477242:
    br label %while_head_477246

while_head_477246:
    %_477976 = phi i32 [ 0, %break_477242 ], [ %_478125, %while_body_477954 ]
    %_478136 = icmp slt i32 %_477976, %_477002
    br i1 %_478136, label %while_body_477954, label %lstm_predict_cont_477259

lstm_predict_cont_477259:
    store double 0x4000000000000000, double* %sum_477801
    br label %for_477260

for_477260:
    %begin_477850 = phi i32 [ 0, %lstm_predict_cont_477259 ], [ %_477857, %yield_477848 ]
    %end_477859 = phi i32 [ %_477002, %lstm_predict_cont_477259 ], [ %end_477859, %yield_477848 ]
    %step_477852 = phi i32 [ 1, %lstm_predict_cont_477259 ], [ %step_477852, %yield_477848 ]
    %_477930 = icmp ult i32 %begin_477850, %end_477859
    br i1 %_477930, label %lambda_477846, label %_477261

lambda_477846:
    %_477871 = zext i32 %begin_477850 to i64
    %_477881 = getelementptr inbounds [0 x double], [0 x double]* %_477730, i64 0, i64 %_477871
    %_477889 = load double, double* %_477881
    %_477899 = load double, double* %sum_477801
    %_477909 = tail call double @llvm.exp.f64(double %_477889)
    %_477916 = fadd double %_477909, %_477899
    store double %_477916, double* %sum_477801
    br label %yield_477848

yield_477848:
    %_477857 = add i32 %begin_477850, %step_477852
    br label %for_477260

_477261:
    br label %break_477264

break_477264:
    %_477811 = load double, double* %sum_477801
    %_477814 = tail call double @llvm.log.f64(double %_477811)
    br label %for_477265

for_477265:
    %end_477716 = phi i32 [ %_477002, %break_477264 ], [ %end_477716, %yield_477705 ]
    %step_477709 = phi i32 [ 1, %break_477264 ], [ %step_477709, %yield_477705 ]
    %begin_477707 = phi i32 [ 0, %break_477264 ], [ %_477714, %yield_477705 ]
    %_477833 = icmp ult i32 %begin_477707, %end_477716
    br i1 %_477833, label %lambda_477703, label %_477266

_477266:
    br label %break_477270

break_477270:
    %_477475 = mul nsw i32 %begin_477295, %_477002
    %_477480 = add nsw i32 %_477002, %_477475
    %_477481 = zext i32 %_477480 to i64
    %_477491 = getelementptr inbounds [0 x double], [0 x double]* %_477042, i64 0, i64 %_477481
    %_477492 = bitcast double* %_477491 to [0 x double]*
    br label %for_477271

for_477271:
    %end_477521 = phi i32 [ %_477002, %break_477270 ], [ %end_477521, %yield_477510 ]
    %step_477514 = phi i32 [ 1, %break_477270 ], [ %step_477514, %yield_477510 ]
    %begin_477512 = phi i32 [ 0, %break_477270 ], [ %_477519, %yield_477510 ]
    %_477690 = icmp ult i32 %begin_477512, %end_477521
    br i1 %_477690, label %lambda_477508, label %_477272

lambda_477508:
    %_477536 = zext i32 %begin_477512 to i64
    %_477546 = getelementptr inbounds [0 x double], [0 x double]* %_477492, i64 0, i64 %_477536
    %_477554 = load double, double* %_477546
    %_477626 = getelementptr inbounds [0 x double], [0 x double]* %_477616, i64 0, i64 %_477536
    %_477634 = load double, double* %_477626
    %_477644 = load double, double* %total_477047
    %_477663 = fmul double %_477554, %_477634
    %_477670 = fadd double %_477663, %_477644
    store double %_477670, double* %total_477047
    br label %yield_477510

yield_477510:
    %_477519 = add i32 %begin_477512, %step_477514
    br label %for_477271

_477272:
    br label %break_477276

break_477276:
    %_477352 = load i32, i32* %count_477093
    %_477369 = add nsw i32 %_477002, %_477352
    store i32 %_477369, i32* %count_477093
    store [0 x double]* %_477492, [0 x double]** %input_477394
    br label %yield_477283

yield_477283:
    %_477306 = add i32 %begin_477295, %step_477301
    br label %for_476861

lambda_477703:
    %_477731 = zext i32 %begin_477707 to i64
    %_477741 = getelementptr inbounds [0 x double], [0 x double]* %_477730, i64 0, i64 %_477731
    %_477749 = load double, double* %_477741
    %_477764 = getelementptr inbounds [0 x double], [0 x double]* %_477616, i64 0, i64 %_477731
    %_477819 = fsub double %_477749, %_477814
    store double %_477819, double* %_477764
    br label %yield_477705

yield_477705:
    %_477714 = add i32 %begin_477707, %step_477709
    br label %for_477265

while_body_477954:
    %_477977 = zext i32 %_477976 to i64
    %_477987 = getelementptr inbounds [0 x double], [0 x double]* %_477973, i64 0, i64 %_477977
    %_477995 = load double, double* %_477987
    %_478008 = add nsw i32 %_477002, %_477976
    %_478009 = zext i32 %_478008 to i64
    %_478019 = getelementptr inbounds [0 x double], [0 x double]* %_477022, i64 0, i64 %_478009
    %_478027 = load double, double* %_478019
    %_478053 = add nsw i32 %_477976, %_478048
    %_478054 = zext i32 %_478053 to i64
    %_478064 = getelementptr inbounds [0 x double], [0 x double]* %_477022, i64 0, i64 %_478054
    %_478072 = load double, double* %_478064
    %_478087 = getelementptr inbounds [0 x double], [0 x double]* %_477730, i64 0, i64 %_477977
    %_478100 = fmul double %_477995, %_478027
    %_478107 = fadd double %_478100, %_478072
    store double %_478107, double* %_478087
    %_478125 = add nsw i32 1, %_477976
    br label %while_head_477246

while_body_478146:
    %_478270.i8 = call i8* @malloc(i64 %_477607)
    %_478270 = bitcast i8* %_478270.i8 to [0 x double]*
    %_478274.i8 = call i8* @malloc(i64 %_477607)
    %_478274 = bitcast i8* %_478274.i8 to [0 x double]*
    %_478278.i8 = call i8* @malloc(i64 %_477607)
    %_478278 = bitcast i8* %_478278.i8 to [0 x double]*
    %_478534.i8 = call i8* @malloc(i64 %_477607)
    %_478534 = bitcast i8* %_478534.i8 to [0 x double]*
    %_478754 = mul nsw i32 4, %_478191
    %_478755 = zext i32 %_478754 to i64
    %_478765 = getelementptr inbounds [0 x double], [0 x double]* %_477012, i64 0, i64 %_478755
    %_478766 = bitcast double* %_478765 to [0 x double]*
    %_478324 = add nsw i32 %_477002, %_478191
    %_478805 = mul nsw i32 4, %_478324
    %_478806 = zext i32 %_478805 to i64
    %_478816 = getelementptr inbounds [0 x double], [0 x double]* %_477012, i64 0, i64 %_478806
    %_478817 = bitcast double* %_478816 to [0 x double]*
    %_478483 = bitcast [0 x double]* %_478270 to [0 x double]*
    %_478207 = zext i32 %_478191 to i64
    %_478217 = getelementptr inbounds [0 x double], [0 x double]* %_477032, i64 0, i64 %_478207
    %_478218 = bitcast double* %_478217 to [0 x double]*
    %_478506 = bitcast [0 x double]* %_478274 to [0 x double]*
    %_478281 = bitcast [0 x double]* %_478278 to [0 x double]*
    %_478537 = bitcast [0 x double]* %_478534 to [0 x double]*
    br label %while_head_478150

while_head_478150:
    %_478709 = phi i32 [ 0, %while_body_478146 ], [ %_479294, %tanh_cont_479255 ]
    %_479314 = icmp slt i32 %_478709, %_477002
    br i1 %_479314, label %while_body_478626, label %break_478157

while_body_478626:
    %_478710 = zext i32 %_478709 to i64
    %_478720 = getelementptr inbounds [0 x double], [0 x double]* %_477973, i64 0, i64 %_478710
    %_478728 = load double, double* %_478720
    %_478776 = getelementptr inbounds [0 x double], [0 x double]* %_478766, i64 0, i64 %_478710
    %_478784 = load double, double* %_478776
    %_478827 = getelementptr inbounds [0 x double], [0 x double]* %_478817, i64 0, i64 %_478710
    %_478835 = load double, double* %_478827
    %_478850 = fmul double %_478728, %_478784
    %_478857 = fadd double %_478850, %_478835
    %sigmoid_cont_479304.ret = call double @sigmoid_478636(double %_478857)
    br label %sigmoid_cont_478858

sigmoid_cont_478858:
    %sigmoid_478895 = phi double [ %sigmoid_cont_479304.ret, %while_body_478626 ]
    %_478893 = getelementptr inbounds [0 x double], [0 x double]* %_478483, i64 0, i64 %_478710
    store double %sigmoid_478895, double* %_478893
    %_478912 = getelementptr inbounds [0 x double], [0 x double]* %_478218, i64 0, i64 %_478710
    %_478920 = load double, double* %_478912
    %_478931 = add nsw i32 %_477002, %_478709
    %_478932 = zext i32 %_478931 to i64
    %_478942 = getelementptr inbounds [0 x double], [0 x double]* %_478766, i64 0, i64 %_478932
    %_478950 = load double, double* %_478942
    %_478962 = getelementptr inbounds [0 x double], [0 x double]* %_478817, i64 0, i64 %_478932
    %_478970 = load double, double* %_478962
    %_478985 = fmul double %_478920, %_478950
    %_478992 = fadd double %_478985, %_478970
    %sigmoid_cont_479302.ret = call double @sigmoid_478636(double %_478992)
    br label %sigmoid_cont_478993

sigmoid_cont_478993:
    %sigmoid_479030 = phi double [ %sigmoid_cont_479302.ret, %sigmoid_cont_478858 ]
    %_479028 = getelementptr inbounds [0 x double], [0 x double]* %_478506, i64 0, i64 %_478710
    store double %sigmoid_479030, double* %_479028
    %_479045 = load double, double* %_478720
    %_479055 = add nsw i32 %_478048, %_478709
    %_479056 = zext i32 %_479055 to i64
    %_479066 = getelementptr inbounds [0 x double], [0 x double]* %_478766, i64 0, i64 %_479056
    %_479074 = load double, double* %_479066
    %_479086 = getelementptr inbounds [0 x double], [0 x double]* %_478817, i64 0, i64 %_479056
    %_479094 = load double, double* %_479086
    %_479109 = fmul double %_479045, %_479074
    %_479116 = fadd double %_479109, %_479094
    %sigmoid_cont_479300.ret = call double @sigmoid_478636(double %_479116)
    br label %sigmoid_cont_479117

sigmoid_cont_479117:
    %sigmoid_479154 = phi double [ %sigmoid_cont_479300.ret, %sigmoid_cont_478993 ]
    %_479152 = getelementptr inbounds [0 x double], [0 x double]* %_478281, i64 0, i64 %_478710
    store double %sigmoid_479154, double* %_479152
    %_479169 = load double, double* %_478912
    %_479193 = add nsw i32 %_478709, %_479188
    %_479194 = zext i32 %_479193 to i64
    %_479204 = getelementptr inbounds [0 x double], [0 x double]* %_478766, i64 0, i64 %_479194
    %_479212 = load double, double* %_479204
    %_479224 = getelementptr inbounds [0 x double], [0 x double]* %_478817, i64 0, i64 %_479194
    %_479232 = load double, double* %_479224
    %_479247 = fmul double %_479169, %_479212
    %_479254 = fadd double %_479247, %_479232
    %tanh_cont_479298.ret = call double @tanh(double %_479254)
    br label %tanh_cont_479255

tanh_cont_479255:
    %tanh_479276 = phi double [ %tanh_cont_479298.ret, %sigmoid_cont_479117 ]
    %_479274 = getelementptr inbounds [0 x double], [0 x double]* %_478537, i64 0, i64 %_478710
    store double %tanh_479276, double* %_479274
    %_479294 = add nsw i32 1, %_478709
    br label %while_head_478150

break_478157:
    %_478325 = zext i32 %_478324 to i64
    %_478335 = getelementptr inbounds [0 x double], [0 x double]* %_477032, i64 0, i64 %_478325
    %_478336 = bitcast double* %_478335 to [0 x double]*
    br label %while_head_478161

while_head_478161:
    %_478459 = phi i32 [ 0, %break_478157 ], [ %_478604, %while_body_478437 ]
    %_478615 = icmp slt i32 %_478459, %_477002
    br i1 %_478615, label %while_body_478437, label %break_478168

break_478168:
    br label %while_head_478172

while_head_478172:
    %_478284 = phi i32 [ 0, %break_478168 ], [ %_478413, %tanh_cont_478359 ]
    %_478426 = icmp slt i32 %_478284, %_477002
    br i1 %_478426, label %while_body_478223, label %lstm_model_cont_478185

lstm_model_cont_478185:
    %_478196 = add nsw i32 %_478048, %_478191
    br label %while_head_477235

while_body_478223:
    %_478285 = zext i32 %_478284 to i64
    %_478295 = getelementptr inbounds [0 x double], [0 x double]* %_478281, i64 0, i64 %_478285
    %_478303 = load double, double* %_478295
    %_478346 = getelementptr inbounds [0 x double], [0 x double]* %_478336, i64 0, i64 %_478285
    %_478354 = load double, double* %_478346
    %tanh_cont_478417.ret = call double @tanh(double %_478354)
    br label %tanh_cont_478359

tanh_cont_478359:
    %tanh_478388 = phi double [ %tanh_cont_478417.ret, %while_body_478223 ]
    %_478384 = getelementptr inbounds [0 x double], [0 x double]* %_478218, i64 0, i64 %_478285
    %_478395 = fmul double %tanh_478388, %_478303
    store double %_478395, double* %_478384
    %_478413 = add nsw i32 1, %_478284
    br label %while_head_478172

while_body_478437:
    %_478460 = zext i32 %_478459 to i64
    %_478470 = getelementptr inbounds [0 x double], [0 x double]* %_478336, i64 0, i64 %_478460
    %_478478 = load double, double* %_478470
    %_478493 = getelementptr inbounds [0 x double], [0 x double]* %_478483, i64 0, i64 %_478460
    %_478501 = load double, double* %_478493
    %_478516 = getelementptr inbounds [0 x double], [0 x double]* %_478506, i64 0, i64 %_478460
    %_478524 = load double, double* %_478516
    %_478547 = getelementptr inbounds [0 x double], [0 x double]* %_478537, i64 0, i64 %_478460
    %_478555 = load double, double* %_478547
    %_478570 = fmul double %_478478, %_478501
    %_478581 = fmul double %_478524, %_478555
    %_478586 = fadd double %_478570, %_478581
    store double %_478586, double* %_478470
    %_478604 = add nsw i32 1, %_478459
    br label %while_head_478161

if_then_479542:
    call void @printString([0 x i8]* %_479582)
    br label %eta_if_join_479583

eta_if_join_479583:
    br label %if_join_477178

if_join_477178:
    br label %return_477188

return_477188:
    %_481561 = phi i32 [ 0, %if_join_477178 ]
    ret i32 %_481561

}

define double @sigmoid_478636(double %x_478675) {
sigmoid_478636:
    %_478680 = fsub double 0x8000000000000000, %x_478675
    %_478681 = tail call double @llvm.exp.f64(double %_478680)
    %_478686 = fadd double 0x3ff0000000000000, %_478681
    %_478691 = fdiv double 0x3ff0000000000000, %_478686
    br label %return_478643

return_478643:
    %_481696 = phi double [ %_478691, %sigmoid_478636 ]
    ret double %_481696

}


