section .text
    global ft_strcmp

ft_strcmp:
    xor rcx, rcx
    
    .loop:
    mov al, byte[rdi + rcx]
    mov dl, byte[rsi + rcx]
    
    cmp al, 0
    je .end_loop

    cmp dl, 0
    je .end_loop

    cmp al, dl
    jne .end_loop

    inc rcx
    jmp .loop

    .end_loop:
        movzx rax, al
        movzx rdx, dl
        sub rax, rdx
        ret