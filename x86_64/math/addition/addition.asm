    global _start

    section .bss
num: resb 8

    section .text
_start: 
    mov rcx, 18
    add rcx, 9

    mov [num], rcx              ; move the value of rcx to num

    ;; Exit
    mov rax, 0x3C               ; sys_exit ( 60 )
    xor rdi, [num]              ; exit with code to be the math we did
    syscall
