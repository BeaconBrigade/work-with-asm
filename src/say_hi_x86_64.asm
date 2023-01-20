    global say_hi
    global is_smt_cool
    extern printf

    section .text

say_hi:
    sub rsp, 0x28

    mov rcx, msg
    call printf

    nop
    add rsp, 0x28
    ret

is_smt_cool:
    sub rsp, 0x28
    ; first argument to the %s placeholder
    mov rdx, rcx
    mov rcx, hello
    call printf

    nop
    add rsp, 0x28
    ret

    section .data

msg: db 'What is up!!! - from asm', 10, 13, 0
hello: db 'What are ya at %s!!!', 10, 13, 0