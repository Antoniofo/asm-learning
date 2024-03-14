EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1
READ equ 3

section .data
  endl db 0xA

section .bss
  sum resb 1

section .text
  global _start
_start:

  mov ecx, '4'
  mov edx, '3'
  sub ecx, '0'
  sub edx, '0'

  call addition

  add eax, '0'
  mov [sum], eax

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, sum
  mov edx, 1
  int 0x80

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, endl
  mov edx, 1
  int 0x80


endprog:
  mov eax, EXIT
  mov ebx, 0
  int 0x80

addition:
  mov eax, ecx
  add eax, edx
  ret
