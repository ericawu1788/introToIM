For this assignment, I've decided to work with what I already know and have learned in class. I first set up the photoresistor to make sure it is working by testing out the fade example. When it worked, I was able to know that I have the photoresistor under control. I then thought I can use the photoresistor to interact with the LED by controlling its brightness. I then set up the LED with the fade example to make sure its brightness can dim and brighten. I then changed the brightness to tapValue (the name I gave to the value of light from the the photoresistor). I tested it out and it worked. I then utilize my past code of using the switch to call the LED. As I decide to make the red light turn on and off according to the state of the switch, like how the switch of light works. I added a boolean value "on" that changes between true and false according to when the switch is pressed - pressing it turns "on" true and pressing it again turns it off. Initially it didn't work, so I had to look through this section again. Eventually I found out I should have written "if else" after the first "if" statement. Even the, when I tested out, it seemed like it works, but I realize it doesn't always work. This means that when I press the switch, it sometimes turns on/off accordingly but sometimes didn't. At first I thought it could be because the connection of the switch isn't well enough. However, I then realized that in my program, whether the switch turns on or off depends on how long I press on it. I then realize I should be checking whether the switchState changed from LOW to HIGH, which is the only time the "on" shoud be changed. I added another prevState integer to symbolize the previous stae of the switch. this is to make sure that only when the prevState doesn't correspond to switchState will the on/off be switched. It was a bit hard to wrap my head around how the prevState would wor, but eventually I figured it out and it worked. I found it useful to build upon what I already know or bring in aspect that has not been used.

This is what my breadboard looks like:
![breadboard](https://user-images.githubusercontent.com/71425903/141220247-b2a5748e-da1d-4c55-8036-1c9014595eb5.jpg)


This is what my schematic diagram looks like:
![schematic](https://user-images.githubusercontent.com/71425903/141220267-264fcccd-08ad-4171-bfdc-5445f74119ee.jpg)


Here is a demo video of the circuit:

https://user-images.githubusercontent.com/71425903/141219881-c3e05913-941e-4208-a4c1-74690c640d41.mov

