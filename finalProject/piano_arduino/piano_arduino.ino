const int LEDPIN = 3;
const int knob = A2;
const int button = 6;

int value = 0;
//int pitch;
const int flashDuration = 100; // milliseconds
unsigned long turnedLEDOnAt = 0;


void setup() {
  Serial.begin(9600);
  
  //Processing understands "-2" as play nothing
  Serial.println("-2");

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
      //map sensor to 0 to 7
      Serial.println(map(sensorValue, 0, 1023, 7.4 ,-0.5));
      }
      else Serial.println("-2");
    }
  }

  if (millis() - turnedLEDOnAt >= flashDuration) {
    // turn off LED
    digitalWrite(LEDPIN, LOW);
  }
}
