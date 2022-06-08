#ifndef _IO_C
#define _IO_C

void outb(uint16_t port, uint8_t val){
  asm volatile ("outb %0, %1" :: "a"(val), "Nd"(port));
}

uint8_t inb(uint16_t port){
  uint8_t val;
  asm volatile ("inb %1, %0" :: "a"(val), "Nd"(port));
  return val;
}

#endif /* _IO_C */
