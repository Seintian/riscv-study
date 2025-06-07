# Chapter 03 — Core Instructions

This chapter introduces key RISC-V instruction categories through practical examples and theory. You will explore arithmetic, branching, memory access, and logic instructions — fundamental for writing RISC-V assembly programs.

---

## RISC-V Instruction Categories and Examples

### 1. Arithmetic Instructions (`arithmetic.S`)

Used to perform integer math operations on registers. These instructions modify register values by adding, subtracting, or multiplying.

- `add`: Adds two registers  
- `sub`: Subtracts one register from another  
- `mul`: Multiplies two registers (requires M-extension)  

Example:

```S
add t0, t1, t2   # t0 = t1 + t2
sub t3, t4, t5   # t3 = t4 - t5
mul t6, t7, t8   # t6 = t7 * t8
```

### 2. Branching Instructions (branching.S)

Control program flow based on comparisons. These instructions allow conditional jumps and function calls.

- `beq` (branch if equal): jumps if two registers are equal
- `bne` (branch if not equal)
- `jal` (jump and link): jumps to an address and saves return address
- `jalr` (jump and link register): indirect jump through register

Example:

```S
beq t0, t1, label   # jump to label if t0 == t1
bne t2, t3, label   # jump if t2 != t3
jal ra, function    # jump to function and save return address
jalr ra, t0, 0      # indirect jump using t0
```

### 3. Memory Instructions (memory.S)

Load and store data between memory and registers. These instructions handle different data sizes and signed/unsigned variants.

- `lb`/`lbu`: load byte (signed/unsigned)
- `lh`/`lhu`: load halfword (16-bit)
- `lw`/`lwu`: load word (32-bit)
- `sb`: store byte
- `sh`: store halfword
- `sw`: store word

Example:

```S
lw t0, 0(sp)       # load 32-bit word from memory at sp+0
sb t1, 4(t2)       # store byte from t1 at memory address t2+4
```

### 4. Logic Instructions (logic.S)

Perform bitwise operations on register values, used in masks, flags, and low-level data manipulation.

- `and`: bitwise AND
- `or`: bitwise OR
- `xor`: bitwise XOR
- `sll`: shift left logical
- `srl`: shift right logical
- `sra`: shift right arithmetic (preserves sign)

Example:

```S
and t0, t1, t2     # t0 = t1 & t2
or t3, t4, t5      # t3 = t4 | t5
xor t6, t7, t8     # t6 = t7 ^ t8
sll t9, t10, 2     # t9 = t10 << 2
sra t11, t12, 1    # arithmetic shift right by 1
```

---

## Summary

| Category   | Purpose                             | Example Instructions        |
| ---------- | ----------------------------------- | --------------------------- |
| Arithmetic | Integer math operations             | `add`, `sub`, `mul`               |
| Branching  | Conditional and unconditional jumps | `beq`, `bne`, `jal`, `jalr`         |
| Memory     | Load/store bytes, halfwords, words  | `lb`, `lh`, `lw`, `sb`, `sh`, `sw`      |
| Logic      | Bitwise and shift operations        | `and`, `or`, `xor`, `sll`, `srl`, `sra` |

---

## Practice Project Ideas

- Write a program performing arithmetic calculations with conditional branching.
- Implement memory load/store sequences to copy data buffers.
- Use logic instructions to manipulate bit flags and masks.

This chapter lays the foundation for understanding how RISC-V instructions manipulate data and control execution flow at the core level.
