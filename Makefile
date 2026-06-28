CC = gcc

CFLAGS = -Wall -Wextra -O2

C_SRC = $(shell find src -type f -name '*.c')
OBJ = $(C_SRC:.c=.o)

.PHONY: default clean run


default: riscasm

riscasm: $(OBJ)
	$(CC) $(CFLAGS) -o riscasm $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) riscasm

run: riscasm
	./riscasm test.asm test.bin