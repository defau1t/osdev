; vim: ft=nasm

jmp main

%include "print_without_bios/nobiosprint.inc"

[ORG 0x7c00]

main:
	xor ax, ax
	mov ds, ax
	cld

	NoBiosPrint msg

hang:
	jmp hang

msg   db 'Hello World', 13, 10, 0

	times 510-($-$$) db 0
	db 0x55
	db 0xAA
