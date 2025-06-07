# #include <stdio.h>
# 
# int main() {
#     int numbers[6] = {12, 45, -3, 89, 23, 17};
#     int max = numbers[0];
# 
#     for (int i = 1; i < 6; i++) {
#         // Load: numbers[i]
#         int current = numbers[i];
# 
#         // Compare & Branch
#         if (current > max) {
#             max = current;  // Store new max (arithmetic + store)
#         }
# 
#         // Optional logic op: mask sign bit (for debug/experiment)
#         int sign_mask = current >> 31;  // Arithmetic shift: -1 if negative, 0 if positive
#         if (sign_mask) {
#             printf("Negative number found: %d\n", current);
#         }
#     }
# 
#     printf("Max value = %d\n", max);
#     return 0;
# }

.eqv SYSCALL_EXIT, 93

.section .rodata
	numbers: .word 12, 45, -3, 89, 23, -17				# When the last number is negative, the program exits with "0xffffff|ff" (255)
	numbers_count: .dword 6

.section .text
.global _start
_start:
	la t0, numbers
	lw t3, 0(t0)										# max = *numbers
	la t1, numbers_count
	ld t1, 0(t1)										# numbers_count (double-word regardless of the sign, complete register)

_loop_begin:
	li t2, 1 											# i = 1

_loop_condition:
	bge t2, t1, _loop_end 								# i >= numbers_count

	slli t6, t2, 2 										# .word = 4 (2 ^ 2) * i
	add t5, t0, t6										# numbers + i
	lw t4, 0(t5)										# current = numbers[i]

	ble t4, t3, _loop__no_gt_max						# current > max
	addi t3, t4, 0										# max = current

_loop__no_gt_max:
	srai a0, t4, 31										# current >> 31 (get sign) as -1 (0xffff) or 0 (0x0)

_loop_step:
	addi t2, t2, 1 										# i++
	j _loop_condition

_loop_end:
_end:
	li a7, SYSCALL_EXIT
	ecall
