gdt_nulldesc:  ; null descriptor
  dd 0
  dd 0

gdt_codedesc:  ; code descriptor
  dw 0xFFFF    ; limit address
  dw 0x0000    ; base (low)
  db 0x00      ; base (medium)
  db 10011010b ; access byte flags
  db 11001111b ; access byte flags + upper limit
  db 0x00      ; base (high)

gdt_datadesc:  ; data descriptor                 
  dw 0xFFFF    ; limit address                   
  dw 0x0000    ; base (low)                      
  db 0x00      ; base (medium)                   
  db 10010010b ; access byte flags               
  db 11001111b ; access byte flags + upper limit 
  db 0x00      ; base (high)

gdt_end:

gdt_descriptor:
  gdt_size:
    dw gdt_end - gdt_nulldesc - 1
    dd gdt_nulldesc

codeseg equ gdt_codedesc - gdt_nulldesc
dataseg equ gdt_datadesc - gdt_nulldesc
