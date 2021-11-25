class Snake {
  Snake() {
  }
  void drawSnake(int x, int y) {
    setting();
    stroke(green);
    strokeWeight(20);
    point(x, y);
  }
}

int x, y, xapple, yapple, num;
int count = 0;
String mode, dir;
PImage arrow;
import processing.sound.*;
SoundFile eatSound;
color green = color(0, 75, 65);
color bgd = color(200, 160, 100); //background
color red = color(105, 0, 25);
import processing.serial.*;
Serial myPort;
boolean arduinoIsReady = false;
float inValue=0;
int prevState=0;
boolean left = false;


void setup() {
  size(800, 600);
  xapple = int(random (2, width/20 -2))*20;
  yapple = height/2;
  x = width/2;
  y = height/2;
  dir = "right";
  mode="play";
  num=0;
  frameRate(20);
  eatSound = new SoundFile(this, "eatSound.mp3");
  PFont font;
  font = createFont("baskvl.ttf", 128);
  textFont(font);

  String portname=Serial.list()[3];
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}

void draw() {
  if (mode=="play")
  {
    Snake mySnake;
    mySnake = new Snake();
    mySnake.drawSnake(x, y);

    //change direction
    if (dir=="left")x-=5;
    if (dir=="right")x+=5;

    //draw apple
    stroke(red);
    point(xapple, yapple);
  }

  stroke(green);
  //eat
  if (abs(x-xapple)<1) {
    eatSound.play();
    xapple = int(random (1, width/20 -2))*20;
    yapple = height/2;
    myPort.write(1 + "\n");
    num+=1;
  } else {
    myPort.write(2 + "\n");
  }

  //Game Over
  if (x<20||x>width-20)
  {
    over();
  }
  if (left)
  {
    dir="left";
  } else {
    dir="right";
  }
}

void setting()
{
  background(green);
  fill(bgd);
  rect(10, 10, 780, 580);
  textSize(30);
  fill(green);
  text("Score: "+num, 30, 50);
}

void over()
{
  noLoop();
  fill(green);
  text("Game Over", width/2, height/2 - 50);
  text("Your score: "+num, width/2, height/2);
  text("Press ENTER to restart", width/2, height/2 + 50);
  mode="over";
}

void keyPressed() {
  //switch between modes: start, play, pause, over
  if (keyCode == ENTER) {
    //start -> play
    if (mode=="start") {
      loop();
      mode = "play";
    } else {
      //play -> pause
      if (mode=="play")
      {
        noLoop();
        text("press ENTER to Resume", width/2, height/2);
        mode ="pause";
      } else {
        //pause -> play
        if (mode == "pause") {
          loop();
          mode = "play";
        } else {
          //over -> play
          if (mode == "over") {
            xapple = int(random (30, width-30));
            yapple = height/2;
            x = int(random (200, 600));
            y = height/2;
            num=0;
            loop();
            mode="play";
          }
        }
      }
    }
  }
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  // Always check to make sure the string isn't empty
  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to a float
    inValue = float(inString);
    // map to the width of the screen
    println("received from Arduino: " + inValue);
    //state machine
    if (inValue>100) {
      if (prevState==0)
      {
        if (left == false)
          left=true;
        else if (left)
          left=false;
      }
    }

    if (inValue>100) prevState=1;
    if (inValue<100) prevState=0;

    arduinoIsReady=true;
  }
}
