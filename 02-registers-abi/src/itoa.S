# char* itoa(int num, char* str, int base)
# {
#     int i = 0;
#     bool isNegative = false;
# 
#     # Handle 0 explicitly, otherwise empty string is
#     # printed for 0
#     if (num == 0) {
#         str[i++] = '0';
#         str[i] = '\0';
#         return str;
#     }
# 
#     # In standard itoa(), negative numbers are handled
#     # only with base 10. Otherwise numbers are
#     # considered unsigned.
#     if (num < 0 && base == 10) {
#         isNegative = true;
#         num = -num;
#     }
# 
#     # Process individual digits
#     while (num != 0) {
#         int rem = num % base;
#         if (rem > 9)
#             str[i++] = (rem - 10) + 'a';
#
#         else
#             str[i++] = rem + '0';
#
#         num = num / base;
#     }
# 
#     # If number is negative, append '-'
#     if (isNegative)
#         str[i++] = '-';
# 
#     str[i] = '\0'; # Append string terminator
# 
#     # Reverse the string
#     reverse(str, i);
# 
#     return str;
# }

.global itoa
itoa:
    # input: a0 = value, a1 = str, a2 = base

_itoa_begin:
    # Handle 0 explicitly, otherwise empty string is printed for 0
    bnez a0, __itoa_not_zero
    li t0, '0'                      # Load ASCII '0'
    sb t0, 0(a1)                    # str[0] = '0'
    sb zero, 1(a1)                  # str[1] = '\0'
    ret

__itoa_not_zero:
    # Function prologue
    addi sp, sp, -32                # Allocate stack space
    sd ra, 24(sp)                   # Save return address

    # Store saved for locals
    sd s0, 16(sp)                   # Save s0 (used for i)
    sd s1, 8(sp)                    # Save s1 (used for isNegative)

    # Function body
    # Initialize locals
    mv s0, a1                       # backup copy of str pointer
    li s1, 0                        # isNegative = false

    # If num < 0 and base == 10, set isNegative = true
    bgez a0, __itoa_positive
    li t0, 10                       # Load base 10 into t0
    bne a2, t0, __itoa_positive     # If base != 10, skip negation
    li s1, 1                        # isNegative = true
    neg a0, a0                      # Negate num (=> sub a0, zero, a0)

__itoa_positive:
    # Process individual digits
__itoa_while:
    beqz a0, __itoa_done            # If num == 0, exit loop

    # Get remainder and convert to character
    rem t0, a0, a2                  # t0 = num % base

    #         if (rem > 9)
    #             str[i++] = (rem - 10) + 'a';
    #
    #         else
    #             str[i++] = rem + '0';
    li t1, 9
	ble t0, t1, __itoa_if_gt_9_else
	addi t0, t0, -10
	addi t0, t0, 'a'
	sb t0, 0(a1)					# str[i++] = (rem - 10) + 'a'
	j __itoa_if_gt_9_end

__itoa_if_gt_9_else:
	addi t0, t0, '0'
	sb t0, 0(a1)					# str[i++] = rem + '0'

__itoa_if_gt_9_end:
	addi a1, a1, 1                  # Move to next position in str

    # Divide num by base
    divu a0, a0, a2                 # num = num / base
    j __itoa_while                  # Repeat the loop

__itoa_done:
    # If number is negative, append '-'
    beqz s1, __itoa_if_no_neg       # If isNegative == 0, skip

    li t0, '-'                      # Load ASCII '-'
    sb t0, 0(a1)                    # str[i++] = '-'
    addi a1, a1, 1

__itoa_if_no_neg:
    sb zero, 0(a1)                  # str[i] = '\0' (null terminator)

    # Reverse the string
    mv a0, s0                       # Restore original str pointer
    sub a1, a1, s0                  # Calculate length of the string
    call revstr                     # Call reverse function

_itoa_end:
    # Function epilogue
    ld s1, 8(sp)                    # Restore old s1
    ld s0, 16(sp)                   # Restore old s0
    ld ra, 24(sp)                   # Restore return address
    addi sp, sp, 32                 # Deallocate stack space

    ret                             # Return from function
