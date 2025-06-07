# RISC-V Assembly Study

This repository contains a structured, self-paced course on RISC-V Assembly, from the basics through advanced topics. All examples are written for Linux on RISC-V under the Spike simulator with the proxy kernel (`spike pk`).

## Repository Layout

Each chapter lives in its own directory (`ChapterXX_Name`) with a `README.md` detailing:
- **Goals**: What you'll learn
- **Key Topics**: Core concepts and instructions
- **Exercises**: Hands-on coding tasks

```sh
riscv-study/
├── README.md                       # Course overview and navigation
├── Chapter01_Setup_Hello/          # Chapter 1: Setup & Hello World
│   └── README.md
├── Chapter02_Registers_ABI/        # Chapter 2: Registers & ABI
│   └── README.md
├── Chapter03_Core_Instructions/    # Chapter 3: Core Integer Instructions
│   └── README.md
├── Chapter04_Memory_DataLayout/    # Chapter 4: Memory Access & Data Layout
│   └── README.md
├── Chapter05_ControlFlow_Loops/    # Chapter 5: Control Flow & Translating Loops
│   └── README.md
├── Chapter06_Procedures_Recursion/ # Chapter 6: Procedures & Recursion
│   └── README.md
├── Chapter07_Syscalls_IO/          # Chapter 7: System Calls & I/O
│   └── README.md
├── Chapter08_Macros_Directives/    # Chapter 8: Assembler Directives & Macros
│   └── README.md
├── Chapter09_DataStructures/       # Chapter 9: Data Structures & Complex C Translation
│   └── README.md
├── Chapter10_CSR_Exceptions/       # Chapter 10: Interrupts, Exceptions & CSRs
│   └── README.md
├── Chapter11_Advanced_ISA/         # Chapter 11: Optimization & Advanced ISA
│   └── README.md
└── Chapter12_Debug_Profiling/      # Chapter 12: Debugging, Profiling & Toolchain Tips
    └── README.md
```

---

## Getting Started

1. Ensure you have installed:
    - RISC-V GNU toolchain (`riscv64-unknown-linux-gnu-gcc`, `riscv64-unknown-linux-gnu-as`, `riscv64-unknown-linux-gnu-ld`)
    - Spike simulator and proxy kernel (`spike`, `pk`)
2. Clone this repository:

```sh
git clone https://github.com/yourusername/riscv-study.git
cd riscv-study
```

Jump into Chapter 1:

```sh
cd Chapter01_Setup_Hello
less README.md
```
