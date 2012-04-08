/* Arduino USB Business Card 
   1. Upload this program to Arduino 
   2. Upgrade atmega8u2 with firmware/Arduino-keyboard-0.3.hex
   3. Re-plug Arduino to usb port, and pressed Num Lock button 3 times in 2 seconds
      Arduino will type your contact text information into the text editor
*/
#include <USBKeyboard.h>

const uint8_t KEYBOARD_LED = LED_NUMLOCK; // Num Lock LED
const int ledPin =  13;                   
uint8_t lastState = 0, currentState = 0;

void setup() 
{
  pinMode(ledPin, OUTPUT);
  Keyboard.init();
}

// return true if KEYBOARD_LED (Num Lock button) is pressed
boolean buttonPressed()
{
  uint8_t ledStatus;
 
  ledStatus = Keyboard.readLedStatus();

  // Arduino Led pin as an indicator    
  // If Num Lock led is on, the led indicator will be on
  if (ledStatus & KEYBOARD_LED) {
    digitalWrite(ledPin, HIGH);    
  } else {
    digitalWrite(ledPin, LOW);
  }        

  lastState = currentState;
  currentState = ledStatus & KEYBOARD_LED;  
  
  return (currentState != lastState); 
}

void sendContactInfo()
{
  Keyboard.print("Cooper Maa");
  Keyboard.sendKeyStroke(KEY_ENTER);
  Keyboard.print("Email: coopermaa77@gmail.com");
  Keyboard.sendKeyStroke(KEY_ENTER);
  Keyboard.print("Website: http://coopermaa2nd.blogspot.com/");
  Keyboard.sendKeyStroke(KEY_ENTER);
}

void loop() 
{
  int counter;
  
  delay(100);

  // Check whether KEYBOARD_LED is pressed 3 times in 2 seconds
  if (buttonPressed()) {
    counter = 1;
    for (int i = 0; i < 20; i++) {
      delay(100);
      if (buttonPressed()) counter = counter + 1;      
      
      // Send my information to computer
      if (counter >= 3) {
        sendContactInfo();
        break;
      }
    }      
    counter = 0;                  // reset counter
  }  
}
