#ifndef _MISC_C
#define _MISC_C

#include "cursor.c"

void clear_screen(uint64_t color){
  uint64_t value = color << 8;
  value += color << 24;
  value += color << 40;
  value += color << 56;

  for (uint64_t * i = (uint64_t *)VGA_MEMORY; i < (uint64_t *)(VGA_MEMORY + 4000); ++i){
    *i = value;
  }
}

uint16_t print_str(char * str, uint16_t * index, uint8_t color){
  set_cursor_pos(*index);
  char * s = str;
  while (*s != 0){
    switch(*s){
      default:
        *(VGA_MEMORY + *index * 2) = *s;
        *(VGA_MEMORY + *index * 2 + 1) = color;
        ++*index;
        break;
      case '\n':
        *index += VGA_WIDTH;
        break;
      case '\r':
        *index -= *index % VGA_WIDTH;
        break;
    }
    ++s;
  }
  set_cursor_pos(*index);
  return *index;
}

/* (I)nt (T)(O) (A)scii implementation */
char * itoa(int32_t value, char * result, uint8_t base) {
    if (base < 2 || base > 36){
      *result = '\0';
      return result;
    }

    char * ptr = result, *ptr1 = result, tmp_char;
    int32_t tmp_value;

    do{
        tmp_value = value;
        value /= base;
        *ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
    } while (value);

    if (tmp_value < 0){
      *ptr++ = '-';
    }

    *ptr-- = '\0';
    while (ptr1 < ptr){
        tmp_char = *ptr;
        *ptr--= *ptr1;
        *ptr1++ = tmp_char;
    }
    return result;
}
/* * * * * * * * * * * * * * * * * * * */

#endif /* _MISC_C */
