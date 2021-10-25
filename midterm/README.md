Oct 5.

Since I wanted to make a game relating to maps, I have searched it up on the internet to see if anyone has a cool way to approach it. I then encountered the library unfolding ( http://unfoldingmaps.org/tutorials/getting-started-in-processing.html ), which I though could be useful. However, when I tried to load the sample code, it had several errors that I might need help with checking. I then resorted to another plan that does not require this additional library. The game I'm thinking of is providing a map of a region and asking the player to draw where they think the river is. The system will then evaluate how close that is to the actual river and give a score to it. What I find challenging about this is giving the scoring. I might even need to change this topic later if it is actually too hard, but I think it's worth a shot.


Oct. 15
I was initially thinking of making some sort of interactive map but I can't think of any feasible concrete ideas. I have tried to import libraries to explore in that field but the libraries don't really work.

I have then thought of another game idea:

- the game starts with a zoomed-in view of the canvas
- you start drawing by pressing the up/down/left/right key
- the zoomed-in view follows the "point" you are drawing so that your current point is always at the center
- when you are finished, you press another key or click to zoom out to see the whole canvas - your drawing
- the background could be a photo of a map, so that the game would be to trace as closely to the borders/outline as possible

I have then learned to zoom in and pan on the canvas. However, when I tried to draw on the zoomed-in view, the drawing doesn't stay because the translated photo of the map is layered on top of the previous drawing. Is there a way to solve this? Or is this not feasible?

I am open to other ideas of game ideas if this game idea isn't possible. I have also thought about creating a slider of time to show images of the maps changing accordingly but I am not sure if this would be too simple. I am also exploring the built in map() function in Processing.

Michael then responded that zooming in is complicated so I moved forward with making the snake game. This decision is from the fact that I have the code for moving in different directions from the map game. My process of coding in order goes:

- creating and displaying an object called Snake
- moving the snake and changing the direction with the keyboard
- creating an apple and the "eat()" function
- encountered the problem of turning as a longer snake - the body turns very abruptly the same time as the head of the snake changes direction. Since I need help on this, I first continued working on what I can work on
- added the start, pause, and end mode - which can be executed by pressing ENTER
- asked Michael for advice, realized that it is fine for the snake to turn the way it's turning now, so I adjusted the instructions to - game over if the head touches the border. As Michael explained how snake is typically done, I've realized I had a different way of approaching it
- I added sound effects and an image into the game
- I tried to work out how snake is drawn with Michael's suggestions but failed, so I just went along with my original design
- adjust stylistic choices - color scheme and making it more challenging as you reach a certain score by adjusting the frame rate

Overall, I started with the essential components of the game, making the game at least reaching the bare minimum. After I've done that, I've then added other components to it, such as the color scheme and speed of the game. Although I have changed my project idea, I think the game still worked out really well in the end. I have also worked around the challenges I've faced, such as exploring another field from maps to snakes. Regarding deciding if I should change to Michael's suggested way, I realized I might be able to make that happen if I had known this earlier or if I have more time, but since it is already fine, I have decided to spend the time on enhancing the game itself. I've also experienced and learned about prioritizing tasks and components of the game to enhance overall user experience.

![Screenshot](/midterm/start.png)
This is the start page.

![Screenshot](/midterm/game1.png)
![Screenshot](/midterm/game2.png)
These are during the game.

![Screenshot](/midterm/resume.png)
This is when you pause the game.

![Screenshot](/midterm/over.png)
This is when the game is over
