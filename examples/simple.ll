declare i8* @malloc(i64)
declare i32 @_setjmp(i8*) returns_twice
declare void @longjmp(i8*, i32) noreturn
declare i64 @jmpbuf_size()



define i32 @main() {
main_165704:
    br label %return_165718

return_165718:
    %_165783 = phi i32 [ 0, %main_165704 ]
    ret i32 %_165783

}


