;ex_doWhile.asm
;register char cl = 1;
;char sum = 0;
;do {
;	sum = sum + cl;
;	cl++;
;} while(cl <= 10);

; register char cl = 1;
; unsigned short sum = 0;
;  do {
;	 sum = sum + (cl * cl);
;	 cl++;
; } while(cl <= 10);


section .data
        sum     dw      0

section .text
        global _start
_start:
	       mov	    cl, 1
  doloop:
        movzx   eax, cl
        mul     cl
        add     byte[sum], ax
        inc     cl
        cmp     cl, 10
        jbe     doloop

        mov     rax, 60
        mov     rdi, 0
        syscall
