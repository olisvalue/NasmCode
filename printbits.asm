global  _start					
 
			
 
 
section .bss
var_bit: resb 8

section .text
_start:
mov al, 2 ; задаём число, которое напечатаем побитово
call BITperevod ; переводит число в побитовое представление
call write; печатает результат
call exit; завершение
BITperevod:
	mov rcx, 8
		gogogo:
			mov rdx, 8
			sub rdx, rcx 
			
			shl al, 1
			
			jc this_is_one ; после логического сдвига влево смотрим на бит переноса
			
			
			mov bl, '0'    ; если бит переноса пуст, значит, занесём в массив 0
			jmp print



			this_is_one:
			mov bl, '1'      ; если бит переноса НЕ пуст, занесём в массив 1

			print:
			mov [var_bit + rdx], bl
		loop gogogo
	ret
	
	
write:
	mov rax, 1			
	mov rdi, 1		 
	mov rsi, var_bit			
	mov rdx, 8					
	syscall						 
	ret


exit:						
	mov rax, 60					
	xor rdi, rdi					
	syscall
	ret
