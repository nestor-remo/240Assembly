; short num1 = 30000
;	short num2 = 40000
;	int sum = 0
;	sum = int(num1 + num2)


section .data
        num1     dw      30000                                    ;num1 = 64h
        num2     dw      40000                                    ;num2 = 0C8h = 200
        dif      dd      0                                      ;dif = 00h

section .text
        global _start

_start:
        mov     dx,0                                ;al = num1 = 64h
        mov     ax, word[num1]
        sub     ax, word[num2]                             ;al = al - num2 = 9ch
	sbb	dx, 0						;ah = ah - 0 - CF = 0ffh
        mov     word[dif+0], ax                                   ;dif = ax = 0ff9ch = -100
        mov     word[dif+2], ax
        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services
