
const int pushSwitch = A2;
const int redLED = A0;
const int greenLED = 8;

void setup() {
  // put your setup code here, to run once:
  pinMode(redLED, OUTPUT);
  pinMode(greenLED, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  int switchState = digitalRead(pushSwitch);

  if(switchState == HIGH){
    digitalWrite(redLED,HIGH);
    delay(200);
    digitalWrite(greenLED,HIGH);
    delay(500);
    digitalWrite(redLED, LOW);
    delay(700);
    digitalWrite(redLED, HIGH);
    digitalWrite(greenLED, LOW);
    delay(300);
    digitalWrite(greenLED, HIGH);
  }
  allOff();
  delay(100);
}

void allOff(){
  digitalWrite(redLED,LOW);
  digitalWrite(greenLED,LOW);
}
