
;unsigned char num1 = 250;	//data type: 8 bits
;unsigned char num2 = 200;	//data type: 8 bits
;unsigned char num3 = 120;	//data type: 8 bits
;unsigned short sum = 0	//data type: 16 bits
;unsigned int product = 0;	//data type: 32 bits

;sum = num1 + num2;
;product = sum * short(num3);

section .data
        num1     db      250                                    ;num1
        num2     db      200                                    ;num2
        num3     db      120                                    ;num3
        sum      dw      0                                      ;sum
        product  dd      0                                      ;product

section .text
        global _start

_start:
        mov     ah, 0
        mov     al, byte[num1]                                  ;al = num1 = 64h
        add     al, byte[num2]                                  ;al = al + num2 = 2Ch
        adc     ah, 0
        mov     word[sum], ax                                   ;sum = ax = 012C

        movzx   cx, byte[num3]
        mul     cx
        mov     word[product+2], dx
        mov     word[product+0], ax

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services
