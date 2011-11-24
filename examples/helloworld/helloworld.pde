/* Arduino USB Keyboard HID demo */
/* Send "hello world" to computer through USB every 5 seconds */
#include <USBKeyboard.h>

void setup() 
{
  Keyboard.init();
}

void loop() 
{
  delay(5000);
  Keyboard.print("hello world");
}
