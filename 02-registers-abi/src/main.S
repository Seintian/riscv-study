.include "src/macros.S"

.section .rodata
# ...

.section .text
.global _start
_start:
    # Call imported function
    call my_function

    # Exit with 0
    li a0, 0                # Set exit code to 0

_exit:
    # Exit the program
    li a7, SYSCALL_EXIT     # syscall number for exit
    ecall                   # Make the syscall
