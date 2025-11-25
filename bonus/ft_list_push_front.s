extern malloc

section .text
    global ft_list_push_front

ft_list_push_front:
    push rdi
    push rsi
    mov rsi, rdi
    mov rdi, 16
    call malloc
    cmp rax, 0
    je .error
    pop rsi
    pop rdi
    mov [rax], rsi
    mov rcx, [rdi]
    mov [rax + 8], rcx
    mov [rdi], rax
    ret

    .error:
        pop rdi
        pop rsi
        ret
