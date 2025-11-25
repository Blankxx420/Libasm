section .text
    global ft_list_size

ft_list_size:
    xor rcx, rcx
    .loop:
        cmp rdi, 0
        je .end_loop
        inc rcx
        mov rdi, [rdi + 8]
        jmp .loop
    .end_loop:
        mov rax, rcx
        ret
        

