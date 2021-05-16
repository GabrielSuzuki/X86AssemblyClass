;***************************************************************************************************************************
;Program name: "checkin".  This program demonstrates how to use inputs from a text file to simulate a check in for a       *
;job interview.  Copyright (C) 2021 Gabriel Suzuki.                                                                        *
;                                                                                                                          *
;This file is part of the software program "ArraySum".                                                                     *
;checkin is free software: you can redistribute it and/or modify it under the terms of the GNU General Public              *
;License version 3 as published by the Free Software Foundation.                                                           *
;checkin is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied             *
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
;  Program name: checkin
;  Programming languages: One modules in C and 1 modules in X86
;  Date program began: 2021-April-20
;  Date of last update: 2021-May-16
;  Date of reorganization of comments: 2021-May-16
;  Files in this program: main.c, work.asm
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;Purpose
; Learn how to input from a text file
; Learn how to use comparisons to jump in asm
; Learn how to return a large number in asm

;This file
;   File name: work.asm
;   Language: x86
;   Max page width: 132 columns
;   Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o work.o work.c
;   Link: g++ -m64 -no-pie -o valid.out -std=c++17 work.o main.o -std=c11
;   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
;
;
;=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;
;
;===== Begin code area =====================================================================================


extern printf
extern scanf
global work

segment .data
welcome db "Hello %s I am Ms Fenster. The interview will begin now.",10, 0
salary db "Wow! %9.2lf That's a lot of cash. Who do you think you are, Chris Sawyer (y/n)?",10,0
stringform db "%s",0
floatform db "%lf",0
middle1 db "Alright. Now we will work on your electricity.",10,0
middle2 db "Please enter the resistance of circuit #1 in ohms:",10,0
middle3 db "What is the resistance of circuit #2 in ohms:",10,0
middle4 db "The total resistance is %5.5lf Ohms",10,0
csmajor db "Were you a computer science major (y/n)?",10,0
ending db "Thank you. Please follow the exit signs to the front desk",10,0

segment .bss

segment .text
work:
;Prolog ===== Insurance for any caller of this assembly module ==============================================
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

push qword 0

movsd xmm10, xmm0 ;name
mov r15, rdi ;salary

;============================ Welcome messages, display name and salary ============================
;Begin section to output the name passed into this function
mov qword rax, 0
mov qword rdi, welcome ;"Hello %s I am Ms Fenster. The interview will begin now."
mov qword rsi, r15
call printf

push qword 1
mov rax, 1
mov rdi, salary;"Wow! %10.2lf That's a lot of cash. Who do you think you are, Chris Sawyer (y/n)?"
movq xmm0, xmm10
call printf
pop rax

;============================ End of Welcome messages, display name and salary =====================

;============================ Check for name is Chris Sawyer =======================================
push qword 0;Chris Sawyer
mov qword rdi, stringform
mov qword rsi, rsp
call scanf
pop rax

mov r15, 'y'
cmp rax, r15
je chrissawyer          ; equal

;============================ End of Check for name is Chris Sawyer ==============================

;============================ Input 2 floats for electricity calculations ========================
;middle1
mov rax, 0
mov rdi, middle1;"Alright. Now we will work on your electricity."
call printf

;middle2
mov rax, 0
mov rdi, middle2;"Please enter the resistance of circuit #1 in ohms:"
call printf

push qword 99
mov rax, 0
mov rdi, floatform
mov rsi, rsp
call scanf
movsd xmm13, [rsp]
pop rax

;============================ End of Input 2 floats for electricity calculations ==================

;============================ Calculate and display ending resistance =============================
;middle3
mov rax, 0
mov rdi, middle3
call printf

push qword 99
mov rax, 0
mov rdi, floatform; "%lf"
mov rsi, rsp
call scanf
movsd xmm14, [rsp]
pop rax

;calculate total ohms
push qword 1
cvtsi2sd xmm10,[rsp]
pop rax

movsd xmm11, xmm10
movsd xmm12, xmm10
divsd xmm11, xmm13
divsd xmm12, xmm14
addsd xmm11, xmm12
divsd xmm10, xmm11

;middle4
push qword 1
mov rax, 1
mov rdi, middle4
movsd xmm0, xmm10
call printf
pop rax

;============================ End of Calculate and display ending resistance =======================


;============================ Check for cs major ===================================================
mov rax, 0
mov rdi, csmajor ;"Were you a computer science major (y/n)?"
call printf

;csmajor

push qword 0
mov qword rdi, stringform
mov qword rsi, rsp
call scanf
pop rax

mov r15, 'y'
cmp rax, r15
je csjump            ; equal

;============================ End of Check for cs major ==============================================

;============================ Finding salary =========================================================
;social
mov r14,0x4092C07AE147AE14 ;hex 1200.12
movq xmm15, r14
;salary = 1200.12
jmp lastjmp

csjump:
mov r14,0x40F57C0E147AE148 ;hex 88000.88
movq xmm15, r14
;salary = 88000.88
jmp lastjmp

chrissawyer:
mov r14,0x412E848000000000 ;hex 1 000 000.00
movq xmm15, r14
;salary = 1000000.00

;============================ End of Finding salary ===================================================

lastjmp: ; "Thank you. Please follow the exit signs to the front desk"
mov rax, 0
mov rdi, ending
call printf

pop rax

movsd xmm0,xmm15 ;return ending salary

;===== Restore original values to integer registers ===================================================

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
