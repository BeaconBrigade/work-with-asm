    global _say_hi
    global _is_smt_cool

    section .text

_say_hi:
    mov rax, 0x2000004 ; write
    mov rdi, 1 ; stdout
    mov rsi, msg ; msg to write
    mov rdx, msg.len ; length to write
    syscall
    
    ret

_is_smt_cool:
    push rbp
    sub rsp, 12 ; 8 + 4 bytes on the stack
    mov [rsp + 12], rdi ; store pointer to name (offset 12 bytes)
    mov [rsp + 4], rsi ; store length of name (offset 4 bytes)

    ; front of message
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, hello_front
    mov rdx, hello_front.len
    syscall

    ; print name
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, [rsp + 12]
    mov rdx, [rsp + 4]
    syscall

    ; end of message
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, hello_end
    mov rdx, hello_end.len
    syscall

    add rsp, 12
    pop rbp
    ret

    section .data

msg: db `What is up!!! - from asm\n`, 0
.len: equ $ - msg

hello_front: db "What are ya at ", 0
.len: equ $ - hello_front
hello_end: db `!!!\n`, 0
.len: equ $ - hello_end

