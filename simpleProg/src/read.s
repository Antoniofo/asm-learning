WRITE equ 4
STDOUT equ 1
READ equ 3
STDIN equ 0
EXIT equ 1

global _start

section .text

_start:
  mov eax, READ ; read(
  mov ebx, STDIN ; user input STDIN
  mov ecx, buffer
  mov edx, 256 ; count
  int 0x80 ; ); call the system


  mov eax, WRITE ; write(
  mov ebx, STDOUT
  mov ecx, buffer ; message to write
  mov edx, 256
  int 0x80 ; ); call the system

  mov eax, EXIT ; exit(
  mov ebx, 0 ; error code 0
  int 0x80 ; ); call system


section .bss
  buffer resb 256
