#ifndef _CURSOR_C
#define _CURSOR_C

#include "iris.c"
#include "IO.c"

uint16_t set_cursor_pos(int16_t pos){
  pos = clamp(pos, 0, ((VGA_HEIGHT * VGA_WIDTH) + (VGA_WIDTH - 1)));
  outb(0x3D4, 0x0F);
  outb(0x3D5, (uint8_t)(pos & 0xFF));
  outb(0x3D4, 0x0E);
  outb(0x3D5, (uint8_t)((pos >> 8) & 0xFF));
  return pos;
}

uint16_t cursor_coords(int16_t x, int16_t y){
  x = clamp(x, 0, VGA_WIDTH - 1);
  y = clamp(y, 0, VGA_HEIGHT);
  return (y * VGA_WIDTH) + x;
}

#endif /* _CURSOR_C */
