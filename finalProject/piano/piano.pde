import processing.serial.*;
Serial myPort;
boolean arduinoIsReady = false;
float inValue=0;
import processing.sound.*;
SoundFile[] file;
float note;
float smoothingFactor = 0.25;
float sum;

// Define the number of samples
int numsounds = 8;
int prevValue;
boolean change = false;

int red, blue, green;
boolean rIncrease, gIncrease, bIncrease;

void setup() {
  size(640, 360);
  red = 100;
  blue = 200;
  green = 150;
  rIncrease = false;
  gIncrease = false;
  bIncrease = false;
  // Create a Sound renderer and an array of empty soundfiles
  file = new SoundFile[numsounds];
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i) + ".mp3");
  }

  String portname=Serial.list()[3];
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  frameRate(1000);
}

void draw() {
  if (change)
  {
    myPort.write(1 + "\n");
    if (red<50)rIncrease=true;
    else if (red>200)rIncrease=false;
    if (rIncrease)red+=20;
    if (rIncrease==false)red-=20;
  }
  else myPort.write(2 + "\n");
  background(100, blue, green);
  noStroke();
  fill(red, 0, 150);
  sum+= (note-sum)*smoothingFactor;
  float scaled = sum * (height/2) * 5;
  ellipse(width/2, height/2, scaled, scaled);
  
}


void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    inValue = int(inString);
    println("received from Arduino: " + inValue);


    if (inValue!=-2)
    {
      file[int(inValue)].play(1, 1.0);
      note=map(inValue, 0, 7, 0.1, 0.9);
      if (prevValue!=int(inValue))change=true;
      else change=false;
    }
    prevValue=int(inValue);
  }
}
