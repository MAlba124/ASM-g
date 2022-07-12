    global _start

    section .data
hello_world:
    db "Hello World", 0x0A  ; "Hello World\n"

    section .text
_start:
    mov rax, 1                  ; write
    mov rdi, 1                  ; stdout
    mov rsi, hello_world        ; hello world text
    mov rdx, 12                 ; message size/length
    syscall

    mov rax, 60                 ; exit
    mov rdi, 0                  ; error code
    syscall
