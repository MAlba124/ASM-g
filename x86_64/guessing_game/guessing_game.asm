;; I know there is multiple mistakes in this code, i'm just beginning to learn assembly,
;; please excuse me. And it almost never works as intended

    global _start

    section .data
enter_character:    db "Please enter a character: "
correct:            db "Correct!", 0x0A
wrong:              db "Wrong!", 0x0A
correct_answer:     db "The correct answer was: "
newline:            db 0x0A

    section .bss
rand_buf:    resb 0x2           ; storage for random character
user_input:  resb 0x2           ; storage for input character

    section .text
_start: 
    ;; Get a random character
    mov rax, 0x13E              ; sys_getrandom ( 318 )
    mov rdi, rand_buf           ; random character buffer
    mov rsi, 0x2                ; length
    syscall

    ;; Print "Please enter a character: "
    mov rax, 0x1                ; Write
    mov rdi, 0x1                ; stdout
    mov rsi, enter_character    ; Message
    mov rdx, 0x1A               ; Message length
    syscall

    ;; Read character from user
    mov rax, 0x0                ; read
    mov rdi, 0x0                ; stdout
    mov rsi, user_input         ; read buffer
    mov rdx, 0x2                ; size
    syscall

    ;; Compare user input with random character
    mov al, [rand_buf]
    cmp al, [user_input]
    je _correct                 ; if they are equal print correct 

    mov rax, 0x1                ; write
    mov rdi, 0x1                ; stdout
    mov rsi, wrong              ; message
    mov rdx, 0x7                ; length
    syscall

    ;; Print correct answer
    mov rax, 0x1                ; write
    mov rdi, 0x1                ; stdout
    mov rsi, correct_answer     ; correct answer
    mov rdx, 0x18               ; length ( 24 )
    syscall
    ;; Print the actual character
    mov rax, 0x1                ; write
    mov rdi, 0x1                ; stdout
    mov rsi, rand_buf           ; correct answer
    mov rdx, 0x2                ; length
    syscall
    ;; newline
    mov rax, 0x1                ; write
    mov rdi, 0x1                ; stdout
    mov rsi, newline            ; newline
    mov rdx, 0x1                ; length
    syscall

    jmp xit                     ; exit

_correct:
    ;; print "Correct!"
    mov rax, 0x1                ; write
    mov rdi, 0x1                ; stdout'
    mov rsi, correct            ; message
    mov rdx, 0x9                ; length
    syscall

xit:
    ;; Exit
    mov rax, 0x3C               ; sys_exit ( 60 )
    xor rdi, rdi                ; exit code 0
    syscall
