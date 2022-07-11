    global _start

    section .data
smilie:  db ":)", 0xA

    section .text
_start: 
    mov rcx, 10
    ;; Start loop
l1:
    ;; Save current state of rcx
    push rcx

    ;; Print a smilie
    mov rax, 1                  ; Write
    mov rdi, 1                  ; stdout
    mov rsi, smilie             ; ":)\n"
    mov rdx, 3
    syscall

    ;; Restore rcx after the write syscall
    pop rcx
    dec rcx
    cmp rcx, 0
    ;; If rcx > 0: continue iteration
    jg l1

    ;; Exit
    mov rax, 60
    mov rdi, 0
    syscall
