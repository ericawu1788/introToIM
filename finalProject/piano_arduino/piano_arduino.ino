const int LEDPIN = 3;
const int knob = A2;
const int button = 6;

int value = 0;
//int pitch;
const int flashDuration = 10; // milliseconds
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

      // Tell Processing we're ready for another
      if(digitalRead(button)==HIGH){
      int sensorValue = analogRead(knob);
      Serial.println(map(sensorValue, 0, 1023 ,-0.5, 7.4)); // the value doesn't matter
      }
      else Serial.println("-2");
    }
  }

  if (millis() - turnedLEDOnAt >= flashDuration) {
    // turn off LED
    digitalWrite(LEDPIN, LOW);
  }
}
