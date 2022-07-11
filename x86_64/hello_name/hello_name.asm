    global _start

    section .data
enter_name: db "Please enter your name: "
hello:  db "Hello! "

    section .bss
name: resb 32

    section .text
_start:
    mov rax, 1                  ; write
    mov rdi, 1                  ; stdout
    mov rsi, enter_name         ; "please enter your name:
    mov rdx, 24                 ; message size/length
    syscall

    ;; Read users name and store in "name"
    mov rax, 0                  ; read
    mov rsi, name               ; name buffer
    mov rdx, 32                 ; buffer size
    syscall

    ;; Write "Hello! "
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, 7
    syscall

    ;; Write the name of the user
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 32
    syscall

    mov rax, 60                 ; exit
    mov rdi, 0                  ; error code
    syscall
