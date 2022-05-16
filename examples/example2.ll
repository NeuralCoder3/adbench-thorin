declare i8* @malloc(i64)

declare void @printLine([0 x i8]*)
declare void @printString([0 x i8]*)
declare void @printDouble(double)

@_415760 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}
@_415830 = global {i8, i8} {i8 124, i8 0}
@_415997 = global {i8, i8} {i8 124, i8 0}
@_416037 = global {i8, i8, i8, i8, i8} {i8 45, i8 45, i8 45, i8 45, i8 0}

define i32 @main() {
main_414950:
    %_415190.i8 = call i8* @malloc(i64 32)
    %_415190 = bitcast i8* %_415190.i8 to [4 x double]*
    %_415194.i8 = call i8* @malloc(i64 32)
    %_415194 = bitcast i8* %_415194.i8 to [4 x double]*
    %_415198.i8 = call i8* @malloc(i64 32)
    %_415198 = bitcast i8* %_415198.i8 to [4 x double]*
    %_415553 = bitcast [4 x double]* %_415190 to [0 x double]*
    %_415564 = getelementptr inbounds [0 x double], [0 x double]* %_415553, i64 0, i64 0
    store double 0x3ff0000000000000, double* %_415564
    %_415594 = getelementptr inbounds [0 x double], [0 x double]* %_415553, i64 0, i64 1
    store double 0x4000000000000000, double* %_415594
    %_415617 = getelementptr inbounds [0 x double], [0 x double]* %_415553, i64 0, i64 2
    store double 0x4008000000000000, double* %_415617
    %_415640 = getelementptr inbounds [0 x double], [0 x double]* %_415553, i64 0, i64 3
    store double 0x4010000000000000, double* %_415640
    %_415651 = bitcast [4 x double]* %_415194 to [0 x double]*
    %_415661 = getelementptr inbounds [0 x double], [0 x double]* %_415651, i64 0, i64 0
    store double 0x4000000000000000, double* %_415661
    %_415678 = getelementptr inbounds [0 x double], [0 x double]* %_415651, i64 0, i64 1
    store double 0x4008000000000000, double* %_415678
    %_415695 = getelementptr inbounds [0 x double], [0 x double]* %_415651, i64 0, i64 2
    store double 0x4010000000000000, double* %_415695
    %_415712 = getelementptr inbounds [0 x double], [0 x double]* %_415651, i64 0, i64 3
    store double 0x4014000000000000, double* %_415712
    %_415764 = bitcast {i8, i8, i8, i8, i8}* @_415760 to [0 x i8]*
    %_415833 = bitcast {i8, i8}* @_415830 to [0 x i8]*
    %_415998 = bitcast {i8, i8}* @_415997 to [0 x i8]*
    %_416038 = bitcast {i8, i8, i8, i8, i8}* @_416037 to [0 x i8]*
    call void @printLine([0 x i8]* %_415764)
    br label %printLine_cont_415777

printLine_cont_415777:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_415845

printString_cont_415845:
    %_415960 = load double, double* %_415564
    call void @printDouble(double %_415960)
    br label %eta_while_head_415977

eta_while_head_415977:
    %_415986 = load double, double* %_415594
    call void @printDouble(double %_415986)
    br label %eta_while_head_415991

eta_while_head_415991:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_415999

eta_while_head_415999:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_416001

printString_cont_416001:
    %_416010 = load double, double* %_415617
    call void @printDouble(double %_416010)
    br label %eta_while_head_416015

eta_while_head_416015:
    %_416024 = load double, double* %_415640
    call void @printDouble(double %_416024)
    br label %eta_while_head_416029

eta_while_head_416029:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_416031

eta_while_head_416031:
    call void @printLine([0 x i8]* %_416038)
    br label %print_matrix_cont_416050

print_matrix_cont_416050:
    call void @printLine([0 x i8]* %_415764)
    br label %printLine_cont_416052

printLine_cont_416052:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_416054

printString_cont_416054:
    %_416063 = load double, double* %_415661
    call void @printDouble(double %_416063)
    br label %eta_while_head_416068

eta_while_head_416068:
    %_416077 = load double, double* %_415678
    call void @printDouble(double %_416077)
    br label %eta_while_head_416082

eta_while_head_416082:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_416084

eta_while_head_416084:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_416086

printString_cont_416086:
    %_416095 = load double, double* %_415695
    call void @printDouble(double %_416095)
    br label %eta_while_head_416100

eta_while_head_416100:
    %_416109 = load double, double* %_415712
    call void @printDouble(double %_416109)
    br label %eta_while_head_416114

eta_while_head_416114:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_416116

eta_while_head_416116:
    call void @printLine([0 x i8]* %_416038)
    br label %print_matrix_cont_416122

print_matrix_cont_416122:
    %_416126 = bitcast [4 x double]* %_415198 to [0 x double]*
    %_416136 = getelementptr inbounds [0 x double], [0 x double]* %_416126, i64 0, i64 0
    store double 0x3ff0000000000000, double* %_416136
    %_416153 = getelementptr inbounds [0 x double], [0 x double]* %_416126, i64 0, i64 1
    store double 0x0000000000000000, double* %_416153
    %_416175 = getelementptr inbounds [0 x double], [0 x double]* %_416126, i64 0, i64 2
    store double 0x0000000000000000, double* %_416175
    %_416192 = getelementptr inbounds [0 x double], [0 x double]* %_416126, i64 0, i64 3
    store double 0x0000000000000000, double* %_416192
    %_416201.i8 = call i8* @malloc(i64 32)
    %_416201 = bitcast i8* %_416201.i8 to [4 x double]*
    %_416211 = load double, double* %_415564
    %_416221 = load double, double* %_415661
    %_416226 = bitcast [4 x double]* %_416201 to [0 x double]*
    %_416236 = getelementptr inbounds [0 x double], [0 x double]* %_416226, i64 0, i64 0
    %_416336 = fadd double %_416211, %_416221
    store double %_416336, double* %_416236
    %_416351 = load double, double* %_415594
    %_416361 = load double, double* %_415678
    %_416373 = getelementptr inbounds [0 x double], [0 x double]* %_416226, i64 0, i64 1
    %_416386 = fadd double %_416351, %_416361
    store double %_416386, double* %_416373
    %_416401 = load double, double* %_415617
    %_416411 = load double, double* %_415695
    %_416423 = getelementptr inbounds [0 x double], [0 x double]* %_416226, i64 0, i64 2
    %_416436 = fadd double %_416401, %_416411
    store double %_416436, double* %_416423
    %_416451 = load double, double* %_415640
    %_416461 = load double, double* %_415712
    %_416473 = getelementptr inbounds [0 x double], [0 x double]* %_416226, i64 0, i64 3
    %_416486 = fadd double %_416451, %_416461
    store double %_416486, double* %_416473
    %_416495.i8 = call i8* @malloc(i64 32)
    %_416495 = bitcast i8* %_416495.i8 to [4 x double]*
    %_416505 = load double, double* %_415564
    %_416515 = load double, double* %_416236
    %_416525 = load double, double* %_415594
    %_416535 = load double, double* %_416423
    %_416540 = bitcast [4 x double]* %_416495 to [0 x double]*
    %_416550 = getelementptr inbounds [0 x double], [0 x double]* %_416540, i64 0, i64 0
    %_416567 = fmul double %_416505, %_416515
    %_416576 = fadd double 0x0000000000000000, %_416567
    %_416589 = fmul double %_416525, %_416535
    %_416600 = fadd double %_416576, %_416589
    store double %_416600, double* %_416550
    %_416615 = load double, double* %_415564
    %_416625 = load double, double* %_416373
    %_416635 = load double, double* %_415594
    %_416645 = load double, double* %_416473
    %_416657 = getelementptr inbounds [0 x double], [0 x double]* %_416540, i64 0, i64 1
    %_416670 = fmul double %_416615, %_416625
    %_416679 = fadd double 0x0000000000000000, %_416670
    %_416692 = fmul double %_416635, %_416645
    %_416703 = fadd double %_416679, %_416692
    store double %_416703, double* %_416657
    %_416718 = load double, double* %_415617
    %_416728 = load double, double* %_416236
    %_416738 = load double, double* %_415640
    %_416748 = load double, double* %_416423
    %_416760 = getelementptr inbounds [0 x double], [0 x double]* %_416540, i64 0, i64 2
    %_416773 = fmul double %_416718, %_416728
    %_416782 = fadd double 0x0000000000000000, %_416773
    %_416795 = fmul double %_416738, %_416748
    %_416806 = fadd double %_416782, %_416795
    store double %_416806, double* %_416760
    %_416821 = load double, double* %_415617
    %_416831 = load double, double* %_416373
    %_416841 = load double, double* %_415640
    %_416851 = load double, double* %_416473
    %_416863 = getelementptr inbounds [0 x double], [0 x double]* %_416540, i64 0, i64 3
    %_416876 = fmul double %_416821, %_416831
    %_416885 = fadd double 0x0000000000000000, %_416876
    %_416898 = fmul double %_416841, %_416851
    %_416909 = fadd double %_416885, %_416898
    store double %_416909, double* %_416863
    call void @printLine([0 x i8]* %_415764)
    br label %printLine_cont_416917

printLine_cont_416917:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_416919

printString_cont_416919:
    %_416928 = load double, double* %_416136
    call void @printDouble(double %_416928)
    br label %eta_while_head_416933

eta_while_head_416933:
    %_416942 = load double, double* %_416153
    call void @printDouble(double %_416942)
    br label %eta_while_head_416947

eta_while_head_416947:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_416949

eta_while_head_416949:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_416951

printString_cont_416951:
    %_416960 = load double, double* %_416175
    call void @printDouble(double %_416960)
    br label %eta_while_head_416965

eta_while_head_416965:
    %_416974 = load double, double* %_416192
    call void @printDouble(double %_416974)
    br label %eta_while_head_416979

eta_while_head_416979:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_416981

eta_while_head_416981:
    call void @printLine([0 x i8]* %_416038)
    br label %print_matrix_cont_416987

print_matrix_cont_416987:
    %_417025.i8 = call i8* @malloc(i64 32)
    %_417025 = bitcast i8* %_417025.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_417025
    %_417040.i8 = call i8* @malloc(i64 32)
    %_417040 = bitcast i8* %_417040.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_417040
    %_417053.i8 = call i8* @malloc(i64 32)
    %_417053 = bitcast i8* %_417053.i8 to [4 x double]*
    %_417063 = load double, double* %_415564
    %_417073 = load double, double* %_415661
    %_417078 = bitcast [4 x double]* %_417053 to [0 x double]*
    %_417088 = getelementptr inbounds [0 x double], [0 x double]* %_417078, i64 0, i64 0
    %_417101 = fadd double %_417063, %_417073
    store double %_417101, double* %_417088
    %_417116 = load double, double* %_415594
    %_417126 = load double, double* %_415678
    %_417138 = getelementptr inbounds [0 x double], [0 x double]* %_417078, i64 0, i64 1
    %_417151 = fadd double %_417116, %_417126
    store double %_417151, double* %_417138
    %_417166 = load double, double* %_415617
    %_417176 = load double, double* %_415695
    %_417188 = getelementptr inbounds [0 x double], [0 x double]* %_417078, i64 0, i64 2
    %_417201 = fadd double %_417166, %_417176
    store double %_417201, double* %_417188
    %_417216 = load double, double* %_415640
    %_417226 = load double, double* %_415712
    %_417238 = getelementptr inbounds [0 x double], [0 x double]* %_417078, i64 0, i64 3
    %_417251 = fadd double %_417216, %_417226
    store double %_417251, double* %_417238
    %_417260.i8 = call i8* @malloc(i64 32)
    %_417260 = bitcast i8* %_417260.i8 to [4 x double]*
    %_417270 = load double, double* %_415564
    %_417280 = load double, double* %_417088
    %_417290 = load double, double* %_415594
    %_417300 = load double, double* %_417188
    %_417305 = bitcast [4 x double]* %_417260 to [0 x double]*
    %_417315 = getelementptr inbounds [0 x double], [0 x double]* %_417305, i64 0, i64 0
    %_417328 = fmul double %_417270, %_417280
    %_417337 = fadd double 0x0000000000000000, %_417328
    %_417350 = fmul double %_417290, %_417300
    %_417361 = fadd double %_417337, %_417350
    store double %_417361, double* %_417315
    %_417376 = load double, double* %_415564
    %_417386 = load double, double* %_417138
    %_417396 = load double, double* %_415594
    %_417406 = load double, double* %_417238
    %_417418 = getelementptr inbounds [0 x double], [0 x double]* %_417305, i64 0, i64 1
    %_417431 = fmul double %_417376, %_417386
    %_417440 = fadd double 0x0000000000000000, %_417431
    %_417453 = fmul double %_417396, %_417406
    %_417464 = fadd double %_417440, %_417453
    store double %_417464, double* %_417418
    %_417479 = load double, double* %_415617
    %_417489 = load double, double* %_417088
    %_417499 = load double, double* %_415640
    %_417509 = load double, double* %_417188
    %_417521 = getelementptr inbounds [0 x double], [0 x double]* %_417305, i64 0, i64 2
    %_417534 = fmul double %_417479, %_417489
    %_417543 = fadd double 0x0000000000000000, %_417534
    %_417556 = fmul double %_417499, %_417509
    %_417567 = fadd double %_417543, %_417556
    store double %_417567, double* %_417521
    %_417582 = load double, double* %_415617
    %_417592 = load double, double* %_417138
    %_417602 = load double, double* %_415640
    %_417612 = load double, double* %_417238
    %_417624 = getelementptr inbounds [0 x double], [0 x double]* %_417305, i64 0, i64 3
    %_417637 = fmul double %_417582, %_417592
    %_417646 = fadd double 0x0000000000000000, %_417637
    %_417659 = fmul double %_417602, %_417612
    %_417670 = fadd double %_417646, %_417659
    store double %_417670, double* %_417624
    %_417679.i8 = call i8* @malloc(i64 32)
    %_417679 = bitcast i8* %_417679.i8 to [4 x double]*
    %_417689 = load double, double* %_415564
    %_417694 = bitcast [4 x double]* %_417679 to [0 x double]*
    %_417704 = getelementptr inbounds [0 x double], [0 x double]* %_417694, i64 0, i64 0
    store double %_417689, double* %_417704
    %_417721 = load double, double* %_415594
    %_417733 = getelementptr inbounds [0 x double], [0 x double]* %_417694, i64 0, i64 2
    store double %_417721, double* %_417733
    %_417750 = load double, double* %_415617
    %_417762 = getelementptr inbounds [0 x double], [0 x double]* %_417694, i64 0, i64 1
    store double %_417750, double* %_417762
    %_417779 = load double, double* %_415640
    %_417791 = getelementptr inbounds [0 x double], [0 x double]* %_417694, i64 0, i64 3
    store double %_417779, double* %_417791
    %_417802.i8 = call i8* @malloc(i64 32)
    %_417802 = bitcast i8* %_417802.i8 to [4 x double]*
    %_417812 = load double, double* %_417704
    %_417822 = load double, double* %_416136
    %_417832 = load double, double* %_417762
    %_417842 = load double, double* %_416175
    %_417847 = bitcast [4 x double]* %_417802 to [0 x double]*
    %_417857 = getelementptr inbounds [0 x double], [0 x double]* %_417847, i64 0, i64 0
    %_417870 = fmul double %_417812, %_417822
    %_417879 = fadd double 0x0000000000000000, %_417870
    %_417892 = fmul double %_417832, %_417842
    %_417903 = fadd double %_417879, %_417892
    store double %_417903, double* %_417857
    %_417918 = load double, double* %_417704
    %_417928 = load double, double* %_416153
    %_417938 = load double, double* %_417762
    %_417948 = load double, double* %_416192
    %_417960 = getelementptr inbounds [0 x double], [0 x double]* %_417847, i64 0, i64 1
    %_417973 = fmul double %_417918, %_417928
    %_417982 = fadd double 0x0000000000000000, %_417973
    %_417995 = fmul double %_417938, %_417948
    %_418006 = fadd double %_417982, %_417995
    store double %_418006, double* %_417960
    %_418021 = load double, double* %_417733
    %_418031 = load double, double* %_416136
    %_418041 = load double, double* %_417791
    %_418051 = load double, double* %_416175
    %_418063 = getelementptr inbounds [0 x double], [0 x double]* %_417847, i64 0, i64 2
    %_418076 = fmul double %_418021, %_418031
    %_418085 = fadd double 0x0000000000000000, %_418076
    %_418098 = fmul double %_418041, %_418051
    %_418109 = fadd double %_418085, %_418098
    store double %_418109, double* %_418063
    %_418124 = load double, double* %_417733
    %_418134 = load double, double* %_416153
    %_418144 = load double, double* %_417791
    %_418154 = load double, double* %_416192
    %_418166 = getelementptr inbounds [0 x double], [0 x double]* %_417847, i64 0, i64 3
    %_418179 = fmul double %_418124, %_418134
    %_418188 = fadd double 0x0000000000000000, %_418179
    %_418201 = fmul double %_418144, %_418154
    %_418212 = fadd double %_418188, %_418201
    store double %_418212, double* %_418166
    %_418221.i8 = call i8* @malloc(i64 32)
    %_418221 = bitcast i8* %_418221.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_418221
    %_418234.i8 = call i8* @malloc(i64 32)
    %_418234 = bitcast i8* %_418234.i8 to [4 x double]*
    %_418244 = load double, double* %_417088
    %_418249 = bitcast [4 x double]* %_418234 to [0 x double]*
    %_418259 = getelementptr inbounds [0 x double], [0 x double]* %_418249, i64 0, i64 0
    store double %_418244, double* %_418259
    %_418276 = load double, double* %_417138
    %_418288 = getelementptr inbounds [0 x double], [0 x double]* %_418249, i64 0, i64 2
    store double %_418276, double* %_418288
    %_418305 = load double, double* %_417188
    %_418317 = getelementptr inbounds [0 x double], [0 x double]* %_418249, i64 0, i64 1
    store double %_418305, double* %_418317
    %_418334 = load double, double* %_417238
    %_418346 = getelementptr inbounds [0 x double], [0 x double]* %_418249, i64 0, i64 3
    store double %_418334, double* %_418346
    %_418357.i8 = call i8* @malloc(i64 32)
    %_418357 = bitcast i8* %_418357.i8 to [4 x double]*
    %_418367 = load double, double* %_416136
    %_418377 = load double, double* %_418259
    %_418387 = load double, double* %_416153
    %_418397 = load double, double* %_418288
    %_418402 = bitcast [4 x double]* %_418357 to [0 x double]*
    %_418412 = getelementptr inbounds [0 x double], [0 x double]* %_418402, i64 0, i64 0
    %_418425 = fmul double %_418367, %_418377
    %_418434 = fadd double 0x0000000000000000, %_418425
    %_418447 = fmul double %_418387, %_418397
    %_418458 = fadd double %_418434, %_418447
    store double %_418458, double* %_418412
    %_418473 = load double, double* %_416136
    %_418483 = load double, double* %_418317
    %_418493 = load double, double* %_416153
    %_418503 = load double, double* %_418346
    %_418515 = getelementptr inbounds [0 x double], [0 x double]* %_418402, i64 0, i64 1
    %_418528 = fmul double %_418473, %_418483
    %_418537 = fadd double 0x0000000000000000, %_418528
    %_418550 = fmul double %_418493, %_418503
    %_418561 = fadd double %_418537, %_418550
    store double %_418561, double* %_418515
    %_418576 = load double, double* %_416175
    %_418586 = load double, double* %_418259
    %_418596 = load double, double* %_416192
    %_418606 = load double, double* %_418288
    %_418618 = getelementptr inbounds [0 x double], [0 x double]* %_418402, i64 0, i64 2
    %_418631 = fmul double %_418576, %_418586
    %_418640 = fadd double 0x0000000000000000, %_418631
    %_418653 = fmul double %_418596, %_418606
    %_418664 = fadd double %_418640, %_418653
    store double %_418664, double* %_418618
    %_418679 = load double, double* %_416175
    %_418689 = load double, double* %_418317
    %_418699 = load double, double* %_416192
    %_418709 = load double, double* %_418346
    %_418721 = getelementptr inbounds [0 x double], [0 x double]* %_418402, i64 0, i64 3
    %_418734 = fmul double %_418679, %_418689
    %_418743 = fadd double 0x0000000000000000, %_418734
    %_418756 = fmul double %_418699, %_418709
    %_418767 = fadd double %_418743, %_418756
    store double %_418767, double* %_418721
    %_418776.i8 = call i8* @malloc(i64 32)
    %_418776 = bitcast i8* %_418776.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_418776
    %_418789.i8 = call i8* @malloc(i64 32)
    %_418789 = bitcast i8* %_418789.i8 to [4 x double]*
    store [4 x double] zeroinitializer, [4 x double]* %_418789
    %_418802.i8 = call i8* @malloc(i64 32)
    %_418802 = bitcast i8* %_418802.i8 to [4 x double]*
    %_418812 = load double, double* %_418412
    %_418815 = bitcast [4 x double]* %_418789 to [0 x double]*
    %_418825 = getelementptr inbounds [0 x double], [0 x double]* %_418815, i64 0, i64 0
    %_418833 = load double, double* %_418825
    %_418838 = bitcast [4 x double]* %_418802 to [0 x double]*
    %_418848 = getelementptr inbounds [0 x double], [0 x double]* %_418838, i64 0, i64 0
    %_418861 = fadd double %_418812, %_418833
    store double %_418861, double* %_418848
    %_418876 = load double, double* %_418515
    %_418888 = getelementptr inbounds [0 x double], [0 x double]* %_418815, i64 0, i64 1
    %_418896 = load double, double* %_418888
    %_418908 = getelementptr inbounds [0 x double], [0 x double]* %_418838, i64 0, i64 1
    %_418921 = fadd double %_418876, %_418896
    store double %_418921, double* %_418908
    %_418936 = load double, double* %_418618
    %_418948 = getelementptr inbounds [0 x double], [0 x double]* %_418815, i64 0, i64 2
    %_418956 = load double, double* %_418948
    %_418968 = getelementptr inbounds [0 x double], [0 x double]* %_418838, i64 0, i64 2
    %_418981 = fadd double %_418936, %_418956
    store double %_418981, double* %_418968
    %_418996 = load double, double* %_418721
    %_419008 = getelementptr inbounds [0 x double], [0 x double]* %_418815, i64 0, i64 3
    %_419016 = load double, double* %_419008
    %_419028 = getelementptr inbounds [0 x double], [0 x double]* %_418838, i64 0, i64 3
    %_419041 = fadd double %_418996, %_419016
    store double %_419041, double* %_419028
    %_419050.i8 = call i8* @malloc(i64 32)
    %_419050 = bitcast i8* %_419050.i8 to [4 x double]*
    %_419053 = bitcast [4 x double]* %_418776 to [0 x double]*
    %_419063 = getelementptr inbounds [0 x double], [0 x double]* %_419053, i64 0, i64 0
    %_419071 = load double, double* %_419063
    %_419081 = load double, double* %_418412
    %_419086 = bitcast [4 x double]* %_419050 to [0 x double]*
    %_419096 = getelementptr inbounds [0 x double], [0 x double]* %_419086, i64 0, i64 0
    %_419109 = fadd double %_419071, %_419081
    store double %_419109, double* %_419096
    %_419126 = getelementptr inbounds [0 x double], [0 x double]* %_419053, i64 0, i64 1
    %_419134 = load double, double* %_419126
    %_419144 = load double, double* %_418515
    %_419156 = getelementptr inbounds [0 x double], [0 x double]* %_419086, i64 0, i64 1
    %_419169 = fadd double %_419134, %_419144
    store double %_419169, double* %_419156
    %_419186 = getelementptr inbounds [0 x double], [0 x double]* %_419053, i64 0, i64 2
    %_419194 = load double, double* %_419186
    %_419204 = load double, double* %_418618
    %_419216 = getelementptr inbounds [0 x double], [0 x double]* %_419086, i64 0, i64 2
    %_419229 = fadd double %_419194, %_419204
    store double %_419229, double* %_419216
    %_419246 = getelementptr inbounds [0 x double], [0 x double]* %_419053, i64 0, i64 3
    %_419254 = load double, double* %_419246
    %_419264 = load double, double* %_418721
    %_419276 = getelementptr inbounds [0 x double], [0 x double]* %_419086, i64 0, i64 3
    %_419289 = fadd double %_419254, %_419264
    store double %_419289, double* %_419276
    %_419298.i8 = call i8* @malloc(i64 32)
    %_419298 = bitcast i8* %_419298.i8 to [4 x double]*
    %_419308 = load double, double* %_417857
    %_419318 = load double, double* %_418848
    %_419323 = bitcast [4 x double]* %_419298 to [0 x double]*
    %_419333 = getelementptr inbounds [0 x double], [0 x double]* %_419323, i64 0, i64 0
    %_419346 = fadd double %_419308, %_419318
    store double %_419346, double* %_419333
    %_419361 = load double, double* %_417960
    %_419371 = load double, double* %_418908
    %_419383 = getelementptr inbounds [0 x double], [0 x double]* %_419323, i64 0, i64 1
    %_419396 = fadd double %_419361, %_419371
    store double %_419396, double* %_419383
    %_419411 = load double, double* %_418063
    %_419421 = load double, double* %_418968
    %_419433 = getelementptr inbounds [0 x double], [0 x double]* %_419323, i64 0, i64 2
    %_419446 = fadd double %_419411, %_419421
    store double %_419446, double* %_419433
    %_419461 = load double, double* %_418166
    %_419471 = load double, double* %_419028
    %_419483 = getelementptr inbounds [0 x double], [0 x double]* %_419323, i64 0, i64 3
    %_419496 = fadd double %_419461, %_419471
    store double %_419496, double* %_419483
    %_419505.i8 = call i8* @malloc(i64 32)
    %_419505 = bitcast i8* %_419505.i8 to [4 x double]*
    %_419508 = bitcast [4 x double]* %_418221 to [0 x double]*
    %_419518 = getelementptr inbounds [0 x double], [0 x double]* %_419508, i64 0, i64 0
    %_419526 = load double, double* %_419518
    %_419536 = load double, double* %_419096
    %_419541 = bitcast [4 x double]* %_419505 to [0 x double]*
    %_419551 = getelementptr inbounds [0 x double], [0 x double]* %_419541, i64 0, i64 0
    %_419564 = fadd double %_419526, %_419536
    store double %_419564, double* %_419551
    %_419581 = getelementptr inbounds [0 x double], [0 x double]* %_419508, i64 0, i64 1
    %_419589 = load double, double* %_419581
    %_419599 = load double, double* %_419156
    %_419611 = getelementptr inbounds [0 x double], [0 x double]* %_419541, i64 0, i64 1
    %_419624 = fadd double %_419589, %_419599
    store double %_419624, double* %_419611
    %_419641 = getelementptr inbounds [0 x double], [0 x double]* %_419508, i64 0, i64 2
    %_419649 = load double, double* %_419641
    %_419659 = load double, double* %_419216
    %_419671 = getelementptr inbounds [0 x double], [0 x double]* %_419541, i64 0, i64 2
    %_419684 = fadd double %_419649, %_419659
    store double %_419684, double* %_419671
    %_419701 = getelementptr inbounds [0 x double], [0 x double]* %_419508, i64 0, i64 3
    %_419709 = load double, double* %_419701
    %_419719 = load double, double* %_419276
    %_419731 = getelementptr inbounds [0 x double], [0 x double]* %_419541, i64 0, i64 3
    %_419744 = fadd double %_419709, %_419719
    store double %_419744, double* %_419731
    call void @printLine([0 x i8]* %_415764)
    br label %printLine_cont_419752

printLine_cont_419752:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_419754

printString_cont_419754:
    %_419763 = load double, double* %_419333
    call void @printDouble(double %_419763)
    br label %eta_while_head_419768

eta_while_head_419768:
    %_419777 = load double, double* %_419383
    call void @printDouble(double %_419777)
    br label %eta_while_head_419782

eta_while_head_419782:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_419784

eta_while_head_419784:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_419786

printString_cont_419786:
    %_419795 = load double, double* %_419433
    call void @printDouble(double %_419795)
    br label %eta_while_head_419800

eta_while_head_419800:
    %_419809 = load double, double* %_419483
    call void @printDouble(double %_419809)
    br label %eta_while_head_419814

eta_while_head_419814:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_419816

eta_while_head_419816:
    call void @printLine([0 x i8]* %_416038)
    br label %print_matrix_cont_419822

print_matrix_cont_419822:
    call void @printLine([0 x i8]* %_415764)
    br label %printLine_cont_419824

printLine_cont_419824:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_419826

printString_cont_419826:
    %_419835 = load double, double* %_419551
    call void @printDouble(double %_419835)
    br label %eta_while_head_419840

eta_while_head_419840:
    %_419849 = load double, double* %_419611
    call void @printDouble(double %_419849)
    br label %eta_while_head_419854

eta_while_head_419854:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_419856

eta_while_head_419856:
    call void @printString([0 x i8]* %_415833)
    br label %printString_cont_419858

printString_cont_419858:
    %_419867 = load double, double* %_419671
    call void @printDouble(double %_419867)
    br label %eta_while_head_419872

eta_while_head_419872:
    %_419881 = load double, double* %_419731
    call void @printDouble(double %_419881)
    br label %eta_while_head_419886

eta_while_head_419886:
    call void @printLine([0 x i8]* %_415998)
    br label %eta_while_head_419888

eta_while_head_419888:
    call void @printLine([0 x i8]* %_416038)
    br label %print_matrix_cont_419894

print_matrix_cont_419894:
    br label %return_419905

return_419905:
    %_425875 = phi i32 [ 0, %print_matrix_cont_419894 ]
    ret i32 %_425875

}


