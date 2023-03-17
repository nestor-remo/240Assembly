; unsigned long num1 = 50,000,000,000;
;	unsigned int num2 = 3,333,333;
;	unsigned int quotient = 0, remainder = 0;
;	quotient = num1 / num2;
;	remainder = num1 % num2;

section .data
        num1      dq      50000000000
        num2      dd      3333333
        quotient  dw      0
       	remainder dw      0

section .text
        global _start

_start:
	       mov	    edx, dword[num1+4]
        mov     eax, dword[num1+0]
        div     dword[num2]

        mov     dword[quotient], eax
        mov     dword[remainder], edx

        mov     rax, 60
        mov     rdi, 0
        syscall
