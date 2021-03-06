const int xpin = A3;                  // x-axis of the accelerometer
const int ypin = A2;                  // y-axis
const int zpin = A1;                  // z-axis (only on 3-axis models)

void setup()
{
  // initialize the serial communications:
  Serial.begin(9600);
}

void loop()
{
  // print the sensor values:
  Serial.print(analogRead(xpin));
  // print a tab between values:
  Serial.print("\t");
  
  Serial.print(analogRead(ypin));
  // print a tab between values:
  Serial.print("\t");
  
  Serial.print(analogRead(zpin));
  
  Serial.println();
  // delay before next reading:
  delay(1000);
}
