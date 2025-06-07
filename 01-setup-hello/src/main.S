.section .rodata
    msg: .asciz "Hello, RISC-V!\n"
    MSG_LEN = . - msg       # length of the message

.section .text
    .global _start
_start:
    # write(1, msg, len)
    li   a0, 1              # stdout fd
    la   a1, msg            # buf pointer
    li   a2, MSG_LEN        # length
    li   a7, 64             # syscall: write
    ecall

    # exit(0)
    li   a0, 0              # status
    li   a7, 93             # syscall: exit
    ecall
