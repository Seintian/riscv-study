# Chapter 04 — Memory and Data Layout in RISC-V

## Theory: Understanding Data Layout in Memory

Memory layout refers to **how data is stored, accessed, and aligned** in memory. In RISC-V (like most modern architectures), this layout is **byte-addressable**, meaning each memory address refers to 1 byte.

### 1. Data Types and Sizes

| Type      | Size (bytes) | RISC-V Directives |
|-----------|--------------|-------------------|
| byte      | 1            | `.byte`           |
| halfword  | 2            | `.half`, `.2byte` |
| word      | 4            | `.word`, `.4byte` |
| doubleword| 8            | `.dword`, `.8byte`|

### 2. Alignment Rules

- Data types must be stored at **naturally aligned addresses**:
  - Byte: any address
  - Halfword: multiple of 2
  - Word: multiple of 4
  - Doubleword: multiple of 8

Incorrect alignment can cause **exceptions** or **slower access**.

### 3. Endianness

RISC-V uses **Little Endian** byte order:
- Least Significant Byte (LSB) is stored at the **lowest memory address**.

Example:

```S
.word 0x12345678
```

Stored as:

```S
address:   +0  +1  +2  +3
value:    78  56  34  12
```

### 4. Data Layout and Padding

When you declare multiple values or structures, the assembler:

- Aligns each based on type
- May insert padding between elements

```S
.section .data
.byte 0xAA
.word 0x12345678    # Assembler will align to next 4-byte boundary
```

### 5. Memory Access Instructions

| Instruction | Loads/Stores | Size    | Signed? |
| ----------- | ------------ | ------- | ------- |
| `lb` / `sb` | Byte         | 1 byte  | Yes     |
| `lbu`       | Byte         | 1 byte  | No      |
| `lh` / `sh` | Halfword     | 2 bytes | Yes     |
| `lhu`       | Halfword     | 2 bytes | No      |
| `lw` / `sw` | Word         | 4 bytes | Yes     |
| `lwu`       | Word         | 4 bytes | No      |
| `ld` / `sd` | Doubleword   | 8 bytes | Yes     |

### 6. Arrays and Strings

Arrays are laid out sequentially in memory. Strings (.asciz) are null-terminated:

```S
.section .rodata
arr: .word 1, 2, 3, 4
str: .asciz "Hi"   # Stored as 0x48 0x69 0x00
```

## Exercises

###  Exercise 1: Analyze Memory Layout

Given:

```S
.section .data
.byte 0x11
.half 0x2233
.word 0x44556677
.dword 0x8899AABBCCDDEEFF
```

- What address does each item start at?
- How many bytes of padding are inserted?

### Exercise 2: Load Data with Alignment

Write RISC-V assembly to:

- Load the `.half` and `.word` values from Exercise 1
- Use `lhu` and `lw`
- Print or inspect the loaded values

### Exercise 3: Reverse an Array in Memory

Given:

```S
.section .data
arr: .word 1, 2, 3, 4
```

Write a RISC-V program to reverse the elements in-place:

- Use `lw`/`sw`
- Do not allocate new memory

### Exercise 4: Investigate Endianness

- Store `.word 0x01020304`
- Write RISC-V assembly to load the first byte using `lb`
- What value do you get?
- What does this reveal about RISC-V byte ordering?

### Exercise 5: Use .space to Layout a Buffer

Declare:

- A 64-byte buffer using `.space`
- Store and load individual bytes using `sb` and `lb`
- Write RISC-V code to zero out the buffer in a loop

## Summary

- RISC-V is little-endian
- Data must be aligned to type size boundaries
- Load/store instructions must match data size
- Arrays and buffers are stored contiguously
- `.space` reserves memory; `.asciz` stores null-terminated strings

Mastering data layout is essential to avoid crashes, ensure performance, and correctly manipulate memory in RISC-V assembly.
