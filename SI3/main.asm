section .data
  hello db 'Hello, '
  msg db 'Enter name: '

section .bss
  input resb 1

section .text
  global _start

_start:

  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, 12
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, input
  mov rdx, 20
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, hello
  mov rdx, 7
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, input
  mov rdx, 20
  syscall

  mov rax, 60
  mov rdi, 0
  syscall
