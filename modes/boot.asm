[ORG 0x7c00]

start:  xor ax, ax
  mov ds, ax
  mov ss, ax
  mov sp, 0x9c00

  cli
  push ds

  lgdt [gdtinfo]

  mov eax, cr0
  or al, 1
  mov cr0, eax

  mov bx, 0x08
  mov ds, bx

  and al, 0xFE
  mov cr0, eax

  pop ds
  sti

  mov bx, 0x0f01
  mov eax, 0x0b8000
  mov word [ds:eax], bx

  jmp $

gdtinfo:
  dw gdt_end - gdt - 1
  dw gdt

gdt dd 0,0
flatdesc db 0xff, 0xff, 0, 0, 0, 10010010b, 11001111b, 0
gdt_end:

  times 510-($-$$) db 0
  dw 0xAA55
