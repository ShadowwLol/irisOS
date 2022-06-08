#!/bin/sh

compile(){
  cd ..
  BDIR="../build/"
  
  cd sector1
  nasm "bootloader.asm" -f bin -o "$BDIR/bootloader.bin"
  cd ..
  
  cd sector2+
  nasm "extendedprog.asm" -f elf64 -o "$BDIR/extendedprog.o"
  cd ..
  
  cd csrc
  x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "kernel.c" -o "$BDIR/kernel.o"
  cd $BDIR
  
  x86_64-elf-ld -T"link.ld"
  
  cat "bootloader.bin" "kernel.bin" > "bootloader.flp"
}

run(){
  qemu-system-x86_64 -fda "bootloader.flp"
}

clean(){
  rm -f *.bin *.flp *.tmp *.o
}

case "$1" in
"--clean"|"-c")
clean
;;
"--make"|"-m")
compile
;;
"--run"|"-r")
run
;;
"--all"|"-a")
trap clean INT TERM
compile
run
;;
*)
compile
run
;;
esac
