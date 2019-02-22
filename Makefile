all: boot.bin

boot.bin: boot.asm
	nasm $< -f bin -o $@
