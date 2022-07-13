declare i8* @malloc(i64)

declare void @printLine([0 x i8]*)
declare void @dgemm(i64, i64, i64, [0 x double]*, [0 x double]*, [0 x double]*)
declare void @printDouble(double)
declare void @printString([0 x i8]*)

@_1173140 = global {i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 0}
@_1174886 = global {i64, [0 x double]*} {i64 0, [0 x double]* undef}
@_1174832 = global {i64, [0 x double]*} {i64 0, [0 x double]* undef}
@_1174749 = global {i64, [0 x double]*} {i64 0, [0 x double]* undef}
@_1174628 = global {i64, [0 x double]*} {i64 0, [0 x double]* undef}
@_1174545 = global {i64, [0 x double]*} {i64 0, [0 x double]* undef}
@_1174123 = global {i64, [0 x double]*} {i64 0, [0 x double]* undef}
@_1172441 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_1172478 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_1172544 = global {i8, i8} {i8 124, i8 0}
@_1172565 = global {i8, i8} {i8 124, i8 0}

define i32 @main() {
main_1171113:
    %_1172238.i8 = call i8* @malloc(i64 32)
    %_1172238 = bitcast i8* %_1172238.i8 to [4 x double]*
    %_1172242.i8 = call i8* @malloc(i64 32)
    %_1172242 = bitcast i8* %_1172242.i8 to [4 x double]*
    %_1172332 = bitcast [4 x double]* %_1172238 to [0 x double]*
    %_1173142 = bitcast {i8, i8, i8, i8}* @_1173140 to [0 x i8]*
    call void @matrix_init_1171153([0 x double]* %_1172332, double 0x3ff0000000000000)
    br label %matrix_init_cont_1172349

matrix_init_cont_1172349:
    %_1172353 = bitcast [4 x double]* %_1172242 to [0 x double]*
    call void @matrix_init_1171153([0 x double]* %_1172353, double 0x4000000000000000)
    br label %matrix_init_cont_1172363

matrix_init_cont_1172363:
    call void @print_matrix_1172379([0 x double]* %_1172332, i64 2, i64 2)
    br label %print_matrix_cont_1172847

print_matrix_cont_1172847:
    call void @print_matrix_1172379([0 x double]* %_1172353, i64 2, i64 2)
    br label %print_matrix_cont_1172853

print_matrix_cont_1172853:
    %_1173018.i8 = call i8* @malloc(i64 32)
    %_1173018 = bitcast i8* %_1173018.i8 to [4 x double]*
    %_1173023 = bitcast [4 x double]* %_1173018 to [0 x double]*
    call void @iter_1172858([0 x double]* %_1173023)
    br label %matrix_zero_cont_1173030

matrix_zero_cont_1173030:
    %_1173041 = getelementptr inbounds [0 x double], [0 x double]* %_1173023, i64 0, i64 0
    store double 0x3ff0000000000000, double* %_1173041
    %_1173058 = getelementptr inbounds [0 x double], [0 x double]* %_1173023, i64 0, i64 1
    store double 0x0000000000000000, double* %_1173058
    %_1173075 = getelementptr inbounds [0 x double], [0 x double]* %_1173023, i64 0, i64 2
    store double 0x0000000000000000, double* %_1173075
    %_1173093 = getelementptr inbounds [0 x double], [0 x double]* %_1173023, i64 0, i64 3
    store double 0x0000000000000000, double* %_1173093
    call void @printLine([0 x i8]* %_1173142)
    br label %printLine_cont_1173147

printLine_cont_1173147:
    br label %while_head_1173155

while_head_1173155:
    %_1173166 = phi [0 x double]* [ %_1172332, %printLine_cont_1173147 ], [ %_1173765, %loop_exit_1173704 ], [ %_1173166, %left_mat_lam_1174250 ]
    %_1173748 = phi i32 [ 0, %printLine_cont_1173147 ], [ %_1173762, %loop_exit_1173704 ], [ %_1173762, %left_mat_lam_1174250 ]
    %_1173170 = phi i64 [ 2, %printLine_cont_1173147 ], [ %_1173689, %loop_exit_1173704 ], [ %_1173170, %left_mat_lam_1174250 ]
    %_1173168 = phi i64 [ 2, %printLine_cont_1173147 ], [ %_1173687, %loop_exit_1173704 ], [ %_1173168, %left_mat_lam_1174250 ]
    %_1174976 = icmp slt i32 %_1173748, 3
    br i1 %_1174976, label %eta_while_body_1173200, label %break_1173162

break_1173162:
    call void @print_matrix_1172379([0 x double]* %_1173166, i64 %_1173168, i64 %_1173170)
    br label %print_matrix_cont_1173175

print_matrix_cont_1173175:
    br label %return_1173183

return_1173183:
    %_1175788 = phi i32 [ 0, %print_matrix_cont_1173175 ]
    ret i32 %_1175788

eta_while_body_1173200:
    %_1174910 = load {i64, [0 x double]*}, {i64, [0 x double]*}* @_1174886
    %_1174919 = extractvalue {i64, [0 x double]*} %_1174910, 0
    %_1174926 = icmp uge i64 %_1174919, 4
    br i1 %_1174926, label %memory_reuse_1174900, label %memory_alloc_1173206

memory_alloc_1173206:
    %_1174883.i8 = call i8* @malloc(i64 32)
    %_1174883 = bitcast i8* %_1174883.i8 to [4 x double]*
    %_1174890.0 = insertvalue {i64, [0 x double]*} undef, i64 4, 0
    %_1174889 = bitcast [4 x double]* %_1174883 to [0 x double]*
    %_1174890.1 = insertvalue {i64, [0 x double]*} %_1174890.0, [0 x double]* %_1174889, 1
    store {i64, [0 x double]*} %_1174890.1, {i64, [0 x double]*}* @_1174886
    br label %impl_memory_entry_1173212

memory_reuse_1174900:
    %_1174914 = extractvalue {i64, [0 x double]*} %_1174910, 1
    br label %impl_memory_entry_1173212

impl_memory_entry_1173212:
    %_1173280 = phi [0 x double]* [ %_1174889, %memory_alloc_1173206 ], [ %_1174914, %memory_reuse_1174900 ]
    %_1174880.ret = call {i64, [0 x double]*, i64, i64} @mop_vec_impl_1173226([0 x double]* %_1172332, i64 2, i64 2, [0 x double]* %_1172353, i64 2, [0 x double]* %_1173280)
    br label %mop_vec_entry_mop_result_1173289

mop_vec_entry_mop_result_1173289:
    %_1176060 = phi {i64, [0 x double]*, i64, i64} [ %_1174880.ret, %impl_memory_entry_1173212 ]
    %_1174858 = load {i64, [0 x double]*}, {i64, [0 x double]*}* @_1174832
    %_1174867 = extractvalue {i64, [0 x double]*} %_1174858, 0
    %_1174874 = icmp uge i64 %_1174867, 4
    br i1 %_1174874, label %memory_reuse_1174846, label %memory_alloc_1173290

memory_reuse_1174846:
    %_1174862 = extractvalue {i64, [0 x double]*} %_1174858, 1
    br label %impl_memory_entry_1173291

memory_alloc_1173290:
    %_1174829.i8 = call i8* @malloc(i64 32)
    %_1174829 = bitcast i8* %_1174829.i8 to [4 x double]*
    %_1174836.0 = insertvalue {i64, [0 x double]*} undef, i64 4, 0
    %_1174835 = bitcast [4 x double]* %_1174829 to [0 x double]*
    %_1174836.1 = insertvalue {i64, [0 x double]*} %_1174836.0, [0 x double]* %_1174835, 1
    store {i64, [0 x double]*} %_1174836.1, {i64, [0 x double]*}* @_1174832
    br label %impl_memory_entry_1173291

impl_memory_entry_1173291:
    %_1173612 = phi [0 x double]* [ %_1174862, %memory_reuse_1174846 ], [ %_1174835, %memory_alloc_1173290 ]
    %_1174826.ret = call {i64, [0 x double]*, i64, i64} @mop_transpose_impl_1173304([0 x double]* %_1172353, [0 x double]* %_1173612)
    br label %mop_transpose_entry_mop_result_1173621

mop_transpose_entry_mop_result_1173621:
    %_1173629 = phi {i64, [0 x double]*, i64, i64} [ %_1174826.ret, %impl_memory_entry_1173291 ]
    %_1174804 = load {i64, [0 x double]*}, {i64, [0 x double]*}* @_1174749
    %_1174813 = extractvalue {i64, [0 x double]*} %_1174804, 0
    %_1173633 = extractvalue {i64, [0 x double]*, i64, i64} %_1173629, 3
    %_1174690 = mul i64 2, %_1173633
    %_1174820 = icmp uge i64 %_1174813, %_1174690
    br i1 %_1174820, label %memory_reuse_1174793, label %memory_alloc_1173622

memory_alloc_1173622:
    %_1174743 = mul i64 16, %_1173633
    %_1174744 = bitcast i64 %_1174743 to i64
    %_1174746.i8 = call i8* @malloc(i64 %_1174744)
    %_1174746 = bitcast i8* %_1174746.i8 to [0 x double]*
    %_1174783.0 = insertvalue {i64, [0 x double]*} undef, i64 %_1174690, 0
    %_1174782 = bitcast [0 x double]* %_1174746 to [0 x double]*
    %_1174783.1 = insertvalue {i64, [0 x double]*} %_1174783.0, [0 x double]* %_1174782, 1
    store {i64, [0 x double]*} %_1174783.1, {i64, [0 x double]*}* @_1174749
    br label %impl_memory_entry_1173623

memory_reuse_1174793:
    %_1174808 = extractvalue {i64, [0 x double]*} %_1174804, 1
    br label %impl_memory_entry_1173623

impl_memory_entry_1173623:
    %_1173635 = phi [0 x double]* [ %_1174782, %memory_alloc_1173622 ], [ %_1174808, %memory_reuse_1174793 ]
    %_1173631 = extractvalue {i64, [0 x double]*, i64, i64} %_1173629, 1
    %_1174676.ret = call {i64, [0 x double]*, i64, i64} @mop_vec_impl_1173226([0 x double]* %_1173023, i64 2, i64 2, [0 x double]* %_1173631, i64 %_1173633, [0 x double]* %_1173635)
    br label %mop_vec_entry_mop_result_1173636

mop_vec_entry_mop_result_1173636:
    %_1174327 = phi {i64, [0 x double]*, i64, i64} [ %_1174676.ret, %impl_memory_entry_1173623 ]
    %_1174654 = load {i64, [0 x double]*}, {i64, [0 x double]*}* @_1174628
    %_1174663 = extractvalue {i64, [0 x double]*} %_1174654, 0
    %_1174670 = icmp uge i64 %_1174663, 4
    br i1 %_1174670, label %memory_reuse_1174643, label %memory_alloc_1173637

memory_alloc_1173637:
    %_1174625.i8 = call i8* @malloc(i64 32)
    %_1174625 = bitcast i8* %_1174625.i8 to [4 x double]*
    %_1174633.0 = insertvalue {i64, [0 x double]*} undef, i64 4, 0
    %_1174632 = bitcast [4 x double]* %_1174625 to [0 x double]*
    %_1174633.1 = insertvalue {i64, [0 x double]*} %_1174633.0, [0 x double]* %_1174632, 1
    store {i64, [0 x double]*} %_1174633.1, {i64, [0 x double]*}* @_1174628
    br label %impl_memory_entry_1173638

memory_reuse_1174643:
    %_1174658 = extractvalue {i64, [0 x double]*} %_1174654, 1
    br label %impl_memory_entry_1173638

impl_memory_entry_1173638:
    %_1173643 = phi [0 x double]* [ %_1174632, %memory_alloc_1173637 ], [ %_1174658, %memory_reuse_1174643 ]
    %_1174622.ret = call {i64, [0 x double]*, i64, i64} @mop_transpose_impl_1173304([0 x double]* %_1172332, [0 x double]* %_1173643)
    br label %mop_transpose_entry_mop_result_1173644

mop_transpose_entry_mop_result_1173644:
    %_1173652 = phi {i64, [0 x double]*, i64, i64} [ %_1174622.ret, %impl_memory_entry_1173638 ]
    %_1174600 = load {i64, [0 x double]*}, {i64, [0 x double]*}* @_1174545
    %_1174609 = extractvalue {i64, [0 x double]*} %_1174600, 0
    %_1173656 = extractvalue {i64, [0 x double]*, i64, i64} %_1173652, 2
    %_1174408 = mul i64 2, %_1173656
    %_1174616 = icmp uge i64 %_1174609, %_1174408
    br i1 %_1174616, label %memory_reuse_1174589, label %memory_alloc_1173645

memory_reuse_1174589:
    %_1174604 = extractvalue {i64, [0 x double]*} %_1174600, 1
    br label %impl_memory_entry_1173646

memory_alloc_1173645:
    %_1174539 = mul i64 16, %_1173656
    %_1174540 = bitcast i64 %_1174539 to i64
    %_1174542.i8 = call i8* @malloc(i64 %_1174540)
    %_1174542 = bitcast i8* %_1174542.i8 to [0 x double]*
    %_1174579.0 = insertvalue {i64, [0 x double]*} undef, i64 %_1174408, 0
    %_1174578 = bitcast [0 x double]* %_1174542 to [0 x double]*
    %_1174579.1 = insertvalue {i64, [0 x double]*} %_1174579.0, [0 x double]* %_1174578, 1
    store {i64, [0 x double]*} %_1174579.1, {i64, [0 x double]*}* @_1174545
    br label %impl_memory_entry_1173646

impl_memory_entry_1173646:
    %_1173660 = phi [0 x double]* [ %_1174604, %memory_reuse_1174589 ], [ %_1174578, %memory_alloc_1173645 ]
    %_1173654 = extractvalue {i64, [0 x double]*, i64, i64} %_1173652, 1
    %_1173658 = extractvalue {i64, [0 x double]*, i64, i64} %_1173652, 3
    %_1174394.ret = call {i64, [0 x double]*, i64, i64} @mop_vec_impl_1173226([0 x double]* %_1173654, i64 %_1173656, i64 %_1173658, [0 x double]* %_1173023, i64 2, [0 x double]* %_1173660)
    br label %mop_vec_entry_mop_result_1173661

mop_vec_entry_mop_result_1173661:
    %_1177159 = phi {i64, [0 x double]*, i64, i64} [ %_1174394.ret, %impl_memory_entry_1173646 ]
    %_1174329 = extractvalue {i64, [0 x double]*, i64, i64} %_1174327, 0
    %_1174380 = and i64 1, %_1174329
    %_1174387 = icmp eq i64 1, %_1174380
    br i1 %_1174387, label %right_mat_lam_1174338, label %right_mat_lam_1173670

right_mat_lam_1174338:
    br label %_cont_1173680

right_mat_lam_1173670:
    %_1174331 = extractvalue {i64, [0 x double]*, i64, i64} %_1174327, 1
    %_1174333 = extractvalue {i64, [0 x double]*, i64, i64} %_1174327, 2
    %_1174335 = extractvalue {i64, [0 x double]*, i64, i64} %_1174327, 3
    br label %_cont_1173680

_cont_1173680:
    %_1174304 = phi i64 [ 1, %right_mat_lam_1174338 ], [ %_1174329, %right_mat_lam_1173670 ]
    %_1173685 = phi [0 x double]* [ zeroinitializer, %right_mat_lam_1174338 ], [ %_1174331, %right_mat_lam_1173670 ]
    %_1173687 = phi i64 [ 2, %right_mat_lam_1174338 ], [ %_1174333, %right_mat_lam_1173670 ]
    %_1173689 = phi i64 [ 2, %right_mat_lam_1174338 ], [ %_1174335, %right_mat_lam_1173670 ]
    call void @print_matrix_1172379([0 x double]* %_1173685, i64 %_1173687, i64 %_1173689)
    br label %print_matrix_cont_1173694

print_matrix_cont_1173694:
    %_1174311 = and i64 1, %_1174304
    %_1174318 = icmp eq i64 1, %_1174311
    %_1173762 = add nsw i32 1, %_1173748
    br i1 %_1174318, label %left_mat_lam_1174250, label %impl_entry_1173700

impl_entry_1173700:
    %_1174222 = load {i64, [0 x double]*}, {i64, [0 x double]*}* @_1174123
    %_1174235 = extractvalue {i64, [0 x double]*} %_1174222, 0
    %_1173944 = mul i64 %_1173687, %_1173689
    %_1174242 = icmp uge i64 %_1174235, %_1173944
    br i1 %_1174242, label %memory_reuse_1174171, label %memory_alloc_1173701

memory_alloc_1173701:
    %_1174117 = mul nuw nsw i64 8, %_1173944
    %_1174118 = bitcast i64 %_1174117 to i64
    %_1174120.i8 = call i8* @malloc(i64 %_1174118)
    %_1174120 = bitcast i8* %_1174120.i8 to [0 x double]*
    %_1174159.0 = insertvalue {i64, [0 x double]*} undef, i64 %_1173944, 0
    %_1174158 = bitcast [0 x double]* %_1174120 to [0 x double]*
    %_1174159.1 = insertvalue {i64, [0 x double]*} %_1174159.0, [0 x double]* %_1174158, 1
    store {i64, [0 x double]*} %_1174159.1, {i64, [0 x double]*}* @_1174123
    br label %impl_memory_entry_1173702

memory_reuse_1174171:
    %_1174226 = extractvalue {i64, [0 x double]*} %_1174222, 1
    br label %impl_memory_entry_1173702

impl_memory_entry_1173702:
    %_1173765 = phi [0 x double]* [ %_1174158, %memory_alloc_1173701 ], [ %_1174226, %memory_reuse_1174171 ]
    br label %loop_head_1173703

loop_head_1173703:
    %_1173772 = phi i64 [ 0, %impl_memory_entry_1173702 ], [ %_1173933, %loop_1173768 ]
    %_1173951 = icmp ult i64 %_1173772, %_1173944
    br i1 %_1173951, label %loop_1173768, label %loop_exit_1173704

loop_1173768:
    %_1173782 = getelementptr inbounds [0 x double], [0 x double]* %_1173166, i64 0, i64 %_1173772
    %_1173790 = load double, double* %_1173782
    %_1173802 = getelementptr inbounds [0 x double], [0 x double]* %_1173685, i64 0, i64 %_1173772
    %_1173810 = load double, double* %_1173802
    %_1173822 = getelementptr inbounds [0 x double], [0 x double]* %_1173765, i64 0, i64 %_1173772
    %_1173912 = fadd double %_1173790, %_1173810
    store double %_1173912, double* %_1173822
    %_1173933 = add i64 1, %_1173772
    br label %loop_head_1173703

loop_exit_1173704:
    br label %while_head_1173155

left_mat_lam_1174250:
    br label %while_head_1173155

}

