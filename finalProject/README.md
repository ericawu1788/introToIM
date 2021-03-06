With the prompt focused on interactivity, this project puts a strong focus on immediate responses between the physicality of Arduino and the reaction on screen of Processing. Balloonotes is a musical instrument in which the user can manipulate the rhythm and pitch of the sound played from the instrument. One button controls the rhythm while the other knob controls the pitch. As sound is played, the balloon on the screen changes its size - the high the pitch is, the bigger the balloon is. Not only did the balloon change its size, its opacity also changes according to the pitch. This program also has a coupple of pages with its features, including the practice page, recording page, pause recording page (for which you can continue recording),and play recording page. The practice page is just simply the musical instrument; the recording page allows you to record whatever you play on the instrument; the pause recording page is like the practice page where nothing is recorded; and the play recording pageis where the sound will play by itself and the balloon will move accordingly. When the user press the "restart" button on the play recording page, the window shows the practice page ready to record a new music segment.

The making of this project was very much inspired by feedback I've received. The aesthetics were inspired by a friend's suggestions of making the object a balloon with a background that suits it. The intention of changing the opacity of the balloon was to make it more realistic as the rubber of balloons get more stretched when its blown bigger, making it more translucent. The recording function was inspired by Michael's suggestion of recording what is being played. 

Challenges I've faced in this project include figuring out how to record the sound. A problem I went into was that when I wanted the program the sound from the arraylist, it continues to take in values Arduino gives it. Jack then reminded me that you don't always have to take in, or listen, to the values Arduino sends. I've then manipulated what Processing does with the values it take in from Arduino - by not translating into the value that will be read for playing music. 
One improvement that can be made is that in the play recording page, there should be buttons on screen to pause and replay the recording. Another improvement was to change up when the LED lights up, either make a new LED for the change itself or make the LED only light up when the button is pressed. I wanted to include a LED to indicate when the pitch has been changed and found it convenient to connect the LED wires to the LED of the button. I figured this is an example of where to use technology to enhance the experience, because in this case, it might actually cause confusion instead of adding on to the experience. I've also realize most people comment about the "Shake Shack" symbol on the box. A problem with having a very obvious logo is that it might distract the objective or expectation users have towards my project. 


![schematic](https://user-images.githubusercontent.com/71425903/146549796-f22b3dd7-2613-4ff7-aff0-44a2f90790ff.jpg)
This is a photo of the schematic of the project.

![photo](https://user-images.githubusercontent.com/71425903/146549861-c2a699f1-43de-44e7-95bc-72d56849a509.jpg)
This is a photo of the breadboard


https://user-images.githubusercontent.com/71425903/146550922-6f1456cd-d8df-40cc-82ce-719c48df4eaf.mov


This is a video of the Balloonotes demonstration that also shows what the project looks like.
