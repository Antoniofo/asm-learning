EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1
READ equ 3

section .data
  endl db 0xA
  achar db 0x30

section .text
  global _start

_start:

  call display

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, endl
  mov edx, 1
  int 0x80

endprog:
  mov eax, EXIT
  mov ebx, 0
  int 0x80

display:
  mov cx, 158

next:
  push cx
  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, achar
  mov edx, 1
  int 0x80

  pop cx
  sub ecx, 1
  mov ax, [achar]
  sub ax, '0'
  inc ax
  add ax, '0'
  mov [achar], ax
  dec cx
  jnz next
  ret

