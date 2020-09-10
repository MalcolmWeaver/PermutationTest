    .type print_reg, @function
    .global print_reg
    .section .bss
.lcomm BUFFER_DATA, 18          #we need 16 ascci to represent a hex of up to 16 Length
    .section .text
print_reg:
    push    %rbp
    mov     %rsp, %rbp
    push    %r15

    mov     $30768, %r15
    mov     %r15, BUFFER_DATA
    mov     $16, %r15
    movb    $0, %cl

// reg_to_print:
//     mov     $18000000000000000033, %rax

convert_to_hex:
    mov     %rdi, %rbx
    shl     %cl, %rbx
    shr     $60, %rbx

asciitize_dec:
    cmpb    $9, %bl
    jg      asciitize_let
    addb    $48, %bl
    jmp     add_to_buffer

asciitize_let:
    addb    $55, %bl

add_to_buffer:
    movb    %bl, BUFFER_DATA(%r15)

loop:
    addb    $4, %cl
    add     $8, %r15
    cmp     $144, %r15
    jl     convert_to_hex

write_to_stdout:
    mov     $1, %rax
    mov     $1, %rdi
    mov     $BUFFER_DATA, %rsi
    mov     $144, %rdx
    syscall
return:
    pop     %r15
    mov     %rbp, %rsp
    pop     %rbp
    ret
