; vim: ft=nasm

jmp main

%include "print_without_bios/nobiosprint.inc"

[ORG 0x7c00]

main:
	xor ax, ax
	mov ds, ax
	mov ss, ax
	cld

	mov ax, 0xb800
	mov es, ax

	NoBiosPrint msg

	mov ax, 0xb800
	mov gs, ax
	mov bx, 0x0000
	mov ax, [gs:bx]

	mov word [reg16], ax
	call printreg16

hang:
	jmp hang

xpos db 0
ypos db 0
hexstr db '0123456789ABCDEF'
outstr16 db '0000', 0
reg16 dw 0
msg   db 'Hello World', 13, 10, 0

	times 510-($-$$) db 0
	db 0x55
	db 0xAA
