[org 0x7c00]
; move bootloader address into the stack
mov bp, 0x7c00
mov sp, bp

; print 'str'
mov bx, str
call print

; infinite loop
jmp $

; function 'print'
print:
  ; use interrupts
  mov ah, 0x0e

  .loop:
  ; if (bx[0] == '\0') exit() 
  cmp [bx], byte 0
  je .exit

  ; print bx[0] && bx++ && loop()
  mov al, [bx]
  int 0x10
  inc bx
  jmp .loop
  
  .exit:
  ret

str: db "Welcome to irisOS!", 0

; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
; fill 1st sector 510 bytes with 0's
times 510 - ($ - $$) db 0

; bootsector magic numbers
dw 0xAA55
