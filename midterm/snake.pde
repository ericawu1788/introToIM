class Snake {
  Snake() {
  }

  void drawSnake(int x, int y) {
    setting();
    stroke(green);
    strokeWeight(20);
    for (int n =0; n<num+1; n++)
    {
      if (dir=="up")point(x, y+(n*20));
      if (dir=="down")point(x, y-(n*20));
      if (dir=="left")point(x+(n*20), y);
      if (dir=="right")point(x-(n*20), y);
    }
  }
}

int x, y, xapple, yapple, num;
String mode, dir;
PImage arrow;
import processing.sound.*;
SoundFile eatSound;
color green = color(0, 75, 65);
color bgd = color(200, 160, 100); //background
color red = color(105, 0, 25);

void setup() {
  size(800, 600);
  xapple = int(random (2, width/20 -2))*20;
  yapple = int(random (2, height/20 -2))*20;
  x = width/2;
  y = height/2;
  dir = "right";
  mode="start";
  num=0;
  frameRate(20);
  arrow = loadImage("arrow.png");
  eatSound = new SoundFile(this, "eatSound.mp3");
  PFont font;
  font = createFont("baskvl.ttf", 128);
  textFont(font);
}

void draw() {
  if (mode=="play")
  {
    Snake mySnake;
    mySnake = new Snake();
    mySnake.drawSnake(x, y);

    //change direction
    if (dir=="up")y-=5;
    if (dir=="down")y+=5;
    if (dir=="left")x-=5;
    if (dir=="right")x+=5;

    //draw apple
    stroke(red);
    point(xapple, yapple);
  }
  
  stroke(green);
  //eat
  if (abs(x-xapple)<10 && abs(y-yapple)<10) {
    eatSound.play();
    xapple = int(random (1, width/20 -1))*20;
    yapple = int(random (1, height/20 -1))*20;
    num+=1;
  }

  //Game Over
  if (x<20||x>width-20||y<20||y>height-20)
  {
    over();
  }

  //start page
  if (mode=="start") {
    noLoop();
    background(bgd);
    fill(green);
    circle(220, 130, 20);
    circle(245, 130, 20);
    circle(270, 130, 20);
    circle(295, 130, 20);
    circle(320, 130, 20);
    arrow.resize(150, 0);
    image(arrow, 200, 150);
    textSize(42);
    text("Snake", 200, height/2 - 200);
    textSize(20);
    text("Use your keyboard to change directions.", 200, height/2);
    text("You are a green snake, eat as many red apples as you can!", 200, height/2+40);
    text("Press ENTER to start and pause in the game.", 200, height/2 +80);
    text("GAME OVER if your head touches the border!", 200, height/2 +120);
  }
  
  //game gets more challenging
  if (num>8)frameRate(30);
  if (num>15)frameRate(40);
}

void setting()
{
  background(green);
  fill(bgd);
  rect(10,10,780,580);
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
  //change dir, or directions: up, down, left, right
  if (keyCode == UP) {
    dir = "up";
  }
  if (keyCode == DOWN) {
    dir = "down";
  }
  if (keyCode == LEFT) {
    dir = "left";
  }
  if (keyCode == RIGHT) {
    dir = "right";
  }
  
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
            xapple = int(random (15, width-15));
            yapple = int(random (15, height -15));
            x = int(random (200, 600));
            y = int(random (200, 400));
            num=0;
            loop();
            mode="play";
          }
        }
      }
    }
  }
}
