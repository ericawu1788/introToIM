String strings[];

float minX = 0.0;
float maxX = 0.0;
float minY = 0.0;
float maxY = 0.0;

void setup() {
  size(800, 600);
  background(255, 255, 255);
  strings = loadStrings("/Users/ericawu/Downloads/owid-covid-data.csv");
  if (strings == null) {
    println("failed to load the file, stopping here");
    while (true) {
      ;
    }
  }
  println("strings loaded from file successfully, read " + strings.length + " lines");
  findMaxXY();
  fill(0,0,0);
  text("Total Cases vs New Cases", 500,50);
 
}

void findMaxXY() {
  String singleRow[];
  for (int csvRowNumber=1; csvRowNumber<strings.length-1; csvRowNumber++)
  {
    singleRow = split(strings[csvRowNumber], ',');
    if (singleRow[3].equals("2021-09-20"))
    {
      if (Float.isNaN(float(singleRow[10])) || Float.isNaN(float(singleRow[48])))
      {
        println("conversion to float failed; skipping row " + csvRowNumber);
      } else {
        if (float(singleRow[10])>maxX) maxX = float(singleRow[10]);
        if (float(singleRow[5])>maxY)maxY=float(singleRow[5]);
      }
    }
  }
  println("Maximum of X is " + maxX+" and maximum of Y is " + maxY);
}
int rowNumber = 1;
int r=100;
int g=0;
int b=200;
void draw() {
  //circle(300,300,200);
  String singleRow[];
  singleRow = split(strings[rowNumber], ',');
  
  //check whether it's the date: println(singleRow[3]);
  
  //only collect data on 2021-09-20
  if (singleRow[3].equals("2021-09-20"))
  {
    //X axis will be total cases per million
    float totalX = float(singleRow[10]);
    //y axis will be median age
    float newY= float(singleRow[5]);
    //size of the circle is the total cases
    float totalPerMil = float(singleRow[4]);
    
    //print statement - generative text output
    println("On "+singleRow[3]+", "+singleRow[2]+" has "+totalX+" total cases, "+newY+" new cases, and "+totalPerMil+" total cases per million people.");
    
    //draw the circle if they aren't not NaN
    if (Float.isNaN(totalX) || Float.isNaN(newY) ) {
      println("conversion to float failed; skipping row " + rowNumber);
    } 
    else {
      //color format
        noStroke();
        fill(r, g,b, 80);
        r=20;
        g+=10;
        b+=15;
        if(r<=0) r=255;
        if(g>=255) g=0;
        if(b>=255) b=0;
      circle(30+(totalX*width/maxX), height/2 - (newY*height/maxY), (totalPerMil/10000)+10);
      
      //check what the values look like
      //println(totalX*width/maxX+" and "+ newY*height/maxY+" and " +totalPerMil/1000);
      
      //country name on the circle
      fill(0,0,0);
      text(singleRow[2],30+(totalX*width/maxX), height/2 - (newY*height/maxY)); 
    }
  }
  rowNumber++;
  if (rowNumber >= strings.length-1) {
    println("finished");
    noLoop();
  }
}
