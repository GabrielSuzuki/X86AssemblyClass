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
// make functions to print out the results of the roots
// Learn how to validate inputs and check if they are valid floats.
// Learn how to use inputted floats to find the roots of a quadratic equation
//
//This file
//  File name: Quad_Library
//  Function name2: show_no_root, show_one_root, show_two_root
//  Language: C++
//  Max page width: 136 columns
//  Optimal print specification: 7 point font, monospace, 136 columns, 8½x11 paper
//  Compile: g++ -c -Wall -m64 -no-pie -g -o Quad_Library.o Quad_Library.cpp -std=c++17
//  Link: g++ -m64 -no-pie -o valid.out -std=c++17 Quadratic.o isfloat.o second_degree.o Quad_Library.o -std=c11


#include <iostream>
#include <cstring>
using namespace std;
extern "C" void show_no_root();
extern "C" void show_one_root(double root);
extern "C" void show_two_root(double root1, double root2);
void show_no_root() {
    cout << "There are no possible roots available. You may rerun the program." << endl;
}
void show_one_root(double root) {
    cout << "There is one root possible: " << root << endl;
}
void show_two_root(double root1, double root2) {
    cout << "There are two roots available: " << root1 << " and " << root2 << endl;
}
//End of isInteger
