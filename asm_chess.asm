global  main

N equ 72


section .bss
var_paint:  resb N
var_fd: resq 1

section .data
name: db "chess.txt", 0

section .text

main:
    call funcdraw
    call write
    call exit

funcdraw:
    mov rcx, N
    paintdraw:
        mov rdx, N
        sub rdx, rcx    ; rdx принимает знач. от 0 до N-1 
        mov al, 48 ; код нуля ascii
        mov [var_paint + rdx], al ; положили ноль в i-тый элемент массива

        mov bl, 2
        mov rax, rdx ; чтобы узнать остаток от деления на 2 от rdx
        div bl
        cmp ah, 1 ; сравниваем остаток от деления на 2
        jne it_is_0  ; если остаток от деления на 2 равен единице то
        mov bl, 49  ; положим в i-тый элемент массива единицу
        mov [var_paint + rdx], bl ; ставим единичку если нечётный номер
        it_is_0:

        mov rax, rdx; поставим \n
        mov bl, 9 ; 
        div bl
        cmp ah, 0 ; если остаток от деления на 9 равен нулю, то есть номер числа в массиве кратен 9
        jne not_newline ; если же число не кратно 9, то не ставим туда \n, там уже 0 или 1 
        mov bl, 10      ;тогда каждый девятый элемент массива будет равен \n           
        mov [var_paint + rdx], bl

        not_newline:

        loop paintdraw ; повторяем цикл, таким образом пробежим по всем элементам массива от 0 до 71

    ret

write:
    mov rax, 2
    mov rdi, name
    mov rsi,2
    syscall
    mov [var_fd], rax

    mov rax, 1
    mov rdi, [var_fd]
    mov rsi, var_paint
    mov rdx, N
    syscall

    mov rax, 3
    mov rdi, [var_fd]
    syscall

    ret

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
    ret
