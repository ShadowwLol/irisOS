#ifndef _IRIS_C
#define _IRIS_C

#include <stdint.h>
#include <stddef.h>

#define VGA_MEMORY ((uint8_t *)0xb8000)
#define VGA_WIDTH  (80)
#define VGA_HEIGHT (24)

#define clamp(var, min, max) (var > max) ? max : ((var < min) ? min : var)

typedef enum{
BLACK,      
BLUE,       
GREEN,      
CYAN,       
RED,        
MAGENTA,    
BROWN,      
LIGHT_GRAY, 
DARK_GRAY,  
LIGHT_BLUE, 
LIGHT_GREEN,
LIGHT_CYAN, 
LIGHT_RED,  
PINK,       
YELLOW,     
WHITE      
} color;

#endif /* _IRIS_C */
