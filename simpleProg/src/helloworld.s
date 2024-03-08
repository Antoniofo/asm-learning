EXIT equ 1
WRITE equ 4
STDOUT equ 1
CODE_SUCCESS equ 0

global _start

section .text

_start:

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, msg
  mov edx, msglen
  int 0x80

  mov eax, EXIT
  mov ebx, CODE_SUCCESS
  int 0x80

section .rodata
  msg db "Hello World", 10
  msglen equ $ - msg
