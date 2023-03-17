;unsigned short num1 = 325;
;unsigned short even = 0, odd = 0;
;if(num1 % 2 == 0) {
;    even++;
;} else {
;    odd++;
;}


section .data
        num1    dw      325
        even    db      0
        odd     db      0

section .text
        global _start
_start:
        mov     ax, word[num1]
        mov     bl, 2
        div     bl
        cmp     ah, 0
        je      if_block
        jmp     else_block

if_block:
        mov     ebx, even
        inc     byte[ebx]
        jmp     end_if

else_block:
        mov     ebx, odd
        inc     byte[ebx]

end_if:
        mov     rax, 60
        mov     rdi, 0
        syscall
