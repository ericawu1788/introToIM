// Bounce a ball, and each time the ball hits the floor
// flash an LED on Arduino. Demonstration of adding serial
// communication to an existing project.
// Based on
// https://github.com/aaronsherwood/introduction_interactive_media/blob/master/processingExamples/gravityExamples/gravityWind/gravityWind.pde
// by Aaron Sherwood
PVector velocity;
PVector gravity;
PVector position;
PVector acceleration;
float drag = 0.99;
float mass = 50;
float hDampening;
import processing.serial.*;
Serial myPort;
boolean arduinoIsReady = false;
void setup() {
  size(640, 360);
  noFill();
  position = new PVector(width/2, 0);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  gravity = new PVector(0, 0.5*mass);
  printArray(Serial.list());
  // replace the index with the index of Arduino's serial port
  String portname=Serial.list()[3];
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}
void draw() {
  background(255);
  applyForce(gravity);
  velocity.add(acceleration);
  velocity.mult(drag);
  position.add(velocity);
  acceleration.mult(0);
  // Note that the mass is also the radius
  ellipse(position.x, position.y, mass, mass);
  // Did we hit the floor?
  if (position.y > height-mass/2) {
    // change direction to bounce, also loose some energy
    // (dampning) so we the bounce is a little less each time
    velocity.y *= -0.9;
    // prevent sinking beneath the floor
    position.y = height-mass/2;
    // Send message to Arduio
    if (arduinoIsReady && velocity.mag() > 1) {
      myPort.write(1 + "\n"); // could be any value
      arduinoIsReady = false;
    }
  }
}
void applyForce(PVector force) {
  // Newton's 2nd law: F = M * A
  // or A = F / M
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}
void serialEvent(Serial myPort) {
  String s=myPort.readStringUntil('\n');
  arduinoIsReady = true;
}
