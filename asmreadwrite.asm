global  _start					
 
N equ 100						
 
 
section .bss						
var_read:	resb N										
 
section .text
errormessage: db "You was writed incorrect symbol in text.. Please, write only the latin letters", 80 
_start:
	call funclittlebig			
	call write			
	call exit					
 
funclittlebig:					
	call read					
	mov rcx, N					
	littlebig:						
		mov rdx, N
		sub rdx, rcx	
		xor rbx, rbx				
		mov bl, [var_read + rdx]
		cmp bl, 64
		jle You_Are_NOTletter
		cmp bl, 91
		je You_Are_NOTletter
		cmp bl, 92
		je You_Are_NOTletter
		cmp bl, 93
		je You_Are_NOTletter
		cmp bl, 94
		je You_Are_NOTletter
		cmp bl, 95
		je You_Are_NOTletter
		cmp bl, 96
		je You_Are_NOTletter
		cmp bl, 123
		jge You_Are_NOTletter
		cmp bl, 96 
		jl little
		sub bl, 32
		jmp l1
		little:
		add bl, 32
		l1:
		You_Are_NOTletter:
		mov [var_read + rdx], bl
		loop littlebig
 
	ret					
 
 
 
read:						
	mov rax, 0			
	mov rdi, 0		 
	mov rsi, var_read			
	mov rdx, N					
	syscall						 
	ret						
 
write:						
	mov rax, 1					
	mov rdi, 1					
	mov rsi, var_read				
	mov rdx, N					
	syscall						
	ret
;error:
	;mov rax, 1
	;mov rdi, 1
	;mov rsi, errormessage
	;mov rdx, 78
	;syscall
exit:						
	mov rax, 60					
	xor rdi, rdi					
	syscall
	ret
