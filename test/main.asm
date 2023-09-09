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

section .data
	prompt db "Enter Operations String: "
 	msg2 db " = "
	ascii db "000", 10

section .bss
	buffer resb 9

section .text
	global _start

_start:
	print prompt, 25

	scan buffer, 9
 print buffer, 9

	mov eax, 0
	mov bl, '+'
	mov rsi, buffer

lp:
	cmp byte [rsi], 0
	je pres

	cmp byte [rsi], '+'
	je padd

	cmp byte [rsi], '-'
	je psub

	cmp byte [rsi], '*'
	je pmul

	cmp byte [rsi], '/'
	je pdiv

	and byte [rsi], 0fh

	cmp bl, '+'
	je add_
	cmp bl, '-'
	je sub_
	cmp bl, '*'
	je mul_
	cmp bl, '/'
	je div_
	jmp pres

add_:
	add al, byte[rsi]
	jmp skip0

sub_:
	sub al, byte [rsi]
	jmp skip0

mul_:
	mul byte [rsi]
	jmp skip0

div_:
	mov edx, 0
	div byte [rsi]
	jmp skip0

padd:
	mov bl, '+'
	jmp skip0

psub:
	mov bl, '-'
	jmp skip0

pmul:
	mov bl, '*'
	jmp skip0

pdiv:
	mov bl, '/'
	jmp skip0

skip0:
	inc rsi
	jmp lp

pres:
	mov rcx, 2
	mov bx, 10
next2:
	xor rdx, rdx
	div bx
	add byte[ascii+rcx], dl
	dec rcx
	cmp rcx, 0
	jge next2

	print msg2, 3
	print ascii+2, 2

	mov rax, 60
	mov rdi, 0
	syscall
