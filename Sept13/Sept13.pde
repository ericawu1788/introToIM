//line starting coordinate
int x = 0;
int y = 0;

//shades of grey for line
int c=0;

//how much grey changes
int p=10;

//gradient background
size(600, 600);
noStroke();
for (int e = 0; e < 100; e++) {
  for (int r = 0; r < 100; r++) {
    fill(e, 0, r);
    rect(map(e, 0, 100, 0, width), map(r, 0, 100, 0, height), width/100, height/100);
  }
}

//lines
for (int t=0; t<500; t++) {
  stroke(c, c, c);
  int x2= Math.round(random(600));
  int y2= Math.round(random(600));
  line(x, y, x2, y2);
  x=x2;
  y=y2;
  c=c+p;
  
  //reverse brightness once the it reaches the edge
  if (c>250) {
    p=-10;
  }
  if (c<0) {
    p=10;
  }
}
