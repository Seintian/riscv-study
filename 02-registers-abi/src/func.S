.include "src/macros.S"

.section .data
    buffer: .space 20               # space for max 64-bit decimal + newline
    newline: .string "\n"
    buffer_end:                     # end of buffer, empty because I only need the address
    buffer_size: .dword buffer_end - buffer

.section .text
.global my_function
my_function:
    # Function prologue
    addi sp, sp, -16            # Allocate stack space
    sd ra, 8(sp)                # Save return address

    # Call getpid syscall
    # int getpid(void)
    li a7, SYSCALL_GETPID       # syscall number for getpid
    ecall                       # Make the syscall to get process ID

    # Call itoa to convert PID to string
    # void itoa(int value, char *str, int base)
    #                             a0 already contains the PID
    la a1, buffer               # Load address of buffer
    li a2, 10                   # Set base to 10
    call itoa                   # Call itoa function (void function)

    # Call write syscall to print PID with newline
    # ssize_t write(int fd, const void *buf, size_t count)
    li a0, FD_STDOUT            # file descriptor (stdout)
    la a1, buffer               # address of buffer
    ld a2, buffer_size          # number of bytes to write (20 + 2 for newline)
    li a7, SYSCALL_WRITE        # syscall number for write
    ecall                       # Make the syscall

    # Function epilogue
    ld ra, 8(sp)                # Restore return address
    addi sp, sp, 16             # Deallocate stack space
    ret                         # Return from function
