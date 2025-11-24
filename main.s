extern ft_strlen
extern ft_strcpy

section .data
    str: db "Hello world", 10, 0
    dest: db "bonjour", 10, 0

section .text
    global _start

_start:
    mov rdi, str
    call ft_strlen
    mov rdx, rax
    mov rsi, str
    mov rdi, 1
    mov rax, 1
    syscall

    mov rdi, str
    mov rsi, dest
    call ft_strcpy
    mov rsi, rax
    call ft_strlen
    mov rdx, rax
    mov rdi, 1
    mov rax, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
