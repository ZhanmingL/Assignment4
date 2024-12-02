boolean teXt;
boolean start;
float startUp;
float startDown;
void setup(){
 size(400,400); 
 start = false;
 teXt = true;
}
void draw(){
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