define void @matrix_init_1171153([0 x double]* %_1172141, double %_1171618) {
matrix_init_1171153:
    br label %iter_1171163

iter_1171163:
    %_1172017 = phi [0 x double]* [ %_1172141, %matrix_init_1171153 ]
    br label %while_head_1171182

while_head_1171182:
    %_1171340 = phi i64 [ 0, %iter_1171163 ], [ %_1171354, %break_1171228 ]
    %_1172127 = icmp ult i64 %_1171340, 2
    br i1 %_1172127, label %eta_while_body_1171209, label %_1171190

eta_while_body_1171209:
    %_1172031 = mul i64 2, %_1171340
    br label %while_head_1171213

while_head_1171213:
    %_1171404 = phi i64 [ 0, %eta_while_body_1171209 ], [ %_1171418, %body_cont_1171396 ]
    %_1172108 = icmp ult i64 %_1171404, 2
    br i1 %_1172108, label %eta_while_body_1171360, label %break_1171228

break_1171228:
    %_1171354 = add i64 1, %_1171340
    br label %while_head_1171182

eta_while_body_1171360:
    %_1172050.0 = insertvalue {i64, i64, double*} undef, i64 %_1171340, 0
    %_1172050.1 = insertvalue {i64, i64, double*} %_1172050.0, i64 %_1171404, 1
    %_1172039 = add i64 %_1171404, %_1172031
    %_1172049 = getelementptr inbounds [0 x double], [0 x double]* %_1172017, i64 0, i64 %_1172039
    %_1172050.2 = insertvalue {i64, i64, double*} %_1172050.1, double* %_1172049, 2
    br label %lambda_1171381

lambda_1171381:
    %_1171514 = phi {i64, i64, double*} [ %_1172050.2, %eta_while_body_1171360 ]
    %_1171519 = extractvalue {i64, i64, double*} %_1171514, 2
    %_1171718 = extractvalue {i64, i64, double*} %_1171514, 1
    %_1171729 = extractvalue {i64, i64, double*} %_1171514, 0
    %_1171743 = mul i64 2, %_1171729
    %_1171751 = add i64 %_1171718, %_1171743
    %_1171754 = uitofp i64 %_1171751 to double
    %_1171763 = fadd double %_1171618, %_1171754
    store double %_1171763, double* %_1171519
    br label %body_cont_1171396

body_cont_1171396:
    %_1171418 = add i64 1, %_1171404
    br label %while_head_1171213

_1171190:
    ret void

}

