/* Arduino USB Keyboard HID demo */
/* Read the keyboard leds status */
#include <USBKeyboard.h>
const int ledPin =  13;

void setup() 
{
  pinMode(ledPin, OUTPUT);
  Keyboard.init();
}

void loop() 
{
  uint8_t ledStatus;
  
  delay(100);

  ledStatus = Keyboard.readLedStatus();
  if (ledStatus & LED_CAPSLOCK) {
    digitalWrite(ledPin, HIGH);      
  } else {
    digitalWrite(ledPin, LOW);
  }    
}
