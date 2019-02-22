BCONFIG_CONFIG ?= .config
export BCONFIG_CONFIG

-include $(BCONFIG_CONFIG)

obj-$(CONFIG_PRINT_BIOS) += print_with_bios/boot.asm
obj-$(CONFIG_PRINT_NOBIOS) += print_without_bios/boot.asm

.PHONY: all $(obj-y)
all: boot.bin

boot.bin: $(obj-y)
	nasm $< -f bin -o $@
