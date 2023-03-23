section .data
  sum db 0

section .text
 global _start

_start:
  mov cl, 1
 doloop:
  add byte[sum], cl
  inc cl
  cmp byte[sum], 200
  jbe doloop

 mov rax, 60
 mov rdi, 0
 syscall
