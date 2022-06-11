#include "iris.c"
#include "cursor.c"
#include "misc.c"

extern char test[];

void _start(void){
  clear_screen(BACKGROUND_RED|FOREGROUND_WHITE);
  uint16_t cursor_pos = set_cursor_pos(0);
  //uint16_t cursor_pos = set_cursor_pos(cursor_coords((VGA_WIDTH/2) - 9, VGA_HEIGHT/2));
  //print_str("Welcome to irisOS!\n\r",     &cursor_pos, BACKGROUND_BLINKING_WHITE | FOREGROUND_BLACK);
  //cursor_pos = set_cursor_pos(cursor_coords((VGA_WIDTH/2) - 13, (VGA_HEIGHT/2) + 1));
  //print_str("Press <ENTER> to continue.\n\r", &cursor_pos, BACKGROUND_BLINKING_WHITE | FOREGROUND_BLACK);

  print_str(test, &cursor_pos, BACKGROUND_BLACK | FOREGROUND_WHITE);
  return;
}
