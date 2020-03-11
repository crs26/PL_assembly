%include "asm_io.inc"

segment .data

ptStr db "r", 0
prompt db "input an integer: ", 0
addStr db "sum: ",0
subStr db "difference: ",0
divStr db "qoutient: ",0
mulStr db "product: ",0

segment .bss

input1 resd 1
input2 resd 2

segment .text
    global _asm_main
    
_asm_main:
enter 0,0
pusha

mov eax, prompt
call print_string
call read_int
mov [input1], eax

mov eax, prompt
call print_string
call read_int
mov [input2], eax

mov eax, addStr
call print_string
mov eax, [input1]
add eax, [input2]
call print_int
call print_nl

mov eax, subStr
call print_string
mov eax, [input1]
sub eax, [input2]
call print_int
call print_nl

mov eax, mulStr
call print_string
mov eax, [input1]
imul eax, [input2]
call print_int
call print_nl

mov eax, divStr
call print_string
mov edx, 0
mov eax, [input1]
mov ecx, [input2]
div ecx
call print_int
mov eax, ptStr
call print_string
mov eax, edx
call print_int
call print_nl

popa
mov eax, 0
leave
ret