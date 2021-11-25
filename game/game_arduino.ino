// Bounce a ball, and each time the ball hits the floor
// flash an LED on Arduino. Whenver Arduino receives a message,
// read an analog port and send it to Processing, to blow the
// ball to the left or right.
// Demonstrates adding serial communication to an existing project.

// Based on
// https://github.com/aaronsherwood/introduction_interactive_media/blob/master/processingExamples/gravityExamples/gravityWind/gravityWind.pde
// by Aaron Sherwood

const int LEDPIN = 3;
const int AINPIN = A2;

const int flashDuration = 100; // milliseconds
unsigned long turnedLEDOnAt = 0;

void setup() {
  Serial.begin(9600);

  // Since both sides wait for each other before they send anything,
  // someone needs to start the conversation
  Serial.println("0");

  pinMode(LEDPIN, OUTPUT);
}

void loop() {

  while (Serial.available()) {
    int valueFromProcessing = Serial.parseInt();

    // Only proceed if we have the end of line
    if (Serial.read() == '\n') {

      if (valueFromProcessing == 1) {
        //  turn on LED
        digitalWrite(LEDPIN, HIGH);
        // and note the time
        turnedLEDOnAt = millis();
      }

      // send the reading from an analog pin to Processing
      // which also signifies that we're ready for another
      Serial.println(analogRead(AINPIN));
    }
  }

  if (millis() - turnedLEDOnAt >= flashDuration) {
    // turn off LED
    digitalWrite(LEDPIN, LOW);
  }
}
