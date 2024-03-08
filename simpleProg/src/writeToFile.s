OPEN equ 5
WRITE equ 4
EXIT equ 1
CLOSE equ 6
STDOUT equ 1


global _start

section .text

_start:
  mov eax, OPEN ; open(
  mov ebx, file ; filename
  mov ecx, 2 | 64 ; read/write create
  mov edx, 0o0644 ; file permission
  int 0x80 ; ); call the system

  cmp eax, 0 ; test if file open
  jl open_failed ; if not jump to open_failed

  mov ebx, eax ; put file descriptor to ebx
  mov eax, WRITE ; write(
  mov ecx, msg ; message to write
  mov edx, msglen ; lenght of the message to write
  int 0x80 ; ); call the system 

  mov eax, CLOSE ; close file rdi already set
  int 0x80 ; call the system

  mov eax, EXIT ; exit(
  mov ebx, 0 ; error code 0
  int 0x80 ; ); call system

open_failed:
  mov eax, EXIT ; exit(
  mov ebx, 1 ; error code 1
  int 0x80 ; ); call system

section .rodata
  msg: db "Hello, World!", 10 ; Message to write in file
  msglen: equ $ - msg ; length of the message
  file db 'file', 0 ; filename
