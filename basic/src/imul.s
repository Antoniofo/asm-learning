EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
  x db '7'
  y db '2'
  newl db 10

section .bss
  sum resb 1
  sum2 resb 1

section .text
  global _start

_start:

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, x
  mov edx, 1
  int 0x80

  call new_line

  mov al, 1
  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, y
  mov edx, 1
  int 0x80

  movzx ax, byte [x]
  sub ax, '0'
  mov bl, byte [y]
  sub bl, '0'
  div bl
  add al, '0'
  add ah, '0'

  mov [sum], al
  mov [sum2], ah

  call new_line

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, sum
  mov edx, 1
  int 0x80

  call new_line

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, sum2
  mov edx, 1
  int 0x80

  call new_line

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