define {i64, [0 x double]*, i64, i64} @mop_transpose_impl_1173304([0 x double]* %_1173431, [0 x double]* %_1173322) {
mop_transpose_impl_1173304:
    br label %loop_head_1173310

loop_head_1173310:
    %_1173411 = phi i64 [ 0, %mop_transpose_impl_1173304 ], [ %_1173425, %loop_exit_1173330 ]
    %_1173599 = icmp ult i64 %_1173411, 2
    br i1 %_1173599, label %loop_1173328, label %loop_exit_1173313

loop_exit_1173313:
    %_1173323.0 = insertvalue {i64, [0 x double]*, i64, i64} undef, i64 0, 0
    %_1173323.1 = insertvalue {i64, [0 x double]*, i64, i64} %_1173323.0, [0 x double]* %_1173322, 1
    %_1173323.2 = insertvalue {i64, [0 x double]*, i64, i64} %_1173323.1, i64 2, 2
    %_1173323.3 = insertvalue {i64, [0 x double]*, i64, i64} %_1173323.2, i64 2, 3
    br label %_1173314

_1173314:
    %_1179185 = phi {i64, [0 x double]*, i64, i64} [ %_1173323.3, %loop_exit_1173313 ]
    ret {i64, [0 x double]*, i64, i64} %_1179185

loop_1173328:
    %_1173492 = mul i64 2, %_1173411
    br label %loop_head_1173329

loop_head_1173329:
    %_1173436 = phi i64 [ 0, %loop_1173328 ], [ %_1173533, %loop_1173428 ]
    %_1173584 = icmp ult i64 %_1173436, 2
    br i1 %_1173584, label %loop_1173428, label %loop_exit_1173330

loop_1173428:
    %_1173450 = mul i64 2, %_1173436
    %_1173458 = add i64 %_1173411, %_1173450
    %_1173468 = getelementptr inbounds [0 x double], [0 x double]* %_1173431, i64 0, i64 %_1173458
    %_1173476 = load double, double* %_1173468
    %_1173500 = add i64 %_1173436, %_1173492
    %_1173510 = getelementptr inbounds [0 x double], [0 x double]* %_1173322, i64 0, i64 %_1173500
    store double %_1173476, double* %_1173510
    %_1173533 = add i64 1, %_1173436
    br label %loop_head_1173329

loop_exit_1173330:
    %_1173425 = add i64 1, %_1173411
    br label %loop_head_1173310

}

