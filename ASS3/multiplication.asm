; unsigned int num1 = 300,000;
; unsigned int num2 = 400,000;
; unsigned long product = 0;
;	product = long(num1 * num2);


section .data
        num1     dd      300000                                  ;num1 = 09C4h
        num2     dd      400000                                  ;num2 = 0DACh
        mult     dq      0                                      ;mult = 0000 0000h

section .text
        global _start

_start:
        mov     eax, dword[num1]                                  ;al = num1 = 09C4h
        mul     dword[num2]                                  	;dx:ax = ax * num2 = 0085:83B0h
        mov     dword[mult + 0], eax                                  ;mult = ax = 83B0h
        mov     dword[mult + 4], edx                                ;mult+2 = dx = 0085h

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services
