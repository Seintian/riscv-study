# Chapter 2: Registers & ABI

## Goals

- Identify all 32 integer registers (`x0-x31`) and their ABI names/roles
- Understand the RISC-V calling convention, including argument passing, return values, and caller/callee‐saved registers
- Use registers correctly for Linux syscalls via `ecall` (with `a7` and `a0-a5`)
- Lay out a simple stack frame, preserving saved registers

## Key Topics

### Register Map

- `x0` (`zero`): hardwired zero
- `x1` (`ra`): return address
- `x2` (`sp`): stack pointer
- `x3` (`gp`): global pointer
- `x4` (`tp`): thread pointer
- `x5-x7` (`t0-t2`): temporaries
- `x8` (`s0`/`fp`): saved register/frame pointer
- `x9` (`s1`): saved register
- `x10-x17` (`a0-a7`): function arguments & syscall regs
- `x18-x27` (`s2-s11`): saved registers
- `x28-x31` (`t3-t6`): temporaries

### Calling Convention

- **Arguments:** `a0-a7` (registers), overflow on stack
- **Return values:** `a0-a1` (`a0` primary, `a1` for 64-bit RV32 combined, RV64 high bits)
- **Caller-saved:** `t0-t6`, `a0-a7`
- **Callee-saved:** `s0-s11`, `ra`
- **Stack:** 16‑byte aligned on calls

### Syscall ABI

- Place syscall number in `a7`
- Arguments in `a0-a5`
- `ecall` triggers proxy‑kernel
- Return in `a0` (negative = `-errno`)

### Stack Frame Layout

```S
# Example prologue
addi sp, sp, -16        # allocate frame
sd   ra, 8(sp)          # save ra
sd   s0, 0(sp)          # save frame pointer
mv   s0, sp             # new frame pointer
# ... function body ...
# Epilogue
mv   sp, s0
ld   s0, 0(sp)
ld   ra, 8(sp)
addi sp, sp, 16
ret
```

## Exercises

- List all registers with their ABI names in a table.
- Write a stub function in assembly that takes two integers, swaps them using only `t0-t2`, and returns.
- Invoke `getpid` via `ecall`, save the PID in `a0`, then exit with that status.
