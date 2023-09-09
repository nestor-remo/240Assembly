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
 num1 resb 1
 num2 resb 1
 result resb 1
 buffer resb 2

section .data
 msg1 db "Input 1st number (0~9): " ;24
 msg2 db "Input 2nd number (0~9): " ;24
 msg3 db "Multiplication result : " ;24
 ascii db "00", 10 ;3

section .text
 global _start

_start:
 mov rbx, msg1
 call toNumber
 mov byte[num1], al

 mov rbx, msg2
 call toNumber
 mov byte[num2], al

 mov al, byte[num1]
 mov bl, byte[num2]
 call multiplication
 mov byte[result], al

 mov di, [result]
 call toAscii
 print msg3, 24
 cmp byte[result], 10
 jb greater
 print ascii, 2
 jmp end

greater:
 print ascii+1,1 

end:
 mov rax, 60
 mov rdi, 0
 syscall

multiplication:
 mul bl
 ret

toNumber:
 lp:
  mov rdi, rbx
  mov rsi, 24
  print rdi, rsi
  mov rbx, buffer
  mov rsi, 2
  scan rbx, rsi
  cmp byte[buffer], '0'
  jb lp
  cmp byte[buffer], '9'
  ja lp
  mov al, byte[buffer]
  sub al, '0'
  ret

toAscii:
 mov ax, di
 mov bx, 10
next2:
 mov dx, 0
 div bx
 add byte[ascii+rcx], dl
 dec cx
 cmp cx, 0
 jge next2
 ret
