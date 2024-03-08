EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1
READ equ 3

section .rodata
  msgeven db 'Number is even', 0xA
  evenlen equ $- msgeven
  msgodd db 'Number is odd', 0xA
  oddlen equ $- msgodd

section .bss
  entry resb 2

section .text
  global _start

_start:
  mov eax, READ
  mov ebx, STDIN
  mov ecx, entry
  mov edx, 2
  int 0x80

  mov  al, [entry]
  sub byte al, '0'
  test al, 1
  jz evn
  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, msgodd
  mov edx, oddlen
  int 0x80

  jmp endprog

evn:
  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, msgeven
  mov edx, evenlen
  int 0x80

endprog:
  mov eax, EXIT
  mov ebx, 0
  int 0x80
