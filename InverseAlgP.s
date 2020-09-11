    .data
f:
    .quad 11
t:
    .quad 4
sorted_arr:
    .byte 1,2,3,4

    .text
    .global _start
_start:
    mov     $2, %rbx
    mov     f, %rax
    xor     %r8, %r8
    xor     %r9, %r9
p2:
    xor     %rdx, %rdx
    idiv    %rbx
p3:
    dec     %rbx
    movb    sorted_arr(, %rdx, 1), %r8b
    movb    sorted_arr(, %rbx, 1), %r9b
    movb    %r8b, sorted_arr(, %rbx, 1)
    movb    %r9b, sorted_arr(, %rdx, 1)
p4:
    add     $2, %rbx
    cmp     t, %rbx
    jle     p2
exit:
    mov     sorted_arr, %rdi
    call    print_reg
    mov     $60, %rax
    syscall
