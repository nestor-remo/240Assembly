; Calculates 1+2+3+...+100 and displays the result in a terminal window
; char str1[] = "1+2+3+...+100=";
; register char cx = 1;
; short sum = 0;
; char ascii[5] = "0000\n";
; for(cx=1; cx<=100; cx++)
;     sum += cx;
; ascii = itoa(sum);
; cout << str1 << ascii;

section .data
  str1  db "1 + 2 + 3 + ... + 100 = "
  sum   dw  0
  ascii dw "00", 100

section .text
  global _start

_start:
  mov cl, 1

  doloop: 
    add dword[sum], cl
    inc cl
    cmp cl, 100
    jbe doloop
    
  mov rax, 60
  mov rsi, 0
  syscall
