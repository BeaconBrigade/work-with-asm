    global _say_hi
    global _is_smt_cool
    extern _printf

    section .text

_say_hi:
    sub rsp, 8

    mov rdi, msg
    call _printf

    add rsp, 8
    ret

_is_smt_cool:
    sub rsp, 8
    ; first argument to the %s placeholder
    mov rsi, rdi
    mov rdi, hello
    call _printf

    add rsp, 8
    ret

    section .data

msg: db 'What is up!!! - from asm', 10, 13, 0
hello: db 'What are ya at %s!!!', 10, 13, 0
