.eqv SYSCALL_EXIT, 93

.section .data


.section .text

.global _start
_start:
	li a0, 0

_start__for:
	li t1, 0  # 0..
	li t0, 10 #  ..9

_start__for_cond:
	bge t1, t0, _start__for_end # i < 10

	# body
	add a0, a0, t1

	addi t1, t1, 1 # i++
	j _start__for_cond

_start__for_end:
	# a0 should be equal to 45

_exit:
	li a7, SYSCALL_EXIT
	ecall
