; int test = (10);
; int greater = 0;
; int less = 0;
; int between = 0;
; if(test <= 50){ less += 1; }
; else if(test >= 60){ greater += 1; }
; else{ between += 1; }
; return 0;

section .data
  num     dw 10
  greater  dw 0
  less     dw 0
  between  dw 0

section .text
  global _start

_start:
  mov al, byte[num]
  cmp al, 50
  jle less_block
  cmp al, 60
  jge great_block
  inc word[between]

less_block:
  inc word[less]
  jmp end_if

great_block:
  inc word[greater]
  jmp end_if

end_if:
  mov rax, 60
  mov rdi, 0
  syscall
