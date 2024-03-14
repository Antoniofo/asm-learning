EXIT equ 1
WRITE equ 4
STDIN equ 0
STDOUT equ 1
READ equ 3

section .data
  endl db 0xA

section .bss
  fact resb 1

section .text
  global _start

_start:

  mov bl, 3

  call proc_fact
  add ax, '0'
  mov [fact], ax

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, fact
  mov edx, 1
  int 0x80

  mov eax, WRITE
  mov ebx, STDOUT
  mov ecx, endl
  mov edx, 1
  int 0x80

  jmp endprog

proc_fact:
  cmp bl,1
  jg do_calc
  mov ax,1
  ret

do_calc:
  dec bl
  call proc_fact
  inc bl
  mul bl
  ret

endprog:
  mov eax, EXIT
  mov ebx, 0
  int 0x80

