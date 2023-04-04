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
  str1  db "1 + 2 + 3 +...+ 100 = "
  sum   dw  0
  ascii db "0000", 10

section .text
  global _start

_start:
  mov cx, 1

 doloop:
    add word[sum], cx
    inc cx
    cmp cx, 100
    jbe doloop

    mov ax, word[sum]
    mov dx, 0
    mov bx, 1000
    div bx
    add byte[ascii+0], al
    mov ax, dx
    mov dx, 0
    mov bx, 100
    div bx
    add byte[ascii+1], al
    mov ax, dx
    mov dx, 0
    mov bx, 10
    div bx
    add byte[ascii+2], al
    mov ax, dx
    mov dx, 0
    mov bx, 1
    div bx
    add byte[ascii+3], al
    mov byte[ascii+4], 10

    mov rax, 1
    mov rdi, 1
    mov rsi, str1
    mov rdx, 22
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, ascii
    mov rdx, 5
    syscall

    mov rax, 60
    mov rsi, 0
    syscall
