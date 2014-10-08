//https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing

import processing.serial.*;      //import the Serial library
Serial myPort;                   //the Serial port object
String val;

boolean firstContact = false;    //Serial handshaking

PImage bg;                       //Background 
int next=0;                      //count for the next image in the image sequence 

/*boolean sketchFullScreen()     //for fullscreen  
{
  return true;
}*/ 

void setup() 
{
  size(90, 90);                                           //Size of the image needs 90px x 90px 
  //myPort = new Serial(this, "/dev/ttyUSB0", 9600);      //9600 baud rate for Linux since the port keeps on changing 
  myPort = new Serial(this, Serial.list()[1], 9600);      //same as above (stable in Windows)
  myPort.bufferUntil('\n'); 
}

void draw() 
{
  //background(bg);
}


void serialEvent( Serial myPort) 
{
  val = myPort.readStringUntil('\n');           //put the incoming data into a String the '\n' is our end delimiter indicating the end of a complete packet
  if (val != null)                              //make sure our data isn't empty before continuing 
  {
    val = trim(val);                            //trim whitespace and formatting characters (like carriage return)
    if (firstContact == false) 
    {
      if (val.equals("A"))                       //look for our 'A' string to start the handshake 
      {
        myPort.clear();                          //if it's there, clear the buffer, and send a request for data
        firstContact = true;
        myPort.write("A");
        println("contact");
      }
    }
    else                                        //if we've already established contact, keep getting and parsing data 
    { 
            println(val);
            if (val.equals("a"))                //if we get 'a' from arduino 
            {
              //println(val);
              if (next<28)                      //28 images in the sequence 
              {
                next+=1;
              }
              else
              {
                next=1;
              }
              
              if (next<10) 
              {
                bg = loadImage("image00"+next+".jpg");    //for images 1 to 9
              } 
              else
              {
                bg = loadImage("image0"+next+".jpg");      //for images 10 to 28
              }  
              background(bg);
              delay(10);
            }
            else if (val.equals("b"))                //if we get 'b' from arduino to move backward  
            {
              //println(val);
              if (next>1)                      //28 images in the sequence 
              {
                next-=1;
              }
              else
              {
                next=28;
              }
              
              if (next<10) 
              {
                bg = loadImage("image00"+next+".jpg");    //for images 1 to 9
              } 
              else
              {
                bg = loadImage("image0"+next+".jpg");      //for images 10 to 28
              }  
              background(bg);
              delay(10);
            }
        myPort.write('1');        //send a 1
        println("1");
      }
      myPort.write("A");          // when you've parsed the data you have, ask for more:
    }
}

