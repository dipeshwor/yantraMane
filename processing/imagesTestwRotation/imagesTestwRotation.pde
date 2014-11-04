//https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing
 import processing.serial.*;
    import cc.arduino.*;
String path;
String file;
import processing.serial.*;
Serial myPort;  // Create object from Serial class
char val;      // Data received from the serial port


PImage bg;                       //Background 
int next=0;                      //count for the next image in the image sequence
int animationID=0;               //ID for animation 
int endID=0;                     //ID for end image 

/*
boolean sketchFullScreen()     //for fullscreen  
{
  return true;
} 
*/

void setup() 
{
  //size(960, 640);
  size(1366, 768); //Size of the image needs 90px x 90px 
  animationID = int(random(1,14));                                  // for test 1 to 13
  //animationID = 13;                                          //for test 13
  println(animationID);
  endID = fileListInFolder(animationID);   

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);  //find the number of files in the animation folder   
    println(Arduino.list());
}

int fileListInFolder(int aID)                  //returns the number of files in the folder 
{
  if (aID<10)
  { 
    path = sketchPath+"/data/a0"+aID+"/";
  }
  else
  { 
    path = sketchPath+"/data/a"+aID+"/";
  }
  File dataFolder = new File(path); 
  String[] fileList = dataFolder.list(); 
  println(fileList.length);
  return(fileList.length-1);
}

void draw() 
{
           // read it and store it in val
         
       
     if ( myPort.available() > 0)   // If data is available,
          {
             val = myPort.readChar(); 
             
            if (val == 'f')     //f to move forward 
            {
              animationID = int(random(1,14));
              //animationID = 13;   
              //println(val);
              if (next<endID-1)                      //28 images in the sequence 
              {
                next+=1;
              }
              else
              {
                next=1;
                //animationID = 13;
                animationID = int(random(1,14));                                          //for test- 1 to 13
                println(animationID);
                endID = fileListInFolder(animationID);                           //find the number of files in the animation folder
              }
               
              if (next<10) 
              {
                if (animationID<10)
                {
                  file = sketchPath+"/data/a0"+animationID+"/a0"+animationID+"00"+next+".jpg";
                  bg = loadImage(file);    //for images 1 to 9
              myPort.clear();  
              }
                else
                {
                  file = sketchPath+"/data/a"+animationID+"/a"+animationID+"00"+next+".jpg";
                  bg = loadImage(file);    //for images 1 to 9
              myPort.clear();   
              }
              } 
              else
              {
                if (animationID<10)
                {
                  file = sketchPath+"/data/a0"+animationID+"/a0"+animationID+"0"+next+".jpg";
                  bg = loadImage(file);    //for images 10 to 28
              myPort.clear();   
              }
                else
                {
                  file = sketchPath+"/data/a"+animationID+"/a"+animationID+"0"+next+".jpg";
                  bg = loadImage(file);    //for images 10 to 28
              myPort.clear();   
              }
              }  
              background(bg);
              //delay(10);
            }
            else   //b to move backward   
            {
              animationID = int(random(1,14));
              //println(val);
              if (next>1)                      //28 images in the sequence 
              {
                next-=1;
              }
              else
              {
                next=endID;
                animationID = int(random(1,14));
              }
                           
              if (next<10) 
              {
                if (animationID<10)
                {
                  file = sketchPath+"/data/a0"+animationID+"/a0"+animationID+"00"+next+".jpg";
                  bg = loadImage(file);    //for images 1 to 9
                   myPort.clear(); 
                }
                else
                {
                  file = sketchPath+"/data/a"+animationID+"/a"+animationID+"00"+next+".jpg";
                  bg = loadImage(file);    //for images 1 to 9
               myPort.clear();   
              }
              } 
              else
              {
                if (animationID<10)
                {
                  file = sketchPath+"/data/a0"+animationID+"/a0"+animationID+"0"+next+".jpg";
                  bg = loadImage(file);    //for images 10 to 28
               myPort.clear();   
              }
                else
                {
                  file = sketchPath+"/data/a"+animationID+"/a"+animationID+"0"+next+".jpg";
                  bg = loadImage(file);    //for images 10 to 28
               myPort.clear();   
              }
              }
              
              background(bg);
              //delay(10);
            }
          }
}


