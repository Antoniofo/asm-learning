EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1
READ equ 3
section .data
  endl db 0xA

section .bss
  num resb 1

section .text
  global _start

_start:
  mov cx, 10
  mov ax, '0'

l1:
  mov [num], ax
  mov eax, WRITE
  mov ebx, STDOUT
  push cx

  mov ecx, num
  mov edx, 1
  int 0x80

  mov ax, [num]
  sub ax, '0'
  inc ax
  add ax, '0'
  pop cx

  dec cx
  jnz l1

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, endl
  mov edx, 1
  int 0x80


endprog:
  mov eax, EXIT
  mov ebx, 0
  int 0x80
