section .data
  list dd 2,3,5,7,9,11
  sum  dw 0
  avg  dw 0

section .text
  global _start

_start:
   mov rbx, list
   mov rsi, 0
   mov rcx, 6
   mov eax, 0
   lp:
     add eax, dword[rbx + rsi * 4]
     inc rsi
     loop lp
   mov dword[sum], eax
   idiv rsi
   mov dword[avg], eax

  mov rax, 60
  mov rsi, 0
  sycalll
