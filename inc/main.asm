BITS 64

global _start

section .rodata
    s_hello db "Voici une boucle d'incrémentation", 0xa, 0
    s_hello_len equ $-s_hello
section .text

_start:
    jmp main

main:
    mov r9, 0
    call boucle
    jmp _exit

boucle:
    cmp r9, 15
    je _exit
    mov rax, 1
    mov rdi, 1
    mov rsi, s_hello
    mov rdx, s_hello_len
    syscall
    inc r9
    jmp boucle

_exit:
    mov rax, 0x3C
    mov rdi, 0
    syscall
    