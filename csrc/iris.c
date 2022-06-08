#ifndef _IRIS_C
#define _IRIS_C

#include <stdint.h>
#include <stddef.h>

#define VGA_MEMORY ((uint8_t *)0xb8000)
#define VGA_WIDTH  (80)
#define VGA_HEIGHT (24)

#define clamp(var, min, max) (var > max) ? max : ((var < min) ? min : var)

#define FOREGROUND_BLACK            (0x00)      
#define FOREGROUND_BLUE             (0x01)       
#define FOREGROUND_GREEN            (0x02)      
#define FOREGROUND_CYAN             (0x03)       
#define FOREGROUND_RED              (0x04)        
#define FOREGROUND_MAGENTA          (0x05)    
#define FOREGROUND_BROWN            (0x06)      
#define FOREGROUND_LIGHT_GRAY       (0x07) 
#define FOREGROUND_DARK_GRAY        (0x08)  
#define FOREGROUND_LIGHT_BLUE       (0x09) 
#define FOREGROUND_LIGHT_GREEN      (0x0A)
#define FOREGROUND_LIGHT_CYAN       (0x0B) 
#define FOREGROUND_LIGHT_RED        (0x0C)  
#define FOREGROUND_LIGHT_MAGENTA    (0x0D)       
#define FOREGROUND_YELLOW           (0x0E)     
#define FOREGROUND_WHITE            (0x0F)

#define BACKGROUND_BLACK            (0x00)      
#define BACKGROUND_BLUE             (0x10)       
#define BACKGROUND_GREEN            (0x20)      
#define BACKGROUND_CYAN             (0x30)       
#define BACKGROUND_RED              (0x40)        
#define BACKGROUND_MAGENTA          (0x50)    
#define BACKGROUND_BROWN            (0x60)      
#define BACKGROUND_LIGHT_GRAY       (0x70) 
#define BACKGROUND_BLINKING_BLACK   (0x80)      
#define BACKGROUND_BLINKING_BLUE    (0x90)       
#define BACKGROUND_BLINKING_GREEN   (0xA0)      
#define BACKGROUND_BLINKING_CYAN    (0xB0)       
#define BACKGROUND_BLINKING_RED     (0xC0)        
#define BACKGROUND_BLINKING_MAGENTA (0xD0)    
#define BACKGROUND_BLINKING_YELLOW  (0xE0)
#define BACKGROUND_BLINKING_WHITE   (0xF0)

#endif /* _IRIS_C */
