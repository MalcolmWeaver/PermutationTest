    .type find_max, @function
    .global find_max
find_max:           # I am not sure if the type name, global name, and first symbol name must all be the same
    push    %rbp
    mov     %rsp, %rbp
    xor     %rax, %rax
    mov     $1, %rcx
check_next:
    cmp     %rax, (%rdi, %rdx, 1)
    cmovg   %rcx, %rax
    inc     %rcx
    cmp     %rcx, %rsi
    jl      check_next
exit:
    mov     %rbp, %rsp
    pop     %rbp
    ret
