[org 0x7e00]

jmp enter_protected_mode

; includes
%include "gdt.asm"
%include "../utils/print.asm"

; labels
enter_protected_mode:
  call enable_A20       ; enable A20
  cli                   ; disable interrupts
  lgdt [gdt_descriptor] ; load gdt descriptor
  ; sinalize 32 bit protected mode
  mov eax, cr0
  or eax, 1
  mov cr0, eax
  jmp codeseg:start_protected_mode

; function 'enable_A20'
enable_A20:
  in al, 0x92
  or al, 2
  out 0x92, al
  ret


[bits 32]

start_protected_mode:
  mov ax, dataseg
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  ; start of video memory!
  mov [0xb8000], byte "H"
  mov [0xb8002], byte "e"
  mov [0xb8004], byte "l"
  mov [0xb8006], byte "l"
  mov [0xb8008], byte "o"
  mov [0xb800a], byte "!"

  jmp $

; fill up all sectors
times 2048 - ($ - $$) db 0
