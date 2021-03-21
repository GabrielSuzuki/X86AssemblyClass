#!/bin/bash
#Program: ArraySum
#Author: Gabriel Suzuki

#Delete some un-needed files
rm *.o
rm *.out

echo "Bash: The script file for ArraySum"

echo "Bash: Assemble Control.asm"
nasm -f elf64 -g -gdwarf -l control.lis -o Control.o Control.asm

echo "Bash: Assemble Fill.asm"
nasm -f elf64 -g -gdwarf -l Fill.lis -o Fill.o Fill.asm

echo "Bash: Assemble Sum.asm"
nasm -f elf64 -g -gdwarf -l Sum.lis -o Sum.o Sum.asm

echo "Bash: Compile Display.cpp"
g++ -c -Wall -m64 -no-pie -g -o Display.o Display.cpp -std=c++17

echo "Bash: Compile main.c"
gcc -c -Wall -m64 -no-pie -g -o main.o main.c -std=c11

echo "Bash: Link the object files"
g++ -m64 -no-pie -o valid.out -std=c++17 Control.o Sum.o Fill.o Display.o main.o -std=c11

echo "Bash: Run the program ArraySum:"
./valid.out

echo "The script file will terminate"
