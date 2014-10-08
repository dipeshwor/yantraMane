import processing.serial.*; //import the Serial library
Serial myPort;  //the Serial port object
String val;
// since we're doing serial handshaking, 
// we need to check if we've heard from the microcontroller
boolean firstContact = false;

PImage bg;
int next=0;

/*boolean sketchFullScreen() {
  return true;
}*/

void setup() {
  size(90, 90);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 90 x 90 pixels.
  // bg = loadImage("image001.jpg");
  
  //  initialize your serial port and set the baud rate to 9600
  myPort = new Serial(this, "/dev/ttyUSB0", 9600);
  myPort.bufferUntil('\n'); 
}

void draw() {
  //background(bg);
}


void serialEvent( Serial myPort) {
//put the incoming data into a String - 
//the '\n' is our end delimiter indicating the end of a complete packet
val = myPort.readStringUntil('\n');
//make sure our data isn't empty before continuing
if (val != null) {
  //trim whitespace and formatting characters (like carriage return)
  val = trim(val);
  //println(val);

  //look for our 'A' string to start the handshake
  //if it's there, clear the buffer, and send a request for data
  if (firstContact == false) {
    if (val.equals("A")) {
      myPort.clear();
      firstContact = true;
      myPort.write("A");
      println("contact");
    }
  }
  else { //if we've already established contact, keep getting and parsing data
          println(val);
          if (val.equals("a")) 
          {
            //println(val);
            if (next<28)
            {
              next+=1;
            }
            else
            {
              next=1;
              //myPort.stop();
              //myPort = new Serial(this, "/dev/ttyUSB0", 9600);
            }
            
            if (next<10) 
              bg = loadImage("image00"+next+".jpg");
            else
              bg = loadImage("image0"+next+".jpg");
            background(bg);
            delay(10);
            
          }
      
      myPort.write('1');        //send a 1
      println("1");
    }

    // when you've parsed the data you have, ask for more:
    myPort.write("A");
    
  }
}

