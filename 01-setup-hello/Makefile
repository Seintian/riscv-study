# Directories
SRC_DIR := src
BUILD_DIR := build
BIN_DIR := bin

# Files
SRCS := $(wildcard $(SRC_DIR)/*.S)
OBJS := $(patsubst $(SRC_DIR)/%.S,$(BUILD_DIR)/%.o,$(SRCS))
TARGET := $(BIN_DIR)/main.elf

# Tools
AS := riscv64-unknown-elf-as
LD := riscv64-unknown-elf-ld
OBJCOPY := riscv64-unknown-elf-objcopy
SPIKE := spike
PK := pk

# Flags
ASFLAGS := -march=rv64gc -mabi=lp64
LDFLAGS :=

# Default target
all: $(TARGET)

# Link the object files into an ELF binary
$(TARGET): $(OBJS) | $(BIN_DIR)
	$(LD) $(LDFLAGS) -o $@ $^

# Build rules
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.S | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR):
	@mkdir -p $@

$(BIN_DIR):
	@mkdir -p $@

# Run the first ELF file
run: $(TARGET)
	@$(SPIKE) $(PK) $(TARGET)

# Clean up
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

.PHONY: all run clean
