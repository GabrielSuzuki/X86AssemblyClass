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
; Learn how to Display the floats in the array
; Learn how to Find the sum of the floats in the array
;
;This file
;   File name: Control.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l Control.lis -o Control.o Control.asm

;===== Begin code area ================================================================================================
extern printf
extern scanf
extern atof
extern isfloat
extern display
extern Fill
extern Sum
extern input_array

array_size equ 10;

global Control

segment .data
welcome db "Welcome to HSAS, The accuracy and reliability of this program is guaranteed by Gabriel Suzuki",10,0
message db "The numbers you entered are these:", 10, 0
endingmsg db "The sum of these values is %8.8lf",10,0
endingmsg2 db "The Control Module will now return the sum to the caller module",10 ,0
segment .bss  ;Reserved for uninitialized data

myarray resq 10

segment .text ;Reserved for executing instructions.

Control:

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
push qword -1

mov r14,0
mov r13,0

;Welcome msg
mov rax, 0
mov rdi, welcome               ;"Welcome to HSAS, The accuracy and reliability of this program is guaranteed by Gabriel Suzuki"
call printf

;============================ Fill the array with floats using Fill.asm ========================================================
mov rdi, myarray ;double[]
mov rsi, array_size ;long max
mov rax,0
call Fill
mov r14, rax
;========================End of Filling the array with floats using Fill.asm ===================================================

mov rax, 0
mov rdi, message              ;"The numbers you entered are these:"
call printf

;============================ Display the floats in the array using Display.cpp ================================================
push qword 0
mov rdi, myarray
mov rsi, r14
mov qword rax, 0
call display
pop rax
;============================  End of Displaying the floats in the array using Display.cpp ======================================

;============================  Find the sum of the floats in the array using Sum.asm ============================================
push qword 0
mov rdi, myarray
mov rsi, r14
mov rax, 0
call Sum
movsd xmm13, xmm0
pop rax
;============================ End of Finding the sum of the floats in the array using Sum.asm ===================================

;print out the sum of the floats in the array
push qword 0
mov rdi, endingmsg            ;"The sum of these values is %5.10lf"
movsd xmm0, xmm13
mov rax, 1
call printf
pop rax

mov rax, 0
mov rdi, endingmsg2            ;"The Control Module will now return the sum to the caller module"
call printf


pop rax
;return the sum to the main function
movsd xmm0,xmm13
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