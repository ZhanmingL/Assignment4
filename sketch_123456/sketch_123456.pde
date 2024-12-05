//boolean group!
boolean teXt; //Tell players that clicking left mouse button to start my game
boolean start; //After players click their mouses, two rectangles go down and up, means begin
boolean gameOver; //judgement for game ends
boolean reallyStart; //Draw harmful machines and players' character
boolean iAmTouched; //judgement for machines touch player
boolean gameWin; //judgement for winning condition
boolean gameRestart; //restart a game when win or lose

//variable group!
float startUp = 0; //rectangle goes up
float startDown = 0; //rectangle goes down
int scores = 0; //counting scores, 20 scores to win
int lengTh = 180; //length of health bar

//class claim group!
sky mySky; //use sky class
machine badMachine; //use machine class (objects to reduce health)
character myCharacter; //player

//array group!
int[] rectSkyX = { //array for X values of clouds
  500,600,750,810,1400,1450,1800,1900,2100,2300,2300,2400,2700
};
int[] rectSkyY = { //array for Y values of clouds
  20,370,60,300,80,350,260,20,380,200,300,370,180
};



void setup(){
 size(400,400); //if you see sky class you may find that there is also another background moving all the time, very very long rect, in order to show the strong airflow
 
 start = false; //waiting for start
 reallyStart = false; //game haven't started yet, so they shoule be false, waiting for mouse pressing
 iAmTouched = false; //machines haven't generated, so no touching now (before game starts)
 teXt = true; //in order to show the text: click mouse
 gameRestart = false; //game not restart yet
 gameWin = false; //not win yet
 gameOver = false;//not lose yet
 
 mySky = new sky(0,0,-0.1,0,-1,0); //0 is adding 0.1 all the time, 0.1 is adding 1 all the time (negative number)
 badMachine = new machine(0,0,-1, 0,-0.003,0); //machine moves from right to left
 myCharacter = new character(20,height/2,0,0); //generating player's character
 
 println("Hold w or s to move up and down"); //text tutorial
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
 text("Do not fly over the screen or touch rectangles after 18 scores!",16,60);
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
   fill(255, 26, 26,100);
   rect(0,0,width,height); //effect of losing health
 }
 if(scores >= 6){ //When scores come to 6, game starts to become more and more difficult
   if(myCharacter.position.x>width+badMachine.position.x && myCharacter.position.x<width+badMachine.position.x+50){
   if(myCharacter.position.y>badMachine.position.y && myCharacter.position.y<badMachine.position.y+80){ //I should keep judgements as well. Otherwise there were errors
     lengTh -= 8;
   }else if(myCharacter.position.y>badMachine.position.y+250 && myCharacter.position.y<badMachine.position.y+80+250){
     lengTh -= 8;
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
   myCharacter.update();
   myCharacter.display();
   badMachine.update();
   badMachine.display();
   //run functions from classes
   
   if(lengTh >= 0){ //If there is a length of health bar, then keep it
   fill(131, 76, 228);
   rect(20,360,lengTh,20); //Health Bar
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
  textSize(30);
  text("Press G to try again!",65,250);
  scores -= 999; //stop adding scores, otherwise there will be a bug
  
  reallyStart = false; //stop class still updating
  
  if(keyPressed){
   if(key == 'g'){
     gameRestart = true; //click G key to activate this boolean - reset everything
   }
  }
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
   textSize(40);
   text("Press G to play again!",20,250); //tell players how to restart game again
   
  reallyStart = false; //stop class still updating
  
  if(keyPressed){
   if(key == 'g'){
     gameRestart = true; //restart by G
   }
  }
 }
 
 if(gameRestart){ //OK, this is how a new game comes
   gameOver = false; //turn off gameOver content
   gameWin = false; //turn off gameWin content
   scores = 0; //reset score
   lengTh = 180; //reset health bar
   
   myCharacter.position.x = 20; //reset all class values
   myCharacter.position.y = height/2;
   myCharacter.velocity.x = 0;
   myCharacter.velocity.y = 0;
   
   badMachine.position.x = 0;
   badMachine.position.y = 0;
   badMachine.velocity.x = -1;
   badMachine.velocity.y = 0;
   badMachine.acceleration.x = -0.003;
   badMachine.acceleration.y = 0;
   
   mySky.position.x = 0;
   mySky.position.y = 0;
   mySky.velocity.x = -0.1;
   mySky.velocity.y = 0;
   mySky.acceleration.x = -1;
   mySky.acceleration.y = 0;
   
   reallyStart = true; //all class calues are reset successfully! Then we can continue updating values
   gameRestart = false; // Everything is done! Stop this to release variables like scores and lengTh... Because like if gameRestart == true, scores always be zero
  } 
 }
 

void mousePressed(){ //after mouse is pressed
 start = true; //game starts, put away the before game page
 teXt = false; //don't show the tutorial text from now
}


//Frankly, I think my codes are a bit easy and complicating. I checked codes format that I forgot on the website"processing.org"
