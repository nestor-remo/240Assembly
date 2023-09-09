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
	ascii db "000", 10
	equal db " = "

section .bss
	buffer resb 50

section .text
	global _start

_start:
	; Print prompt
	print prompt, 25

	; Read Input from user
	scan buffer, 50
	print buffer, 50

	; Evaluate expression
	mov eax, 0
	mov bl, '+'
	mov rsi, buffer

parse_loop:
	cmp byte [rsi], 0
	je print_result

	cmp byte [rsi], '+'
	je set_addition

	cmp byte [rsi], '-'
	je set_subtraction

	cmp byte [rsi], '*'
	je set_multiplication

	cmp byte [rsi], '/'
	je set_division

	and byte [rsi], 0fh

	cmp bl, '+'
	je add_number
	cmp bl, '-'
	je sub_number
	cmp bl, '*'
	je mul_number
	cmp bl, '/'
	je div_number
	jmp print_result

add_number:
	add al, byte[rsi]
	jmp next_char

sub_number:
	sub al, byte [rsi]
	jmp next_char

mul_number:
	mul byte [rsi]
	jmp next_char

div_number:
	mov edx, 0
	div byte [rsi]
	jmp next_char

set_addition:
	mov bl, '+'
	jmp next_char

set_subtraction:
	mov bl, '-'
	jmp next_char

set_multiplication:
	mov bl, '+'
	jmp next_char

set_division:
	mov bl, '/'
	jmp next_char
... (26 lines left)
Collapse
finalog2.0.txt
2 KB
nestiray — Today at 10:56 PM
ty ty
﻿
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
	ascii db "000", 10
	equal db " = "

section .bss
	buffer resb 50

section .text
	global _start

_start:
	; Print prompt
	print prompt, 25

	; Read Input from user
	scan buffer, 50
	print buffer, 50

	; Evaluate expression
	mov eax, 0
	mov bl, '+'
	mov rsi, buffer

parse_loop:
	cmp byte [rsi], 0
	je print_result

	cmp byte [rsi], '+'
	je set_addition

	cmp byte [rsi], '-'
	je set_subtraction

	cmp byte [rsi], '*'
	je set_multiplication

	cmp byte [rsi], '/'
	je set_division

	and byte [rsi], 0fh

	cmp bl, '+'
	je add_number
	cmp bl, '-'
	je sub_number
	cmp bl, '*'
	je mul_number
	cmp bl, '/'
	je div_number
	jmp print_result

add_number:
	add al, byte[rsi]
	jmp next_char

sub_number:
	sub al, byte [rsi]
	jmp next_char

mul_number:
	mul byte [rsi]
	jmp next_char

div_number:
	mov edx, 0
	div byte [rsi]
	jmp next_char

set_addition:
	mov bl, '+'
	jmp next_char

set_subtraction:
	mov bl, '-'
	jmp next_char

set_multiplication:
	mov bl, '+'
	jmp next_char

set_division:
	mov bl, '/'
	jmp next_char

next_char:
	inc rsi
	jmp parse_loop

print_result:
	; Convert result to ASCII
	mov rcx, 2
	mov bx, 10
next2:
	xor rdx, rdx
	div bx
	add byte[ascii+rcx], dl
	dec rcx
	cmp rcx, 0
	jge next2

	print equal, 3

	print ascii+2, 2

end:
	mov rax, 60
	mov rdi, 0
	syscall
