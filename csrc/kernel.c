#include "iris.c"
#include "cursor.c"

void print_str(const char * str, size_t len, color bg, color fg);

void _start(void){
  uint16_t cursor_pos = set_cursor_pos(cursor_coords(VGA_WIDTH/2, VGA_HEIGHT/2));
  //print_str("test", 120, PINK, YELLOW);
  return;
}

/*
;  print_header:
;  mov dword [0xb8000], 0x4f524f45
;  mov dword [0xb8004], 0x4f3a4f52
;  mov dword [0xb8008], 0x4f204f20
;  ret
*/
void print_str(const char * str, size_t len, color bg, color fg){
  int * loc = (int *)VGA_MEMORY;
  for (size_t i = 0; i < len; ++i){
    *loc = 0x4f524f45;
    loc += 1;
  }
}
