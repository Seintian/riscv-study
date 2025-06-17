# Chapter 05 — Control Flow and Loops

This chapter focuses on implementing loop structures in RISC-V using basic branching and jump instructions. Since assembly has no built-in `for`, `while`, or `do-while` constructs, these are created manually using labels and conditional jumps.

---

## Loop Patterns in RISC-V

### 1. `while` Loop

```c
while (condition) {
    body;
}
```

RISC-V equivalent:

```S
loop:
    # Evaluate condition
    beq x0, t0, end     # if (t0 == 0) break;

    # Body
    addi t1, t1, 1

    j loop
end:
```

### 2. for Loop

```c
for (int i = 0; i < n; i++) {
    body;
}
```

RISC-V equivalent:

```S
    li t0, 0            # i = 0
    li t1, 10           # n = 10
loop:
    bge t0, t1, end     # if (i >= n) break;

    # Body
    addi t2, t2, 2

    addi t0, t0, 1      # i++
    j loop
end:
```

---

## Useful instructions

| Mnemonic | Meaning                             |
| -------- | ----------------------------------- |
| `beq`    | Branch if equal                     |
| `bne`    | Branch if not equal                 |
| `blt`    | Branch if less than                 |
| `bge`    | Branch if greater or equal          |
| `bnez`   | Branch if not zero                  |
| `j`      | Unconditional jump                  |
| `li`     | Load immediate                      |
| `addi`   | Add immediate (increment/decrement) |

---

## Practice Project

Create an assembly file with three sections:

1. A loop that counts from 0 to 9 using a for loop structure.
2. A while loop that sums all even numbers from 1 to 20.
3. A do-while loop that runs once regardless of the condition.

Test your code in your RISC-V emulator or simulator. Use print macros or register inspection to verify results.
