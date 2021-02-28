;***************************************************************************************************************************
;Program name: "QuadraticRootFinder".  This program demonstrates how to validate floats inputted from scanf and use them to*
;solve the roots of a quadratic equation. Copyright (C) 2021 Gabriel Suzuki.                                               *
;                                                                                                                          *
;This file is part of the software program "QuadraticRootFinder".                                                          *
;QuadraticRootFinder is free software: you can redistribute it and/or modify it under the terms of the GNU General Public  *
;License version 3 as published by the Free Software Foundation.                                                           *
;QuadraticRootFinder is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.    *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                           *
;***************************************************************************************************************************




;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3
;
;Author information
;  Author name: Gabriel Suzuki
;  Author email: suzukig@csu.fullerton.edu
;
;Program information
;  Program name: QuadraticRootFinder
;  Programming languages: One modules in C and one module in X86 and 2 in C++
;  Date program began: 2021-Feb-20
;  Date of last update: 2021-Feb-28
;  Date of reorganization of comments: 2021-Feb-28
;  Files in this program: second_degree.c, Quadratic.asm, Quad_Library.cpp, isfloat.cpp
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;Purpose
; Learn how to validate inputs and check if they are valid floats.
; Learn how to use inputted floats to find the roots of a quadratic equation
;
;This file
;   File name: Quadratic.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l Quadratic.lis -o Quadratic.o Quadratic.asm


;===== Begin code area ================================================================================================
extern printf
extern scanf
extern atof
extern isfloat
extern show_no_root
extern show_one_root
extern show_two_root
global Quadratic

segment .data
welcome db "This program will solve any Quadratic and return its roots",10,0
input2prompt db "Please enter the three floating point coefficients of a quadratic equation in order a, b, c: ", 10,0, 0
three_float_format db "%lf %lf %lf",0
stringform db "%s%s%s",0
NoAString db "This is not a quadratic equation. You may run this program again.", 10, 0
equation db "The equation is %lfx^2 + %lfx + %lf = 0.0",10,0
error_in_input db "Invalid input data detected. You may run this program again.",10,0
newmessage db "The number is %5.3lf",10,0
temp db "temp", 10,0,0
final_output db "The assembly program will send one root to the main function", 10,0,0

segment .bss  ;Reserved for uninitialized data

segment .text ;Reserved for executing instructions.

Quadratic:

;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.
push rbp
mov  rbp,rsp
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags

;Registers rax, rip, and rsp are usually not backed up.
push qword 0


;Display a welcome message to the viewer.
mov rax, 0                     
mov rdi, welcome               ;"This program will solve any Quadratic and return its roots"
call printf

;============= Begin section to input three float numbers using one call to scanf =======================================
push qword 0
cvtsi2sd xmm15,[rsp]
pop rax

;Display a prompt message asking for inputs
push qword 99
mov rax, 0
mov rdi, input2prompt          ;"Please enter the three floating point coefficients of a quadratic equation in order a, b, c: "
call printf
pop rax


sub rsp, 1560
mov rax, 0
mov rdi,stringform
mov rsi, rsp
mov rdx, rsp
add rdx, 520
mov rcx, rsp
add rcx, 1040
call scanf

mov rax, 0
mov rdi,rsp
call isfloat;check a
cmp rax, 0
je invalidRoot

mov rax, 0
mov rdi,rsp
add rdi,520
call isfloat;check b
cmp rax, 0
je invalidRoot

mov rax, 0
mov rdi,rsp
add rdi,1040
call isfloat;check b
cmp rax, 0
je invalidRoot

mov rdi, rsp
call atof;convert a to float
movsd xmm11, xmm0

mov rdi, rsp
add rdi,520
call atof;convert b to float
movsd xmm12, xmm0

mov rdi, rsp
add rdi, 1040
call atof;convert c to float
movsd xmm13, xmm0

add rsp, 1560

;compare A to 0
push qword 0
movsd xmm10, [rsp]
pop rax
ucomisd xmm11, xmm10
jne equals
push qword 99
mov rax, 0
mov rdi, NoAString
call printf
pop rax
pop rax
jmp quit

equals:


push qword 99
mov rax, 3
mov rdi, equation ;"The equation is %lfx^2 + %lfx + %lf = 0.0"
movsd xmm0,xmm11
movsd xmm1,xmm12
movsd xmm2,xmm13
call printf
pop rax
jmp end_of_if_else

invalidRoot:
;section when rbx = rcx
mov rax, 1
mov rdi, error_in_input      ;"Invalid input data detected. You may run this program again."
call printf
pop rax
add rsp, 1560
jmp quit

end_of_if_else:
;============= End of section to input three float numbers ==============================================================

;============= Calculate the quadratic roots ============================================================================
;x = -b+/-sqrt(b^2-4ac)/2a
;D = b^2-4ac
;d>0 2 roots,D=0 1 root, D<0,0 roots

push qword 4
cvtsi2sd xmm10,[rsp]
pop rax
push qword 2
cvtsi2sd xmm14,[rsp]
pop rax
push qword -1
cvtsi2sd xmm15,[rsp]
pop rax



mulsd xmm13,xmm10
mulsd xmm13, xmm11;4ac

mulsd xmm11, xmm14;2a
mulsd xmm15, xmm12;-b

mulsd xmm12,xmm12;b^2

subsd xmm12, xmm13;b^2-4ac

pop rax

push qword 0
movsd xmm10, [rsp]
pop rax

ucomisd xmm12, xmm10
ja pos
je equal
push qword 0
cvtsi2sd xmm15,[rsp]
pop rax
mov rax, 0
call show_no_root
jmp quit

pos:
;show there are two roots
sqrtsd xmm14, xmm12 ;sqrt(b^2-4ac)
movsd xmm10, xmm15  ;-b

subsd xmm10, xmm14 ;-b-sqrt(b^2-4ac)
divsd xmm10, xmm11;root1 -b+sqrt(b^2-4ac)/2a

addsd xmm15, xmm14
divsd xmm15, xmm11;root2 -b-sqrt(b^2-4ac)/2a
mov rax, 2
movsd xmm0,xmm15;root1 -b+sqrt(b^2-4ac)/2a
movsd xmm1,xmm10;root2 -b-sqrt(b^2-4ac)/2a
call show_two_root
jmp end_if

equal:
;show there are one root

divsd xmm15, xmm11;root -b/2a
mov rax, 1
movsd xmm0,xmm15
call show_one_root
jmp end_if



;============= End of Calculate the quadratic roots =====================================================================
end_if:;two roots/1 root
mov rax, 0
mov rdi, final_output        ;"The assembly program will send one of these roots to the main function"
call printf

quit:;0 roots
movsd xmm0,xmm15
;===== Restore original values to integer registers ===================================================================

popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

ret

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**