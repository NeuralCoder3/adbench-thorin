declare i8* @malloc(i64)
declare i32 @_setjmp(i8*) returns_twice
declare void @longjmp(i8*, i32) noreturn
declare i64 @jmpbuf_size()

declare void @printInteger(i32)


define i32 @main(i32 %_251711, [0 x [0 x i8]*]* %_251713) {
main_251260:
    %_251720.ret = call i32 @cc_main_251263(i32 %_251711, [0 x [0 x i8]*]* %_251713)
    br label %_251714

_251714:
    %_251793 = phi i32 [ %_251720.ret, %main_251260 ]
    ret i32 %_251793

}

define i32 @cc_main_251263(i32 %_251695, [0 x [0 x i8]*]* %_251846) {
cc_main_251263:
    %_251329.i8 = call i8* @malloc(i64 16)
    %_251329 = bitcast i8* %_251329.i8 to {i32 ({}*, i32)*, {}*}*
    %_251697.0 = insertvalue {i32 ({}*, i32)*, {}*} undef, i32 ({}*, i32)* @lambda_251649, 0
    %_251696 = inttoptr i32 %_251695 to {}*
    %_251697.1 = insertvalue {i32 ({}*, i32)*, {}*} %_251697.0, {}* %_251696, 1
    store {i32 ({}*, i32)*, {}*} %_251697.1, {i32 ({}*, i32)*, {}*}* %_251329
    %_251586 = bitcast i32 ({{i32 ({}*, i32)*, {}*}, i32}*, i32)* @lambda_251486 to i32 ({}*, i32)*
    br label %while_head_251266

while_head_251266:
    %_251467 = phi i32 [ 0, %cc_main_251263 ], [ %_251615, %eta_while_body_251398 ]
    %_251638 = icmp slt i32 %_251467, 10
    br i1 %_251638, label %eta_while_body_251398, label %break_251271

eta_while_body_251398:
    %_251451 = load {i32 ({}*, i32)*, {}*}, {i32 ({}*, i32)*, {}*}* %_251329
    %_251456.i8 = call i8* @malloc(i64 24)
    %_251456 = bitcast i8* %_251456.i8 to {{i32 ({}*, i32)*, {}*}, i32}*
    %_251468.0 = insertvalue {{i32 ({}*, i32)*, {}*}, i32} undef, {i32 ({}*, i32)*, {}*} %_251451, 0
    %_251468.1 = insertvalue {{i32 ({}*, i32)*, {}*}, i32} %_251468.0, i32 %_251467, 1
    store {{i32 ({}*, i32)*, {}*}, i32} %_251468.1, {{i32 ({}*, i32)*, {}*}, i32}* %_251456
    %_251592.0 = insertvalue {i32 ({}*, i32)*, {}*} undef, i32 ({}*, i32)* %_251586, 0
    %_251591 = bitcast {{i32 ({}*, i32)*, {}*}, i32}* %_251456 to {}*
    %_251592.1 = insertvalue {i32 ({}*, i32)*, {}*} %_251592.0, {}* %_251591, 1
    store {i32 ({}*, i32)*, {}*} %_251592.1, {i32 ({}*, i32)*, {}*}* %_251329
    %_251615 = add nsw i32 1, %_251467
    br label %while_head_251266

break_251271:
    %_251339 = load {i32 ({}*, i32)*, {}*}, {i32 ({}*, i32)*, {}*}* %_251329
    %_251343 = extractvalue {i32 ({}*, i32)*, {}*} %_251339, 0
    %_251347 = extractvalue {i32 ({}*, i32)*, {}*} %_251339, 1
    %_251392.ret = call i32 %_251343({}* %_251347, i32 2)
    br label %_cont_251354

_cont_251354:
    %_251369 = phi i32 [ %_251392.ret, %break_251271 ]
    call void @printInteger(i32 %_251369)
    br label %printInteger_cont_251375

printInteger_cont_251375:
    br label %_251379

_251379:
    %_252115 = phi i32 [ 0, %printInteger_cont_251375 ]
    ret i32 %_252115

}

define i32 @lambda_251649({}* %closure_env_251675, i32 %_252189) {
lambda_251649:
    %unboxed_env_251676 = ptrtoint {}* %closure_env_251675 to i32
    %_251687 = mul nsw i32 99, %unboxed_env_251676
    br label %_251652

_251652:
    %_252214 = phi i32 [ %_251687, %lambda_251649 ]
    ret i32 %_252214

}

define i32 @lambda_251486({{i32 ({}*, i32)*, {}*}, i32}* %closure_env_251511, i32 %_251565) {
lambda_251486:
    %_251519 = load {{i32 ({}*, i32)*, {}*}, i32}, {{i32 ({}*, i32)*, {}*}, i32}* %closure_env_251511
    %fv_0_251523 = extractvalue {{i32 ({}*, i32)*, {}*}, i32} %_251519, 0
    %_251525 = extractvalue {i32 ({}*, i32)*, {}*} %fv_0_251523, 0
    %_251535 = extractvalue {i32 ({}*, i32)*, {}*} %fv_0_251523, 1
    %fv_1_251539 = extractvalue {{i32 ({}*, i32)*, {}*}, i32} %_251519, 1
    %_251585.ret = call i32 %_251525({}* %_251535, i32 %fv_1_251539)
    br label %_cont_251540

_cont_251540:
    %_251571 = phi i32 [ %_251585.ret, %lambda_251486 ]
    %_251576 = mul nsw i32 %fv_1_251539, %_251571
    %_251581 = add nsw i32 %_251565, %_251576
    br label %_251543

_251543:
    %_252338 = phi i32 [ %_251581, %_cont_251540 ]
    ret i32 %_252338

}


