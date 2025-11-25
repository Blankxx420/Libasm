extern ft_strlen
extern malloc
extern __errno_location
extern ft_strcpy

section .text
    global ft_strdup

ft_strdup:
    call ft_strlen
    push rdi
    push rax
    add rax, 1
    mov rsi, rdi
    mov rdi, rax
    call malloc
    cmp rax, 0
    je .error
    mov rdi, rax
    pop rcx
    pop rsi
    call ft_strcpy


    .error:
        pop rcx
        pop rsi
        neg rax
        mov rdi, rax
        push rdi
        call __errno_location
        pop rdi
        mov [rax], edi
        mov rax, -1
        ret

