EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1
READ equ 3

section .data
  num1 db '54'
  num2 db '23'
  num3 db '22'
  msg db 'bigger', 0xA
  msglen equ $- msg
  endl db 10
section .bss
  largest resb 2

section .text
  global _start

_start:

  mov cx, [num1]
  cmp cx, [num2]
  jg nextcheck
  mov cx, [num2]

nextcheck:
  cmp cx, [num3]
  jg out
  mov cx, [num3]

out:
  mov [largest], cx
  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, largest
  mov edx, 2
  int 0x80

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, endl
  mov edx, 2
  int 0x80

endprog:
  mov eax, EXIT
  mov ebx, 0
  int 0x80
