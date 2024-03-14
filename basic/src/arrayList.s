EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1
READ equ 3
section .data
  endl db 0xA
  array db 4, 1, 3, 1
  sum db 0

section .text
  global _start

_start:

  mov eax, 4
  mov ebx, 0
  mov ecx, array

top:
  add ebx, [ecx]
  add ecx, 1
  dec eax
  jnz top

done:
  add ebx, '0'
  mov [sum], ebx

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
