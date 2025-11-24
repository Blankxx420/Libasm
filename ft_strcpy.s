section .text
    global ft_strcpy

ft_strcpy:
    mov rax, rdi
    xor rcx, rcx
    .loop:
        mov dl, byte[rsi + rcx]
        mov byte[rdi + rcx], dl
        cmp dl, 0
        je .end_loop
        inc rcx
        jmp .loop
    .end_loop:
        ret
