%macro NoBiosPrint 1
	mov si, word %1
	call sprint
%endmacro

dochar: call cprint
sprint:
	lodsb
	cmp al, 0
	jne dochar
	add byte [ypos], 1
	mov byte [xpos], 0
	ret

cprint: mov ah, 0x0F
	mov cx, ax
	movzx ax, byte [ypos]
	mov dx, 160
	mul dx
	movzx bx, byte [xpos]
	shl bx, 1

	mov di, 0
	add di, ax
	add di, bx

	mov ax, cx
	stosw
	add byte [xpos], 1

	ret

printreg16:
	mov di, outstr16
	mov ax, [reg16]
	mov si, hexstr
	mov cx, 4
hexloop:
	rol ax, 4
	mov bx, ax
	and bx, 0x0F
	mov bl, [si + bx]
	mov [di], bl
	inc di
	dec cx
	jnz hexloop

	mov si, outstr16
	call sprint

	ret
