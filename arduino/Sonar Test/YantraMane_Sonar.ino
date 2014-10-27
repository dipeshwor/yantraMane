#include <NewPing.h>

#define TRIGGER_PIN  2  // Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN     3  // Arduino pin tied to echo pin on the ultrasonic sensor.
#define MAX_DISTANCE 200 // Maximum uS / US_ROUNDTRIP_CM we want to ping for (in centimeters). Maximum sensor uS / US_ROUNDTRIP_CM is rated at 400-500cm.

const int threshold_a = 15;
const int threshold_b = 35;
int distance;

NewPing sonar(TRIGGER_PIN, ECHO_PIN,MAX_DISTANCE); // NewPing setup of pins and maximum uS / US_ROUNDTRIP_CM.

void setup() {
  Serial.begin(9600);
}

void loop() {  
  unsigned int uS = sonar.ping(); // Send ping, get ping time in microseconds (uS).
delay(50);
distance = (uS / US_ROUNDTRIP_CM);
  
  /* Serial.print("distance: ");
    Serial.print(distance);
    Serial.println("cm"); 
    */
  if (distance <= threshold_a) {
  }
  if (distance > threshold_b) {
  }
  if ((distance > threshold_a) && (distance <= threshold_b)){
 int test_reading_a = sonar.ping();
 delay(200);
 int test_reading_b = sonar.ping();
 delay(200);
 if (test_reading_a == test_reading_b) {
 }
 else if (test_reading_a > test_reading_b) {
   Serial.print("f");
 }
 else if (test_reading_a < test_reading_b) {
 Serial.print("b");
  }
  }
}

  
    
    
