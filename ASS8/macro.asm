;#begin define print(string, numOfChar)
;	rax = 1;
;	rdi = 1;
;	rsi = &string;
;	rdx = numOfChar;
;	syscall;
;#end
;#begin define scan(buffer, numOfChar)
;	rax = 1;
;	rdi = 1;
;	rsi = &buffer;
;	rdx = numOfChar;
;	syscall;
;#end

;char buffer[4];
;long n;
;short sumN;
;char msg1[26] = "Input a number (100~255): ";
;char msg2[16] = "1 + 2 + 3 +...+ ";
;char msg3[4] = " = ";
;char ascii[6] = "00000\n";

;print(msg1, 26);
;scan(buffer, 4);
;n = atoi(buffer);
;rsi = 0;
;do {
;    sumN += rsi;
;} while(rsi >= 0);
;ascii = itoa(sumN);
;print(msg2, 20);
;print(buffer, 3);
;print(msg3, 3);
;print(ascii, 6);

%macro print 2
 mov rax, 1
 mov rdi, 1
 mov rsi, %1
 mov rdx, %2
 syscall
%endmacro

%macro scan 2
 mov rax, 0
 mov rdi, 0
 mov rsi, %1
 mov rdx, %2
 syscall
%endmacro

section .bss
 buffer resb 4
 n resw 1
 sumN resw 1

section .data
 msg1 db "Input a number (100~255): "
 msg2 db "1 + 2 + 3 +...+ "
 msg3 db " = "
 ascii db "00000", 10

section .text
 global _start

_start:
 print msg1, 26
 scan buffer, 4

 mov ax, 0
 mov bx, 10
 mov rsi, 0

next0:
 mov cl,byte[buffer+rsi]
 and byte[buffer+rsi], 0fh
 add al, byte[buffer+rsi]
 adc ah, 0
 mov byte[buffer+rsi], cl
 cmp rsi, 2
 je skip0
 mul bx

skip0:
 inc rsi
 cmp rsi, 3
 jl next0
 mov word[n], ax

 mov cx, 0

next1:
 add word[sumN], cx
 inc cx
 cmp cx, word[n]
 jbe next1

 mov rdi, 4
 mov ax, word[sumN]

next2:
 mov dx, 0
 mov bx, 10
 div bx
 add byte[ascii+rdi], dl
 dec rdi
 cmp rdi, 0
 jge next2

 print msg2, 16
 print buffer, 3
 print msg3, 3
 print ascii, 6

 mov rax, 60
 mov rdi, 0
 syscall
