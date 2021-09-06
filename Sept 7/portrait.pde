
void setup() {
  size(500, 500);
}

void draw() {
  
  background(50, 80, 50);
  
  //colors
      //brown = 120, 100, 80
      //dark green = 50, 80, 50
      //med green = 180,200,150
      //light green = 200,220,170
      //yellow = 220,180,100
  
  noStroke();
  
  //med green thin layer
    fill(180,200,150);
    arc(80, 150, 700, 500, 0, PI, CHORD);
  
  //light green sky
    fill(200,220,170);
    arc(80, 130, 700, 500, 0, PI, CHORD);
    rect(0,0, 500,270);
    
  //med green thing layer head
    fill(180,200,150);
    ellipse(449,297,185,120);
    
  //dark green head 
    fill(50, 80, 50);
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
