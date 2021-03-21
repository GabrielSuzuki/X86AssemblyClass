;***************************************************************************************************************************
;Program name: "ArraySum".  This program demonstrates how to input floats into a array from scanf and solve for the sum of *
;the floats in the array. Copyright (C) 2021 Gabriel Suzuki.                    *
;                                                                                                                          *
;This file is part of the software program "ArraySum".                                                                     *
;ArraySum is free software: you can redistribute it and/or modify it under the terms of the GNU General Public             *
;License version 3 as published by the Free Software Foundation.                                                           *
;ArraySum is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied            *
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
;  Program name: ArraySum
;  Programming languages: One modules in C and three modules in X86 and 1 in C++
;  Date program began: 2021-Mar-10
;  Date of last update: 2021-Mar-21
;  Date of reorganization of comments: 2021-Feb-28
;  Files in this program: main.c, Control.asm, Display.cpp, Sum.asm, Fill.asm
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;Purpose
; Learn how to input floats into a array
;
;This file
;   File name: Fill.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l Fill.lis -o Fill.o Fill.asm


;===== Begin code area ================================================================================================
extern printf
extern scanf
extern atof
global Fill

segment .data
welcome db "Please enter floating point numbers separated by ws",10,0
welcome2 db "When finished press enter followed by cntl+D",10,0
cntl db "<cntl+D>",10,0
floatForm db "%s",0

segment .bss  ;Reserved for uninitialized data

segment .text ;Reserved for executing instructions.

Fill:

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

push qword -1

;Registers rax, rip, and rsp are usually not backed up.
mov r13, rdi ;double[]
mov r14, rsi ;long max
mov r15, 0;loopcounter
;Display a welcome message to the viewer.
mov rax, 0
mov rdi, welcome               ;"Please enter floating point numbers separated by ws"
call printf
mov rax, 0
mov rdi, welcome2               ;"When finished press enter followed by cntl+D"
call printf
;============= Begin section to input one float numbers using one call to scanf  and add it to the array=================
push qword 99

beginloop:
mov rax, 0
mov rdi, floatForm
push qword -1
mov rsi, rsp
call scanf

cdqe
cmp rax, -1
je continue


mov rdi, rsp
call atof
movsd xmm11, xmm0
pop r8
;mov the float number into the array and increment the counter
movsd [r13+8*r15], xmm11
inc r15
cmp r15, r14
je exit
jmp beginloop

continue:
mov rax, 0
mov rdi, cntl              ;"<cntl+D>"
call printf
pop r8
exit:

;============= End of section to input one float numbers using one call to scanf and add it to the array===================
;===== Restore original values to integer registers ===================================================================
pop rax
pop rax
;return the counter to represent the number of floats in the array
mov qword rax, r15

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