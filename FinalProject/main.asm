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
 buffer resb 10
 num resw 1
 result resw 1

section .data
 msg1 db "Enter Operations String: "
 msg2 db " = "
 ascii db "000", 10

section .text
 global _start

_start:
 print msg1, 25
 scan buffer, 10

 mov bx, 10
 mov rsi, 0
 mov ax, 0

next0:
 mov cl,byte[buffer+rsi]
 and cl, 0fh
 add al, cl
 and byte[buffer+rsi], 0fh
 add al, byte[buffer+rsi]
 adc ah,0
 cmp rsi, 8
 je skip0
 mul bx

skip0:
 inc rsi
 cmp rsi, 9
 jl next0
 mov word[num], ax

 mov cx, 0
next1:



 mov rcx, 4
 mov ax, word[result]

next2:
 mov dx, 0
 mov bx, 10
 div bx
 add byte[ascii+rcx], dl
 dec rcx
 cmp rcx, 0
 jge next2

 print buffer, 9
 print msg2, 3
 print ascii, 3

 mov rax, 60
 mov rdi, 0
 syscall
