char val; // Data received from the serial port
int ledPin = 13; // Set the pin to digital I/O 13
int switchPin = 2; // Set the pin to digital I/O 2
boolean ledState = LOW; //to toggle our LED
int buttonState = 0;         // variable for reading the pushbutton status

void setup() 
{
  pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
  pinMode(switchPin, INPUT); // Set pin as OUTPUT
  //initialize serial communications at a 9600 baud rate
  Serial.begin(9600);
  establishContact();  // send a byte to establish contact until receiver responds 
}

void loop()
{
  if (Serial.available() > 0) { // If data is available to read,
    val = Serial.read(); // read it and store it in val

    if(val == '1') //if we get a 1
    {
       ledState = !ledState; //flip the ledState
       //digitalWrite(ledPin, ledState); 
    }
    delay(10);
  } 
    else {
      
      // read the state of the pushbutton value:
      buttonState = digitalRead(switchPin);
    
      // check if the pushbutton is pressed.
      // if it is, the buttonState is HIGH:
      if (buttonState == HIGH) {     
        // turn LED on:    
        //digitalWrite(ledPin, HIGH);  
        Serial.println("a");
        delay(10);
      } 
      else {
        // turn LED off:
        //digitalWrite(ledPin, LOW); 
      }
      //Serial.println("a");    
    }
}

void establishContact() {
  while (Serial.available() <= 0) {
  Serial.println("A");   // send a capital A
  //delay(300);
  delay(10);
  }
}


