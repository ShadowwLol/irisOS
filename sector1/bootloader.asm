[org 0x7c00]

; move 'dl' (disk label) into 'BOOT_DISK'
mov [BOOT_DISK], dl

; move bootloader address into the stack
mov bp, 0x7c00
mov sp, bp

mov bx, welcome_str
call print

call read_disk
jmp PROGRAM_SPACE

; variables
welcome_str: db "Welcome to irisOS!", 13, 10, 0

; includes
%include "../utils/print.asm"
%include "diskread.asm"

; fill 1st sector 510 bytes with 0's
times 510 - ($ - $$) db 0

; bootsector magic numbers
dw 0xAA55
