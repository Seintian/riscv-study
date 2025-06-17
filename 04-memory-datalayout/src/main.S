.eqv SYSCALL_EXIT, 93

.data
byte:
	.byte 18

halfword:
	.half 18

word:
	.word 18

doubleword:
	.dword 18

.text
.global _start
_start:
	li a0, 0

_exit:
	li a7, SYSCALL_EXIT
	ecall
