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
