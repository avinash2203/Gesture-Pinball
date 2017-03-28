/* 
ARDUINO TO PROCESSING

Read Serial messages from Arduino for use in Processing. 
*Even though Serial Library comes with install of Processing, upon first usage, you may be prompted to execute two sudo Terminal 
commands after entering your user password*

Created by Daniel Christopher 10/27/12
Public Domain

*/

import processing.serial.*; //import the Serial library
int base=40;
int x,y,gameScore=0;
int changeX=-5;
int changeY=-5;
int gameOver=0;
float pointer;

int end = 10;    // the number 10 is ASCII for linefeed (end of serial.println), later we will look for this to break up individual messages
String serial;   // declare a new string called 'serial' . A string is a sequence of characters (data type know as "char")
Serial port;  // The serial port, this is a new instance of the Serial class (an Object)

void setup() {
  port = new Serial(this, Serial.list()[0], 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
  port.clear();  // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
  serial = port.readStringUntil(end); // function that reads the string from serial port until a println and then assigns string to our string variable (called 'serial')
  serial = null; // initially, the string will be null (empty)
  size(260, 440);
  x=(int)random(width);
  y=height-base;
}

void draw() 
{
  while (port.available() > 0) 
  { //as long as there is data coming from serial port, read it and store it 
    serial = port.readStringUntil(end);
  }
    if (serial != null)
    {  //if the string is not empty, print the following
    
    /*  Note: the split function used below is not necessary if sending only a single variable. However, it is useful for parsing (separating) messages when
        reading from multiple inputs in Arduino. Below is example code for an Arduino sketch
    */
    String[] a = split(serial, ',');  //a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
      println(a[0]); //print Value1 (in cell 1 of Array - remember that arrays are zero-indexed)
      println(a[1]); //print Value2 value
     // pointer=float(a[0])*0.2125;
      //pointer=315;
    if(gameOver==0)
  {
     
      background(0); 
      text("SCORE:"+gameScore+"00",width/2,height/2);
      if(float(a[0])<290)
      
      {
        pointer++;
      //rect(pointer,height-base,120,base);
      }
      else if(float(a[0])>340)
      {
      pointer--;
      //rect(pointer,height-base,120,base);
      }
      rect(pointer,height-base,120,base);
     /* while(int(a[0])<210)
      {
        mouseX--;
       rect(mouseX,height-base,200,base);
      }
      while(int(a[0])>270)
      {
        mouseX++;
       rect(mouseX,height-base,200,base);
      }*/
       ellipse(x,y,10,10);
       x=x+changeX;
       y=y+changeY;
       if(x<0 | x>width)
  {
    changeX=-changeX;
  }
  if(y<0)
  {
    changeY=-changeY;
  }
  if(y>height-base)
  {
    //check whether it is falling inside the rectangle or not
    if(x>pointer && x<pointer+200)
    {
      changeY=-changeY; //bounce back
      gameScore++;
    }
    else
    {
      gameOverSplash();
    }
  }
  }
  else
  {
    background(100,100,200);
    text("Game Over!",width/2,height/2);
    text("CLICK TO RESTART",width/2,height/2+20);
  }
  //println(mouseX);
}
}
void gameOverSplash()
{
  gameOver=1;
}
void mouseClicked()
{
  changeY=-changeY;
  gameScore=0;
  gameOver=0;
  }