define {i64, [0 x double]*, i64, i64} @mop_vec_impl_1173226([0 x double]* %_1173251, i64 %_1173242, i64 %_1173248, [0 x double]* %_1173254, i64 %_1173245, [0 x double]* %_1173257) {
mop_vec_impl_1173226:
    call void @dgemm(i64 %_1173242, i64 %_1173245, i64 %_1173248, [0 x double]* %_1173251, [0 x double]* %_1173254, [0 x double]* %_1173257)
    br label %result_mop_vec_1173263

result_mop_vec_1173263:
    %_1173271.0 = insertvalue {i64, [0 x double]*, i64, i64} undef, i64 0, 0
    %_1173271.1 = insertvalue {i64, [0 x double]*, i64, i64} %_1173271.0, [0 x double]* %_1173257, 1
    %_1173271.2 = insertvalue {i64, [0 x double]*, i64, i64} %_1173271.1, i64 %_1173242, 2
    %_1173271.3 = insertvalue {i64, [0 x double]*, i64, i64} %_1173271.2, i64 %_1173245, 3
    br label %_1173264

_1173264:
    %_1179682 = phi {i64, [0 x double]*, i64, i64} [ %_1173271.3, %result_mop_vec_1173263 ]
    ret {i64, [0 x double]*, i64, i64} %_1179682

}

