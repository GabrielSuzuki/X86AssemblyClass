//***************************************************************************************************************************
//Program name: "checkin".  This program demonstrates how to use inputs from a text file to simulate a check in for a       *
//job interview.  Copyright (C) 2021 Gabriel Suzuki.                                                                        *
//                                                                                                                          *
//This file is part of the software program "ArraySum".                                                                     *
//checkin is free software: you can redistribute it and/or modify it under the terms of the GNU General Public              *
//License version 3 as published by the Free Software Foundation.                                                           *
//checkin is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied             *
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
//  Program name: checkin
//  Programming languages: One modules in C and 1 modules in X86
//  Date program began: 2021-April-20
//  Date of last update: 2021-May-16
//  Date of reorganization of comments: 2021-May-16
//  Files in this program: main.c, work.asm
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//Purpose
// Learn how to input from a text file
// Learn how to use comparisons to jump in asm
// Learn how to return a large number in asm

//This file
//   File name: main.c
//   Language: C
//   Max page width: 132 columns
//   Compile: gcc -c -Wall -m64 -fno-pie -no-pie -o main.o main.c
//   Link: g++ -m64 -no-pie -o valid.out -std=c++17 work.o main.o -std=c11
//   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
//
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//
//===== Begin code area ===========================================================================================================

#include <stdio.h>
#include <stdint.h>
extern double work(char[], double);
int main()
{
	double salary;
	char name[50];
	printf("Welcome to Software Analysis by Paramount Programmers, Inc.\n");
	printf("Please enter your first and last names and press enter: ");
	gets(name);//take in the first line from the file as name
	printf("\nThank you, %s", name);
	printf(". Our records show that you applied for employment her with our agency a week ago.\n");
	printf("Please enter your expected annual salary when employed at Paramount: ");
	scanf("%lf", &salary);//take in the second line from the file as salary
	printf("%f", salary);
	printf("\nYour interview with Ms Linda Fenster, Personnel Manager, will begin shortly. \n");
	double numbers;
	numbers = work(name, salary);//call work
	if (numbers < 88000.88) {
		printf("Hello, %s", name);
		printf(" I am the receptionist.\n");
		printf("We have an opening for you in the company cafeteria for $%.2lf annually. \nTake your time to let us know your decision. \nBye.\n", numbers);
	}
	else if (numbers < 1000000.00) {
		printf("Hello %s", name);
		printf(" I am the receptionist.\n");
		printf("This evelope contains your job offer with starting salary $%.2lf. Please check back on Monday morning at 8am.\nBye.\n", numbers);
	}
	else {
		printf("\nHello Mr. Sawyer. I am the receptionist. \nThis envelope has your job offer starting at 1 million annual.");
		printf("Please start any time you like. In the middle time our \nCTO wishes to have dinner with you\n");
		printf("Have a very nice evening Mr. Sawyer.\n");
	}
	return 0;
}//end of main
