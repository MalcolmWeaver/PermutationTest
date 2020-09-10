    .data
array:
    .quad 1,2,3,4,5,6,7,8
arr_len:
    .quad 8
format:
    .asciz "%20ld\n"

    .text
    .global _start
_start:
p1:
    mov     $0, %r12
    mov     arr_len, %rbx
p2:
    mov     $array, %rdi
    mov     %rbx, %rsi
    call    find_max

    imul    %rbx, %r12
    add     %rax, %r12

p3:
    mov     (%rdi, %rax, 8), %r8
    dec     %rbx
    mov     (%rdi,%rbx, 8), %r9
    mov     %r8, array(, %rbx, 8)
    mov     %r9, array(, %rax, 8)
p4:
    cmp     $1, %rbx
    jg      p2
    mov     %r12, %rdi
    call    print_reg
exit:
    mov     $60, %rax
    syscall
