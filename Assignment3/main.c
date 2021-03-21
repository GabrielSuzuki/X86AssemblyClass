//***************************************************************************************************************************
//Program name: "ArraySum".  This program demonstrates how to input floats into a array from scanf and solve for the sum of *
//the floats in the array. Copyright (C) 2021 Gabriel Suzuki.                    *
//                                                                                                                          *
//This file is part of the software program "ArraySum".                                                                     *
//ArraySum is free software: you can redistribute it and/or modify it under the terms of the GNU General Public             *
//License version 3 as published by the Free Software Foundation.                                                           *
//ArraySum is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied            *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.    *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                           *
//***************************************************************************************************************************




//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3
//
//Author information
//  Author name: Gabriel Suzuki
//  Author email: suzukig@csu.fullerton.edu
//
//Program information
//  Program name: ArraySum
//  Programming languages: One modules in C and three modules in X86 and 1 in C++
//  Date program began: 2021-Mar-10
//  Date of last update: 2021-Mar-21
//  Date of reorganization of comments: 2021-Feb-28
//  Files in this program: main.c, Control.asm, Display.cpp, Sum.asm, Fill.asm
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//Purpose
// Learn how to input floats into a array
// Learn how to Display the floats in the array
// Learn how to Find the sum of the floats in the array
//

//This file
//   File name: main.c
//   Language: C
//   Max page width: 132 columns
//   Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o main.o main.c
//   Link: g++ -m64 -no-pie -o valid.out -std=c++17 Control.o Sum.o Fill.o Display.o main.o -std=c11
//   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
//
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//
//
//===== Begin code area ===========================================================================================================



#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
extern double Control();

int main(int argc, char* arv[])
{
	double result_code = 0.0;
	printf("Welcome to High Speed Array Summation by Gabriel Suzuki\n");
	printf("The function assignmentOne will now be called\n");
	result_code = Control();
	printf("The main has received this number %8.8lf and will keep it. Have a nice day\n", result_code);
	return 0;
}//End of main