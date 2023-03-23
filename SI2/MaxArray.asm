section .data
 list dd 1000, 750, 500, 250, 1250, 1500
 min  dw 0
 max  dw 0

section .text
 global _start

_start:
  mov rbx, list
  mov rsi, 0
  mov rcx, 6
  mov eax, 0
  lp:
   mov eax, dword[rbx + rsi * 4]
   cmp eax, dword[min]
   jl min_
   cmp eax, dword[max]
   jg max_
   inc rsi
   loop lp
  min_:
   mov dword[min], eax
   inc rsi
   jmp lp
  max_:
   mov dword[max], eax
   inc rsi
   jmp lp

  mov rax, 60
  mov rsi, 0
  syscall
