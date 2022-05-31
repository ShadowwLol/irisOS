[org 0x7e00]

mov bx, welcome_str
call print

; infinite loop
jmp $

; variables
welcome_str: db "[+] Successfully entered ", 34, "extended space", 34, "!", 13, 10, 0

; includes
%include "../utils/print.asm"

; fill up all sectors
times 2048 - ($ - $$) db 0
