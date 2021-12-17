class Flower {

  float xPos, yPos, size;
  color myColor;
  int change, mode;
  int red1, red2, green1, green2, blue1, blue2;

  Flower(float _size, int _mode) {
    size = _size;
    mode = _mode;
    xPos = random (0, width);
    yPos = random (0, height);
    //setting different color modes
    if (mode%3==0) {
      red1 = 100;
      red2 = 256;
      green1 = 0;
      green2 = 100;
      blue1 = 100;
      blue2 = 256;
    }
    if (mode%3==1) {
      red1 = 100;
      red2 = 256;
      green1 = 100;
      green2 = 256;
      blue1 = 0;
      blue2 = 100;
    }
    if (mode%3==2) {
      red1 = 0;
      red2 = 100;
      green1 = 100;
      green2 = 256;
      blue1 = 100;
      blue2 = 256;
    }
    myColor = color(random(red1, red2), random(green1, green2), random(blue1, blue2));
  }

  void drawFlower() {
    strokeWeight(5);
    stroke(myColor);
    translate(xPos, yPos);
    change = 0;
    for (int ring = 0; ring < size; ring++)
    {
      for (int petal = 0; petal<size; petal++)
      {
        point(change, 0);
        rotate(360/size);
      }
      change+=10;
    }
  }
}

int count = 0;
int colorMode=0;

void setup() {
  size(1000, 700);
  background(0, 0, 0);
  frameRate(10);
}

void draw() {
  Flower myFlower;
  myFlower = new Flower(random(10, 20), colorMode);
  myFlower.drawFlower();
  count++;
  if (count>50) {
    background(0, 0, 0);
    count=0;
    //change flower color
    colorMode++;
  }
}


/*
Create a generative artwork using Object-Oriented Programming.
 You may use arrays if you wish.
 Pay attention to the structure, clarity, and organization of your program.
 Document your project at least as well as last week
 */
