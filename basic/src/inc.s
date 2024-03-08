EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
  count db '8'
  newl db 10

section .text
  global _start

_start:

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, count
  mov edx, 2
  int 0x80


  inc byte [count]

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, count
  mov edx, 2
  int 0x80

  mov eax, EXIT
  mov ebx, 0
  int 0x80

new_line:
  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, newl
  mov edx, 1
  int 0x80
  ret
