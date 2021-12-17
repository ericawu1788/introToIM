import processing.serial.*;
Serial myPort;
boolean arduinoIsReady = false;
int inValue=0;
int prevValue;
import processing.sound.*;
SoundFile[] file;
float note;
float smoothingFactor = 0.25;
float sum;
boolean start = true;
//int beatNo = 0;
int trackRecord = 0;
int opacity=255;
String page = "start";


class Note {
  int stored;
  boolean storedChange;
  Note(int n) {
    stored= n;
  }
  int show() {
    return stored;
  }
  void storeChange(boolean c) {
    c=storedChange;
  }
  boolean showChange() {
    return storedChange;
  }
}

//to record, memorize values Arduino send in an arraylist in order to play later
ArrayList<Note> record = new ArrayList<Note>();

// number of samples/piano notes
int numsounds = 8;

//document when pitch changes to tell arudino when to light up the LED
boolean change = true;
PImage img, imgIns;

void setup() {
  fullScreen();
  img = loadImage("sky.jpg");
  img.resize(width, 0);
  imgIns = loadImage("ins-01.png");

  // Create an array of piano soundfiles
  file = new SoundFile[numsounds];
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i) + ".mp3");
  }

  String portname=Serial.list()[3];
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');

  PFont font;
  font = createFont("baskvl.ttf", 50);
  textFont(font);
}

void draw() {
  //record: add values Arduino send to the arraylist "record"
  if (page == "recording")
  {
    Note myNote;
    myNote = new Note(inValue);
    myNote.storeChange(change);
    record.add(myNote);
  }

  //run the music function where you take the value from the "record" arraylist
  if (page=="playRecording")
  {
    if (trackRecord<record.size())
    {
      Note n = record.get(trackRecord);
      music(n.show());
      trackRecord++;
    }
  }

  //tell Arduino to light up when pitch changes
  if (change)myPort.write(1 + "\n");
  else myPort.write(2 + "\n");

  //background image
  image(img, 0, 0, width, height);
  
  //set balloon size and opacity
  noStroke();
  sum+= (note-sum)*smoothingFactor;
  float scaled = sum * (height/2) * 2;
  opacity = int(map(scaled, 20, 700, 255, 100));
  fill(250, 160, 140, opacity);
  if (page != "start")
  {
    pushMatrix();
    translate(width/2, height/2 -30);
    ellipse(0, 0, scaled, scaled);
    triangle(-scaled*0.4, scaled*0.301, scaled*0.4, scaled*0.301, 0, scaled*0.7);
    triangle(0, scaled*0.68, -scaled*0.1, scaled*0.78, scaled*0.1, scaled*0.78);
    popMatrix();
  }
  //show text that appears on in the window
  displayText();
}


void displayText() {
  fill(115, 100, 110);
  textSize(24);
  
  //different text for different pages
  if (page == "start")
  {
    textSize(80);
    text("Balloonotes.", (width-textWidth("Balloonotes"))/2, 200);
    //image of instructions
    imgIns.resize(700, 0);
    image(imgIns, (width-imgIns.width)/2, (height-imgIns.height)/2);
    textSize(24);
    text("press the button to start playing!", (width- textWidth("press the button to start playing!"))/2, height-180);
  }
  if (page=="play")
  {
    fill(113, 100, 110);
    rect(width-200, height-70, 86, 40, 30);
    text("practice", 40, 45);
    fill(255);
    text("record", width-190, height-45);
  }
  if (page=="recording")
  {
    fill(113, 100, 110);
    rect(width-200, height-70, 175, 40, 30);
    text("recording", 40, 45);
    fill(255);
    text("pause recording", width-190, height-45);
  }
  if (page=="stopped")
  {
    fill(113, 100, 110);
    rect(width-200, height-70, 162, 40, 30);
    rect(width-200, height-120, 103, 40, 30);
    text("recording stopped", 40, 45);
    fill(255);
    text("play recording", width-190, height-45);
    text("continue", width-190, height-95);
  }
  if (page=="playRecording")
  {
    fill(113, 100, 110);
    rect(width-200, height-70, 86, 40, 30);
    text("recording playing", 40, 45);
    fill(255);
    text("restart", width-190, height-45);
  }
}

void mousePressed() {
  //set mousepressed places for text boxes
  if (page == "play") {
    if (mouseX>width-200&&mouseX<width-114&&mouseY<(height-30)&&mouseY>(height-70))
      page="recording";
  } else if (page == "recording") {
    if (mouseX>width-200&&mouseX<width-25&&mouseY<(height-30)&&mouseY>(height-70))
      page="stopped";
  } else if (page == "stopped") {
    if (mouseX>width-200&&mouseX<width-97&&mouseY<(height-80)&&mouseY>height-120)
      page="recording";
    if (mouseX>width-200&&mouseX<width-38&&mouseY<(height-30)&&mouseY>(height-70))
      page="playRecording";
  } else if (page == "playRecording") {
    if (mouseX>width-200&&mouseX<width-114&&mouseY<(height-30)&&mouseY>(height-70))
    {
      page="play";
      record.clear();
      trackRecord=0;
    }
  }
}

void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    if (page!="playRecording")
    {
      inValue = int(inString);
      println("received from Arduino: " + inValue);
    }
    music(inValue);
  }
}

//music function - play the piano file in the array corresponding to the value Ariduino sends
void music(int value) {
  if (value!=-2) {
    if (!file[value].isPlaying()) {
      file[value].play(1, 1.0);
    }
    //note for how much the balloon changes.
    note=map(value, 0, 7, 0.1, 0.9);
    //record whether the pitch changes or not
    if (prevValue!=value)change=true;
    else change=false;
    if (page=="start")page= "play";
  }
  prevValue=int(value);
}
