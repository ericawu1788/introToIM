const int AINPIN = A2;

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);

  // Since both sides wait for each other before they send anything,
  // someone needs to start the conversation
  Serial.println("0");
}

void loop() {
  while (Serial.available()) {
    Serial.parseInt(); // no need to store the value since we don't need it

    // Only proceed if we have the end of line
    if (Serial.read() == '\n') {

      // send the value of analog input 0:
      Serial.println(analogRead(AINPIN));
    }
  }
}
