//boolean group!
boolean teXt; //Tell players that clicking left mouse button to start my game
boolean start; //After players click their mouses, two rectangles go down and up, means begin
boolean gameOver; //judgement for game ends
boolean reallyStart; //Draw harmful machines and players' character
boolean iAmTouched; //judgement for machines touch player
boolean gameWin; //judgement for winning condition

//variable group!
float startUp = 0; //rectangle goes up
float startDown = 0; //rectangle goes down
int scores = 0; //counting scores, 20 scores to win
int lengTh = 200; //length of health bar

//class claim group!
sky mySky; //use sky class
machine badMachine; //use machine class (enemy)
character myCharacter;

//array group!
int[] rectSkyX = { //array for X values of clouds
  500,600,750,810,1400,1450,1800,1900,2100,2300,2300,2400,2700
};
int[] rectSkyY = { //array for Y values of clouds
  20,370,60,300,80,350,260,20,380,200,300,370,180
};



void setup(){
 size(400,400); //if you see sky class you may find that there is also another background moving all the time, very very long rect, in order to show the strong airflow
 start = false;
 reallyStart = false; //game haven't started yet, so they shoule be false, waiting for mouse pressing
 iAmTouched = false; //machines haven't generated, so no touching now (before game starts)
 teXt = true; //in order to show the text: click mouse
 mySky = new sky(0,0,-0.1,0,-1,0); //0 is adding 0.1 all the time, 0.1 is adding 1 all the time (negative number)
 badMachine = new machine(0,0,-1, 0,-0.003,0); //machine moves from right to left
 myCharacter = new character(20,height/2,0,0); //generating player's character
}
void draw(){
 mySky.update(); //running clouds moving
 mySky.display(); //draw clouds
 
 
 stroke(0);
 fill(100);
 rect(0,startUp,width,height/2);
 rect(0,200+startDown,width,height/2); //before game starts, two rects cover the sky or game page
 fill(0,255,0);
 
 if(teXt){
 textSize(15);
 text("Do not fly over the screen or touch anything after 18 scores!",20,60);
 textSize(20);
 text("Protect your middle cabochon!",20,40);//tell player middle circle will be hurt and reduce health
 text("Click mouse to start the game",20,20);//tell players how to start the game
 }                                           //When game starts, boolean teXt = false, then it disappears
 
 //Most complicated part. It's the calculation of player's character(I use block now, I may change later) within two big blocks(badMachines)
 //If within, then boolean true! Then players lose health!!
 //position starts at right, so character's position.x should add a whole width
 //iAmTouched = true means it's available to reduce health bar's length
 if(myCharacter.position.x>width+badMachine.position.x && myCharacter.position.x<width+badMachine.position.x+50){
   if(myCharacter.position.y>badMachine.position.y && myCharacter.position.y<badMachine.position.y+80){
     iAmTouched = true;
   }else if(myCharacter.position.y>badMachine.position.y+250 && myCharacter.position.y<badMachine.position.y+80+250){
     iAmTouched = true;
 }
 }
 
 if(iAmTouched){ //initially, machines move slowly, so players receive longer time of losing health. Also, let them now how to play my game, lose lower health at the beginning
   lengTh -= 2;
   iAmTouched = false; //after touch machines, false to stop losing health.
 }
 if(scores >= 6){ //When scores come to 6, game starts to become more and more difficult
   if(myCharacter.position.x>width+badMachine.position.x && myCharacter.position.x<width+badMachine.position.x+50){
   if(myCharacter.position.y>badMachine.position.y && myCharacter.position.y<badMachine.position.y+80){ //I should keep judgements as well. Otherwise there were errors
     lengTh -= 6;
   }else if(myCharacter.position.y>badMachine.position.y+250 && myCharacter.position.y<badMachine.position.y+80+250){
     lengTh -= 6;
   }
  }
 }
 
 if(scores >= 10){ //Hahaha, half game pasts, let players face more difficult challenge!
   if(myCharacter.position.x>width+badMachine.position.x && myCharacter.position.x<width+badMachine.position.x+50){
   if(myCharacter.position.y>badMachine.position.y && myCharacter.position.y<badMachine.position.y+80){
     lengTh -= 15;
   }else if(myCharacter.position.y>badMachine.position.y+250 && myCharacter.position.y<badMachine.position.y+80+250){
     lengTh -= 15;
   }
  }
 }
 
 if(scores >= 18){ //OMG, this player is so mastered. Now, 2 more scores to win. No, win is not easy, only 1 touch to over!!
   if(myCharacter.position.x>width+badMachine.position.x && myCharacter.position.x<width+badMachine.position.x+50){
   if(myCharacter.position.y>badMachine.position.y && myCharacter.position.y<badMachine.position.y+80){
     lengTh -= 99999;
   }else if(myCharacter.position.y>badMachine.position.y+250 && myCharacter.position.y<badMachine.position.y+80+250){
     lengTh -= 99999;
   }
  }
 }
 //Really? You win my game? Ohhhhhhhhhh, you are very nice!
 
 if(reallyStart){
   badMachine.update();
   badMachine.display();
   myCharacter.update();
   myCharacter.display();
   //run functions from classes
   
   if(lengTh >= 0){ //If there is a length of health bar, then keep it
   fill(131, 76, 228);
   rect(0,360,lengTh,20); //Health Bar
   }else{ //If the length comes to zero, then ends the game
   gameOver = true;
 }
 }
 
 
 if(start){
  startUp = startUp - 2;
  startDown = startDown + 2; //control the 2 rects move up and down to show the game and screen(also sky)
  if(startUp == -200){
    start = false; //we don't want "start" anymore, leave it
    reallyStart = true; //run classes codes and functions, all elements start to work, then the game really start!
  }
 }
 if(gameOver){
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textSize(60);
  text("Game Over",60,200); //game over page covers the screen
  scores -= 999; //stop adding scores, otherwise there will be a bug
 }
 
 if(scores == 20){
  gameWin = true; //20 scores to win this game
 }
 if(gameWin){
   fill(254, 244, 51);
   rect(0,0,width,height);
   fill(0);
   textSize(26);
   text("You Win my Game, OMG so Great!",20,200); //game winning page covers the screen
 }
}
void mousePressed(){ //after mouse is pressed
 start = true; //game starts, put away the before game page
 teXt = false; //don't show the tutorial text from now
}
