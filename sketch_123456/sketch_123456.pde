boolean teXt; //Tell players that clicking left mouse button to start my game
boolean start; //After players click their mouses, two rectangles go down and up, means begin
float startUp; //rectangle goes up
float startDown; //rectangle goes down
sky mysky;
int[] rectSkyX = { //array for X values of clouds
  500,600,750,810,1400,1450,1800,1900,2100,2300,2300,2400,2700
};
int[] rectSkyY = { //array for Y values of clouds
  20,370,60,300,80,350,260,20,380,200,300,370,180
};

void setup(){
 size(400,400); 
 start = false;
 teXt = true; //in order to show the text: click mouse
 mysky = new sky(0,0,-0.1,0,-1,0); //0 is adding 0.1 all the time, 0.1 is adding 1 all the time (negative number)
}
void draw(){
 mysky.update(); //running clouds moving
 mysky.display(); //draw clouds
 stroke(0);
 fill(100);
 rect(0,startUp,width,height/2);
 rect(0,200+startDown,width,height/2);
 fill(0,255,0);
 if(teXt){
 textSize(20);
 text("Click mouse to start the game",20,20);
 }
 if(start){
  startUp = startUp - 2;
  startDown = startDown + 2;
  if(startUp == -200){
    start = false;
    //Game start, new booleans will be put here.
  }
 }
}
void mousePressed(){
 start = true;
 teXt = false;
}
