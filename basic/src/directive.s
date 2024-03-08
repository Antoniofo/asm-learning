%assign TOTAL 10
section .text
  global _start

_start:
  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, msg
  mov edx, msglen
  int 0x80

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, TOTAL
  mov edx, 2
  int 0x80

  %assign TOTAL 20

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, TOTAL
  mov edx, 2
  int 0x80

  mov eax, EXIT
  mov ebx, 0
  int 0x80

section .data
  msg db 'Voici le total', 10
  msglen equ $ - msg
 

  EXIT equ 1
  WRITE equ 4
  STDIN equ 0
  STDOUT equ 1
