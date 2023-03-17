; ex2_addition.asm
; short num1 = 30000
; short num2 = 40000
; int sum = 0;
; sum = int(num1 + num2);

section .data
        num1     dw      30000                                    ;num1 = 7530h
        num2     dw      40000                                    ;num2 = 9C40h
        sum      dd      0                                      ;sum = 0h

section .text
        global _start

_start:
        mov     dx , 0                                  ;ax = num1 = 64h
        mov     ax, word[num1]                                  ;ax = ax + num2 = 2Ch
        add	ax, word[num2]						;ax = ax + 0 + CF = 0ffh
        adc    dx, 0                                   ;dif = ax = 0ff9ch = -100
        mov word[sum+0], ax
        mov word[sum+2], dx

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services
