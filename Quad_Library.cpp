//***************************************************************************************************************************
//Program name: "Validate Integer Input".  This program demonstrates how to validate input received from scanf as valid      *
//integer data.  Copyright (C) 2020 Floyd Holliday                                                                           *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************




//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//Author information
//  Author name: Floyd Holliday
//  Author email: holliday@fullerton.edu
//
//Program information
//  Program name: Scanf Exception Handling
//  Programming languages: C++
//  Date program began: 2020-Sep-2
//  Date of last update: 2020-Sep-2
//  Comments reorganized: 2020-Sep-3
//  Files in the program: Test-scanf.cpp, run.sh
//
//Purpose
//  Explore a technique for handling invalid inputs received by scanf
//  For learning purposes: Discover how to use the return value received from scanf
//
//This file
//  File name: Test-scan.f
//  Function name: get_data
//  Language: C++
//  Max page width: 136 columns
//  Optimal print specification: 7 point font, monospace, 136 columns, 8½x11 paper
//  Compile: g++ -c -m64 -Wall -fno-pie -no-pie -o scan.o test-scanf.cpp -std=c++17
//  Link: g++ -m64 -fno-pie -no-pie -o code.out -std=c++17 scan.o valid.o drive.o


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
