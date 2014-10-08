//https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing

char val;                 // Data received from the serial port
int ledPin = 13;          // Set the pin to digital I/O 13
int switchPin = 2;        // Set the pin to digital I/O 2
int switchPin2 = 3;        // Set the pin to digital I/O 3
boolean ledState = LOW;   //to toggle our LED
int buttonState = 0;      // variable for reading the switch status
int buttonState2 = 0;      // variable for reading the switch status

void setup() 
{
  pinMode(ledPin, OUTPUT);       // Set pin as OUTPUT
  pinMode(switchPin, INPUT);     // Set pin as OUTPUT
  pinMode(switchPin2, INPUT);     // Set pin as OUTPUT

  Serial.begin(9600);            //initialize serial communications at a 9600 baud rate
  establishContact();            // send a byte to establish contact until receiver responds 
}

void loop()
{
  if (Serial.available() > 0)           // If data is available to read,
  {           
    val = Serial.read();                // read it and store it in val
    if(val == '1')                       //if we get a 1
    {
       ledState = !ledState;             //flip the ledState
       //digitalWrite(ledPin, ledState); 
    }
    delay(10);
  } 
  else 
  {
      buttonState = digitalRead(switchPin); // read the state of the pushbutton value:
      buttonState2 = digitalRead(switchPin2); // read the state of the pushbutton value:
      if (buttonState == HIGH) 
      {     
        //digitalWrite(ledPin, HIGH);  
        Serial.println("a");                //send 'a' to change the image sequence 
        delay(10);
      } 
      else if (buttonState2 == HIGH)
      {
        Serial.println("b");                //send 'a' to change the image sequence 
        delay(10);
      }
      else 
      {
        // turn LED off:
        //digitalWrite(ledPin, LOW); 
      }
      //Serial.println("a");    
  }
}

void establishContact() 
{
  while (Serial.available() <= 0) 
  {
    Serial.println("A");   // send a capital A
    delay(10);
  }
}


