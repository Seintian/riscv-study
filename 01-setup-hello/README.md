# Chapter 1: Setup & "Hello, World!"

## Goals

- Install and verify the RISC-V toolchain and Spike simulator
- Write, assemble, link, and run your first RISC-V assembly program under `spike pk`

## Prerequisites

- A Linux x86_64 system with developer tools installed (`GCC`, `make`, `git`)

## Sections

1. **Installing the RISC-V GNU Toolchain**
    - Follow the [SiFive toolchain instructions](https://github.com/riscv/riscv-gnu-toolchain)
    - Verify installation:

        ```bash
        riscv64-unknown-linux-gnu-gcc --version
        spike --help
        ```

2. **Building Spike & Proxy Kernel**

    ```bash
    # Clone riscv-isa-sim and proxy kernel
    git clone https://github.com/riscv/riscv-isa-sim.git
    cd riscv-isa-sim
    mkdir build && cd build
    ../configure --prefix=/opt/riscv
    make
    make install
    ```

3. **Your First Assembly Program**

    ```S
    .section .rodata
    msg:
        .asciz "Hello, RISC-V!\n"

    .section .text
    .globl _start
    _start:
        # write(1, msg, len)
        li   a0, 1              # stdout fd
        la   a1, msg            # buf pointer
        li   a2, 14             # length
        li   a7, 64             # syscall: write
        ecall

        # exit(0)
        li   a0, 0              # status
        li   a7, 93             # syscall: exit
        ecall
    ```

4. **Assemble, Link & Run**

    ```sh
    riscv64-unknown-linux-gnu-gcc -nostdlib -static hello.S -o hello.elf
    spike pk hello.elf
    ```

### Exercises

- Modify the message string and length. Rebuild and run.
- Change the exit code to a non-zero value and verify by checking `$?`.
