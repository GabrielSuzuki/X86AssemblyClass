//***************************************************************************************************************************
//Program name: "QuadraticRootFinder".  This program demonstrates how to validate floats inputted from scanf and use them to*
//solve the roots of a quadratic equation. Copyright (C) 2021 Gabriel Suzuki.                                               *
//                                                                                                                          *
//This file is part of the software program "QuadraticRootFinder".                                                          *
//QuadraticRootFinder is free software: you can redistribute it and/or modify it under the terms of the GNU General Public  *
//License version 3 as published by the Free Software Foundation.                                                           *
//QuadraticRootFinder is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
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
//  Program name: QuadraticRootFinder
//  Programming languages: One modules in C and one module in X86 and 2 in C++
//  Date program began: 2021-Feb-20
//  Date of last update: 2021-Feb-28
//  Date of reorganization of comments: 2021-Feb-28
//  Files in this program: second_degree.c, Quadratic.asm, Quad_Library.cpp, isfloat.cpp
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//Purpose
// Learn how to validate inputs and check if they are valid floats.
// Learn how to use inputted floats to find the roots of a quadratic equation
//
//This file
//   File name: second_degree.c
//   Language: C
//   Max page width: 132 columns
//   Compile:gcc -c -Wall -m64 -no-pie -g -o second_degree.o second_degree.c -std=c11
//   Link: g++ -m64 -no-pie -o valid.out -std=c++17 Quadratic.o isfloat.o second_degree.o Quad_Library.o -std=c11
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
#include <stdlib.h>
#include <stdint.h>

extern double Quadratic();

int main(int argc, char* arv[])
{
	double result_code = 0.0;
	printf("Welcome to Root Calculator\n");
	printf("Programmed by Gabriel Suzuki.\n");
	result_code = Quadratic();
	printf("The main driver received %8.5lf and has decided to keep.\n", result_code);
	printf("Now 0 will be returned to the operating system.\n");
	return 0;
}//End of main
