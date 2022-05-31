#!/bin/sh

cd sector1
nasm "bootloader.asm" -f bin -o "../bootloader.bin"
cd ..

cd sector2
nasm "extendedprog.asm" -f bin -o "../extendedprog.bin"
cd ..

cat "bootloader.bin" "extendedprog.bin" > "bootloader.flp"

qemu-system-i386 -fda "bootloader.flp"
