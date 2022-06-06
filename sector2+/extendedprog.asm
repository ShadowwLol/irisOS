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

%include "CPUID.asm"
%include "paging.asm"

start_protected_mode:
  mov ax, dataseg
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  call detect_CPUID
  call detect_long_mode
  call identity_paging
  call edit_gdt

  jmp codeseg:start_64bit

[bits 64]

start_64bit:
  mov edi, 0xb8000
  mov rax, 0x1f201f201f201f20; white ('f') foreground and blue ('1') foreground and ('20' => ' ')
  mov ecx, 500
  rep stosq
  call print_header
  jmp $

print_header:
  mov dword [0xb8000], 0x4f524f45
  mov dword [0xb8004], 0x4f3a4f52
  mov dword [0xb8008], 0x4f204f20
  ret

; fill up all sectors
times 2048 - ($ - $$) db 0
