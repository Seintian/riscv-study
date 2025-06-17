.eqv SYSCALL_EXIT, 93

.section .data
byte:
	.byte 255

halfword:
	.half 18

word:
	.word 18

doubleword:
	.dword 18

.section .text
.global _start
_start:
	la a0, byte
	lb a0, 0(a0)

_exit:
	li a7, SYSCALL_EXIT
	ecall
