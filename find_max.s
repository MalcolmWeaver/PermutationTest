    .type find_max, @function
    .global find_max
find_max:           # I am not sure if the type name, global name, and first symbol name must all be the same
    push    %rbp
    mov     %rsp, %rbp
    xor     %rax, %rax
    mov     $1, %rcx
check_next:
    mov     (%rdi, %rax, 8), %r8
    mov     (%rdi, %rcx, 8), %r9
    cmp     %r8, %r9
    cmovg   %rcx, %rax
    inc     %rcx
    cmp     %rsi, %rcx
    jl      check_next
exit:
    mov     %rbp, %rsp
    pop     %rbp
    ret
