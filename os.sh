nasm bootloader.asm -f bin -o bootloader.bin

qemu-system-i386 -fda bootloader.bin
