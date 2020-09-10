    .data
array:
    .quad 2,1,3,4
arr_len:
    .quad 4
format:
    .asciz "%20ld\n"

    .text
    .global _start
_start::
    push    %rbp
    push    %rbx
    push    %r12
p1:
    mov     $0, %r12
    mov     arr_len, %rbx
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
