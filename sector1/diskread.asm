; rest of disk macro
PROGRAM_SPACE equ 0x7e00

; function 'read_disk'
read_disk:
  mov ah, 0x02 ; BIOS function to read disk

  mov bx, PROGRAM_SPACE
  mov al, 4 ; sector amount
  mov dl, [BOOT_DISK]
  ; hard drive specific
  mov ch, 0x00 ; cilinder 0
  mov dh, 0x00 ; head     0

  mov cl, 0x02 ; read from 2nd sector
  int 0x13
  jc diskread_failed
  ret

BOOT_DISK: db 0

diskread_failed:
  mov bx, err_diskread
  call print
  jmp $

err_diskread: db "[-] Error: ", 34, "read_disk", 34, " failed!", 13, 10, 0
