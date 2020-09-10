    .data
array:
    .quad 2,1,3,4
arr_len:
    .quad 4
format:
    .asciz "%20ld\n"

    .text
    .global _start
_start:
	# your code goes here
    mov     $array, %rdi
    // call    print_reg
    // jmp     exit

    // add     $16, %rdi
    // mov     (%rdi), %rdi
    // call    print_reg
    //
    // jmp     exit


    mov     arr_len, %rsi
    call    find_max

    mov     %rax, %rdi
    call    print_reg
	// ret
// asd main:
//     push    %rbp
//     push    %rbx
//     push    %r12
//
//     mov     $0, %r12
//     mov     arr_len, %rbx
// p2:
//     mov     $array, %rdi
//     mov     $arr_len, %rsi
//
//     jmp    find_max
// continue_p2:
//
//     mov     %rax, %rsi
//     mov     $format, %rdi
//     call    printf
//
//     pop     %r12
//     pop     %rbx
//     pop     %rbp
//     ret

exit:
    mov     $60, %rax
    syscall
