//https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing

String path;
String file;

PImage bg;                       //Background 
int next=0;                      //count for the next image in the image sequence
int animationID=0;               //ID for animation 
int endID=0;                     //ID for end image 

/*boolean sketchFullScreen()     //for fullscreen  
{
  return true;
}*/ 

void setup() 
{
  size(90, 90);                                            //Size of the image needs 90px x 90px 
  animationID = int(random(1, 12));                                          //for test- 1 to 12
  println(animationID);
  endID = fileListInFolder(animationID);                           //find the number of files in the animation folder   
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
  //println(fileList.length);
  return(fileList.length);
}

void draw() 
{
  //background(bg);
          
          if (keyPressed) 
          {
            if (key == 'a' || key == 'A')       //a to move forward 
            {
              //println(val);
              if (next<endID)                      //28 images in the sequence 
              {
                next+=1;
              }
              else
              {
                next=1;
                animationID = int(random(1, 12));                                          //for test- 1 to 12
                println(animationID);
                endID = fileListInFolder(animationID);                           //find the number of files in the animation folder
              }
               
              if (next<10) 
              {
                if (animationID<10)
                {
                  file = sketchPath+"/data/a0"+animationID+"/a0"+animationID+"00"+next+".jpg";
                  bg = loadImage(file);    //for images 1 to 9
                }
                else
                {
                  file = sketchPath+"/data/a"+animationID+"/a"+animationID+"00"+next+".jpg";
                  bg = loadImage(file);    //for images 1 to 9
                }
              } 
              else
              {
                if (animationID<10)
                {
                  file = sketchPath+"/data/a0"+animationID+"/a0"+animationID+"0"+next+".jpg";
                  bg = loadImage(file);    //for images 10 to 28
                }
                else
                {
                  file = sketchPath+"/data/a"+animationID+"/a"+animationID+"0"+next+".jpg";
                  bg = loadImage(file);    //for images 10 to 28
                }
              }  
              background(bg);
              delay(10);
            }
            else if (key == 'b' || key == 'B')    //b to move backward   
            {
              //println(val);
              if (next>1)                      //28 images in the sequence 
              {
                next-=1;
              }
              else
              {
                next=endID;
              }
                           
              if (next<10) 
              {
                if (animationID<10)
                {
                  file = sketchPath+"/data/a0"+animationID+"/a0"+animationID+"00"+next+".jpg";
                  bg = loadImage(file);    //for images 1 to 9
                }
                else
                {
                  file = sketchPath+"/data/a"+animationID+"/a"+animationID+"00"+next+".jpg";
                  bg = loadImage(file);    //for images 1 to 9
                }
              } 
              else
              {
                if (animationID<10)
                {
                  file = sketchPath+"/data/a0"+animationID+"/a0"+animationID+"0"+next+".jpg";
                  bg = loadImage(file);    //for images 10 to 28
                }
                else
                {
                  file = sketchPath+"/data/a"+animationID+"/a"+animationID+"0"+next+".jpg";
                  bg = loadImage(file);    //for images 10 to 28
                }
              }
              
              background(bg);
              delay(10);
            }
          }
}


