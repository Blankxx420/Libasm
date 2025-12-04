section .text
    global ft_list_sort

ft_list_sort:
    push rbx
    mov rbx, rsi
    mov r8, rdi

    cmp rdi, 0
    je .end_loop

    mov rcx, [rdi]
    cmp rcx, 0
    je .end_loop

    .restart_loop:
        mov rcx, [r8]
        xor r9, r9

    .loop:
        cmp rcx, 0
        je .check_swap
        mov rdx, [rcx + 8]
        cmp rdx, 0
        je .check_swap

        push rcx
        push rdx
        push r8
        push r9

        mov rdi, [rcx]
        mov rsi, [rdx]

        call rbx

        pop r9
        pop r8
        pop rdx
        pop rcx

        cmp eax, 0
        jg .swap

        mov rcx, [rcx + 8]
        jmp .loop

    .check_swap:
        cmp r9, 1
        je .restart_loop

    .swap:
        mov r10, [rcx]
        mov r11, [rdx]
        mov [rcx], r11
        mov [rdx], r10
        mov r9, 1
        mov rcx, [rcx + 8]
        jmp .loop

    .end_loop:
    pop rdx
    ret
        
