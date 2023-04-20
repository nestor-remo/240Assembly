;char msg1[] = "Input a number (1~9) : ";
;char msg2[] = "Multiple of 3 include: ";
;char buffer;
;char num;
;char ascii[10];
;register int r10 = 0;
;do {
; cout << msg1;
; cin >> buffer;
; ascii[r10] = buffer;
; r10++;
;} while(r10 < 9);
; r10 = 0;
;do {
; num = atoi(ascii[r10]);
; if(num%3 == 0) {
;  cout << ascii[r10] << msg2;
; }
; r10++;
;} while(r10 < 9);

section .bss
 num resb 1
 buffer resb 2
 ascii resb 10

section .data
 msg1 db "Input a number (1~9): ", 10, 0
 msg2 db "Multiple of 3 include: ", 10, 0

section .text
 global _start

_start:
 mov r10, 0

 doloop:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg1
  mov rdx, 22
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, buffer
  mov rdx, 2
  syscall

  mov sil, byte[buffer]
  mov byte[ascii+r10], sil

  inc r10
  cmp r10, 9
  jl doloop

 mov r10, 0

doloop2:
  mov al, byte[ascii+r10]
  and al, 0fh
  mov byte[num], al

  mov ah, 0
  mov al, byte[num]
  mov bl, 3
  div bl
  cmp ah, 0
  je divisible

  inc r10
  cmp r10, 9
  jl doloop2

divisible:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg2
  mov rdx, 23
  syscall

  mov rax, 1
  mov rdi, 1
  lea rsi, byte[ascii+r10]
  mov rdx, 1
  syscall

  mov rax, 1
  mov rdi, 1
  mov byte[ascii], 10
  mov rsi, ascii
  mov rdx, 1
  syscall

  inc r10
  cmp r10, 9
  jl doloop2

 mov rax, 60
 mov rdi, 0
 syscall
