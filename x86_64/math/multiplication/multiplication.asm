    global _start

    section .bss
num: resb 8

    section .text
_start: 
    mov rax, 8
    mov rdx, 4
    mul rdx                     ; multiply rax with rdx

    mov [num], rax              ; move the value of rax to num

    ;; Exit
    mov rax, 0x3C               ; sys_exit ( 60 )
    xor rdi, [num]              ; set exit code to the result of our math 
    syscall
