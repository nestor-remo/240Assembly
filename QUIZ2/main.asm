; char num[10] = {-12,23,34,45,-56,67,-78,89,90,0};	//8-bit numeric array
; short posTotal;	//16-bit non-initial variable
; short negTotal;	//16-bit non-initial variable
; register long rcx = 0	//64-bit register
; while (num[rcx] != 0) {
;	 if(num[rcx] > 0)
;		 posTotal = posTotal + short(num[rcx]);
;	 else
;		 negTotal = negTotal + short(num[rcx]);
;	 rcx++;
; }

section .data
 num     db -12, 23, 34, 45, -56, 67, -78, 89, 90, 0
 posTotal dw 0
 negTotal dw 0

section .text
 global _start

_start:
  mov rbx, list
  mov rsi, 0
  mov rcx, 10
  mov eax, 0
  lp:
   mov eax, dword[rbx + rsi]
   cmp eax, 0
   jg pos
   cmp eax, 0
   jl min
   je end
   pos:
   add dword[posTotal], eax
   inc rsi
   loop lp
   min:
   add dword[negTotal], eax
   inc rsi
   loop lp

end:
  mov rax, 60
  mov rsi, 0
  syscall
