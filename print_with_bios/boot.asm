; vim: ft=nasm

jmp main

%include "print_with_bios/biosprint.inc"

[ORG 0x7c00]

main:
	xor ax, ax
	mov ds, ax
	cld

	BiosPrint msg

hang:
	jmp hang

msg   db 'Hello World', 13, 10, 0

	times 510-($-$$) db 0
	db 0x55
	db 0xAA
