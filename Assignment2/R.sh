#!/bin/bash
#Program: Quadratic root finder
#Author: Gabriel Suzuki

#Delete some un-needed files
rm *.o
rm *.out

echo "Bash: The script file for Quadratic root finder"

echo "Bash: Assemble Quadratic.asm"
nasm -f elf64 -g -gdwarf -l quadratic.lis -o Quadratic.o Quadratic.asm

echo "Bash: Compile isfloat.cpp"
g++ -c -Wall -m64 -no-pie -g -o isfloat.o isfloat.cpp -std=c++17

echo "Bash: Compile Quad_Library.cpp"
g++ -c -Wall -m64 -no-pie -g -o Quad_Library.o Quad_Library.cpp -std=c++17

echo "Bash: Compile second_degree.c"
gcc -c -Wall -m64 -no-pie -g -o second_degree.o second_degree.c -std=c11

echo "Bash: Link the object files"
g++ -m64 -no-pie -o valid.out -std=c++17 Quadratic.o isfloat.o second_degree.o Quad_Library.o -std=c11

echo "Bash: Run the program Quadratic root finder:"
./valid.out

echo "The script file will terminate"
