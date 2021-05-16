#!/bin/bash
#Program: checkin
#Author: Gabriel Suzuki

#Delete some un-needed files
rm *.o
rm *.out

echo "Bash: The script file for checkin"

echo "Bash: Assemble work.asm"
nasm -f elf64  -l work.lis -o work.o work.asm

echo "Bash: Compile main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c18

echo "Bash: Link the object files"
g++ -m64 -no-pie -o valid.out -std=c++17 work.o main.o -std=c11

echo "Bash: Run the program checkin:"
./valid.out

echo "The script file will terminate"
