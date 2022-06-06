PAGE_TABLE_ENTRY equ 0x1000

; set up 64-bit paging
identity_paging:
  mov edi, PAGE_TABLE_ENTRY
  mov cr3, edi
  mov dword [edi], 0x2003 ; point address to table and set flags
  add edi, 0x1000
  mov dword [edi], 0x3003
  add edi, 0x1000
  mov dword [edi], 0x4003
  add edi, 0x1000

  mov ebx, 0x00000003
  mov ecx, 512

  .set_entry:
    mov dword [edi], ebx
    add ebx, 0x1000
    add edi, 8
    loop .set_entry

  ; enable PAE
  mov eax, cr4
  or eax, 1 << 5
  mov cr4, eax

  ; set LME
  mov ecx, 0xC0000080
  rdmsr
  or eax, (1 << 8)
  wrmsr

  ; enable paging
  mov eax, cr0
  or eax, 1 << 31
  mov cr0, eax

  ret
