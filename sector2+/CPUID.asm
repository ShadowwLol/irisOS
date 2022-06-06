; detect whether the CPUID is supported by the processor
detect_CPUID:
  pushfd  ; push flags to stack
  pop eax ; pop value into 'eax' register

  mov ecx, eax
  xor eax, 1 << 21 ; flip bit in 'eax' register

  push eax ; push value onto stack
  popfd    ; put value back into flags register

  ; check if bit is still flipped
  pushfd   ; push flags onto stack
  pop eax

  ; restore flags to old version in ecx
  push ecx
  popfd

  ; compare values
  xor eax, ecx
  jz no_CPUID ; if (0 == (eax ^ ecx)){ no_CPUID(); }
  ret

; no CPUID support
no_CPUID:
  hlt

; detect whether long mode is supported by the processor
detect_long_mode:
  mov eax, 0x80000001
  cpuid
  test edx, 1 << 29
  jz no_long_mode ; if the bit is not flipped
  ret

; no long mode support
no_long_mode:
  hlt
