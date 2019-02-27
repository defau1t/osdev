
.PHONY: all
all: print_bios print_without_bios bigprint interrupts modes

print_bios: print_with_bios/boot.asm print_with_bios/biosprint.inc
	nasm $< -i ./$(<D)/ -f bin -o $@.bin

print_without_bios: print_without_bios/boot.asm print_without_bios/nobiosprint.inc
	nasm $< -i ./$(<D)/ -f bin -o $@.bin

bigprint: bigprint/boot.asm bigprint/print.inc
	nasm $< -i ./$(<D)/ -f bin -o $@.bin

interrupts: interrupts/boot.asm interrupts/nobiosprint.inc
	nasm $< -i ./$(<D)/ -f bin -o $@.bin

modes: modes/boot.asm
	nasm $< -i ./$(<D)/ -f bin -o $@.bin
