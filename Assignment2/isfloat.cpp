//****************************************************************************************************************************
//Program name: "isfloat".  This is a single function distributed without accompanying software.  This function scans a      *
//char array seeking to confirm that all characters in the array are in the range of ascii characters '0' .. '9'.  Further-  *
//more, this function confirms that there is exactly one decimal point in the string.  IF both conditions are true then a    *
//boolean true is returned, otherwise a boolean false is returned.  Copyright (C) 2020 Floyd Holliday                        *
//                                                                                                                           *
//This is a library function distributed without accompanying software.                                                      *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public   *
//License version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be   *
//useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.*
//See the GNU Lesser General Public License for more details.  A copy of the GNU Lesser General Public License 3.0 should    *
//have been distributed with this function.  If the LGPL does not accompany this software then it is available here:         *
//<https:;www.gnu.org/licenses/>.                                                                                            *
//****************************************************************************************************************************

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//Author information
//  Author name: Floyd Holliday
//  Author email: unavailable
//
//This file
//  Program name: isfloat
//  File name: isfloat.cpp
//  Date development began: 2020-Dec-12
//  Date of last update:  2020-Dec-14
//  Comments reorganized: 2020-Dec-14
//  Language: C++
//  Max page width: 132 columns
//  Optimal print specification: monospace, 132 columns, 8½x11 paper
//  Testing: This function was tested successfully on a Linux platform derived from Ubuntu.
//  Compile: g++ -c -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp -std=c++17
//  Classification: Library
//
//Purpose
//  Scan a contiguous segment of memory from the starting byte to the null character and determine if the string of chars is properly
//  formatted for conversion to a valid float number.  This function, isfloat, does not perform the conversion itself.  That task is
//  is done by a library function such as atof.


#include <iostream>

extern "C" bool isfloat(char[]);

bool isfloat(char w[])
{
    bool result = true;
    bool onepoint = false;
    int start = 0;
    if (w[0] == '-' || w[0] == '+') start = 1;
    unsigned long int k = start;
    while (!(w[k] == '\0') && result)
    {
        if (w[k] == '.' && !onepoint)
            onepoint = true;
        else
            result = result && isdigit(w[k]);
        k++;
    }
    return result && onepoint;
}
