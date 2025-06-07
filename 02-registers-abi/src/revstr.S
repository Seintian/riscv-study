# void reverse(char str[], int length)
# {
#     int start = 0;
#     int end = length - 1;
#     while (start < end) {
#         char temp = str[start];
#         str[start] = str[end];
#         str[end] = temp;
#         end--;
#         start++;
#     }
# }

.global revstr
revstr:
    # input: a0 = str, a1 = length

    li t0, 0                    # start = 0
    addi t1, a1, -1             # end = length - 1

_revstr_loop:
    bge t0, t1, _revstr_done    # if start >= end, done

    add t2, a0, t0              # t2 = str + start
    add t3, a0, t1              # t3 = str + end

    lbu t4, 0(t2)               # temp = str[start]
    lbu t5, 0(t3)               # t5 = str[end]
    sb t5, 0(t2)                # str[start] = str[end]
    sb t4, 0(t3)                # str[end] = temp

    addi t0, t0, 1              # start++
    addi t1, t1, -1             # end--

    j _revstr_loop              # Repeat the loop

_revstr_done:
    ret
