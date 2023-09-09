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
 buffer1 resb 4
 buffer2 resb 4

section .data
 msg1 db "Input 1st number (0~9): " ;24
 msg2 db "Input 2nd number (0~9): " ;24
 msg3 db "Multiplication result : " ;24
 ascii db "00", 10 ;3

section .text
 global _start

_start:
	print	msg1, 24
	scan	buffer1, 4

	mov	rbx, buffer1
	call	toNumber

	print	msg2, 24
	scan	buffer2, 4

	mov	rbx, buffer2
	call	toNumber

 mov al, byte[num1]
 mov bl, byte[num2]
 call multiplication
 mov byte[result], al

	mov	rcx, 4
	mov	di, word[result]
	call	toAscii

 print	msg3, 24
 print ascii, 3

end:
 mov rax, 60
 mov rdi, 0
 syscall

toNumber:
	xor rax, rax
	mov	rdi, 10
	mov	rsi, 0
next0:
	mov	cl, byte[rbx+rsi]
	and	cl, 0fh
	add	al, cl
	adc	ah, 0
	inc	rsi
	cmp	rsi, 3
	jl	next0
	mov	word[num1], ax
	ret

next1:
	mov	ax, word[num1]
	mul	word[num2]
	mov	word[result], ax
	mov	word[result+2], dx
	cmp	cx, di
	jbe	next1
	ret

multiplication:
 mul byte[num2]
 ret

toAscii:
	mov	ax, di
	mov	bx, 10
next2:
	mov	dx, 0
	div	bx
	add byte[ascii+rcx], dl
	dec	cx
	cmp	cx, 0
	jge	next2
	ret
