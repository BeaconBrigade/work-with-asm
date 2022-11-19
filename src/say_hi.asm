    global _say_hi

    section .text

_say_hi:
    mov rax, 0x2000004 ; write
    mov rdi, 1 ; 1
    mov rsi, msg ; msg to write
    mov rdx, msg.len ; length to write
    syscall
    
    ret

    section .data

msg: db `What is up from asm!!!???\n`, 0
.len: equ $ - msg

