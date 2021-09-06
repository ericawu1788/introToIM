
void setup() {
  size(500, 500);
}

void draw() {
  
  background(20, 100, 80);
  
  //colors
      //dark green = 20, 100, 80
      //blue = 180,200,150
      //light green = 200,220,170
      //yellow = 220,180,100
  
  noStroke();
  
  //blue thin layer
    fill(130,200,180);
    arc(80, 150, 700, 500, 0, PI, CHORD);
  
  //light green sky
    fill(200,220,170);
    arc(80, 130, 700, 500, 0, PI, CHORD);
    rect(0,0, 500,270);
    
  //blue layer head
    fill(130,200,180);
    ellipse(449,297,185,120);
    
  //dark green head 
    fill(20, 100, 80);
    ellipse(449,317,189,120);
  
  //face features
    fill(200,220,170);
    circle(400,315,20);
    circle(450,325,20);
    arc(415, 355, 50, 50, 0, PI, CHORD);
    
    
  //sun
    fill(220,180,100);
    circle(50,50,200);
    
    circle(mouseX, mouseY, 10);
    println("mouse coordinates = " + mouseX + ", " + mouseY);

}