define void @print_matrix_1172379([0 x double]* %_1172706, i64 %_1172830, i64 %_1172709) {
print_matrix_1172379:
    %_1172445 = bitcast {i8, i8, i8, i8, i8}* @_1172441 to [0 x i8]*
    %_1172479 = bitcast {i8, i8, i8, i8, i8}* @_1172478 to [0 x i8]*
    %_1172547 = bitcast {i8, i8}* @_1172544 to [0 x i8]*
    %_1172566 = bitcast {i8, i8}* @_1172565 to [0 x i8]*
    call void @printLine([0 x i8]* %_1172445)
    br label %printLine_cont_1172454

printLine_cont_1172454:
    br label %range_1172461

range_1172461:
    %_1172811 = phi i64 [ %_1172830, %printLine_cont_1172454 ]
    br label %while_head_1172465

while_head_1172465:
    %_1172573 = phi i64 [ 0, %range_1172461 ], [ %_1172587, %eta_while_head_1172569 ]
    %_1172818 = icmp ult i64 %_1172573, %_1172811
    br i1 %_1172818, label %while_body_1172492, label %break_1172472

break_1172472:
    call void @printLine([0 x i8]* %_1172479)
    br label %_1172480

_1172480:
    ret void

while_body_1172492:
    br label %lambda_1172496

lambda_1172496:
    %_1172711 = phi i64 [ %_1172573, %while_body_1172492 ]
    call void @printString([0 x i8]* %_1172547)
    br label %printString_cont_1172553

printString_cont_1172553:
    br label %range_1172554

range_1172554:
    %_1172784 = phi i64 [ %_1172709, %printString_cont_1172553 ]
    %_1172719 = mul i64 %_1172709, %_1172711
    br label %while_head_1172555

while_head_1172555:
    %_1172756 = phi i64 [ 0, %range_1172554 ], [ %_1172770, %eta_while_head_1172752 ]
    %_1172791 = icmp ult i64 %_1172756, %_1172784
    br i1 %_1172791, label %while_body_1172592, label %break_1172559

break_1172559:
    call void @printLine([0 x i8]* %_1172566)
    br label %eta_while_head_1172569

eta_while_head_1172569:
    %_1172587 = add i64 1, %_1172573
    br label %while_head_1172465

while_body_1172592:
    br label %lambda_1172596

lambda_1172596:
    %_1172721 = phi i64 [ %_1172756, %while_body_1172592 ]
    %_1172729 = add i64 %_1172719, %_1172721
    %_1172739 = getelementptr inbounds [0 x double], [0 x double]* %_1172706, i64 0, i64 %_1172729
    %_1172747 = load double, double* %_1172739
    call void @printDouble(double %_1172747)
    br label %eta_while_head_1172752

eta_while_head_1172752:
    %_1172770 = add i64 1, %_1172756
    br label %while_head_1172555

}

