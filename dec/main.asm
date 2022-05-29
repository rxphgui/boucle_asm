BITS 64

global _start

section .rodata
    data_banner db "Voici une boucle de décrémentation", 0xa, 0
    data_banner_len equ $-data_banner
section .text

_start:
    xor rax, rax
    xor rdi, rdi
    xor rsi, rsi
    mov r9, 15
    call main
    jmp _exit

main:
    cmp r9, 0
    je _exit
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, data_banner
    mov rdx, data_banner_len
    syscall
    dec r9
    jmp main

_exit:
    mov rax, 0x3C
    mov rdi, 0
    syscall
