section .text
    global ft_strlen

ft_strlen:
    xor rcx, rcx
    .loop:
        cmp byte [rdi + rcx], 0
        je .end_loop
        inc rcx
        jmp .loop
    .end_loop:
        mov rax, rcx
        ret