define void @iter_1172858([0 x double]* %_1172931) {
iter_1172858:
    br label %while_head_1172859

while_head_1172859:
    %_1172872 = phi i64 [ 0, %iter_1172858 ], [ %_1172886, %break_1172868 ]
    %_1173007 = icmp ult i64 %_1172872, 2
    br i1 %_1173007, label %eta_while_body_1172866, label %_1172860

_1172860:
    ret void

eta_while_body_1172866:
    %_1172945 = mul i64 2, %_1172872
    br label %while_head_1172867

while_head_1172867:
    %_1172929 = phi i64 [ 0, %eta_while_body_1172866 ], [ %_1172980, %body_cont_1172965 ]
    %_1172992 = icmp ult i64 %_1172929, 2
    br i1 %_1172992, label %eta_while_body_1172889, label %break_1172868

break_1172868:
    %_1172886 = add i64 1, %_1172872
    br label %while_head_1172859

eta_while_body_1172889:
    %_1172964.0 = insertvalue {i64, i64, double*} undef, i64 %_1172872, 0
    %_1172964.1 = insertvalue {i64, i64, double*} %_1172964.0, i64 %_1172929, 1
    %_1172953 = add i64 %_1172929, %_1172945
    %_1172963 = getelementptr inbounds [0 x double], [0 x double]* %_1172931, i64 0, i64 %_1172953
    %_1172964.2 = insertvalue {i64, i64, double*} %_1172964.1, double* %_1172963, 2
    call void @lambda_1172898({i64, i64, double*} %_1172964.2)
    br label %body_cont_1172965

body_cont_1172965:
    %_1172980 = add i64 1, %_1172929
    br label %while_head_1172867

}

define void @lambda_1172898({i64, i64, double*} %_1172910) {
lambda_1172898:
    %_1172912 = extractvalue {i64, i64, double*} %_1172910, 2
    store double 0x0000000000000000, double* %_1172912
    br label %_1172901

_1172901:
    ret void

}


