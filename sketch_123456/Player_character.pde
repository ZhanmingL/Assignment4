class character{
  PVector position;
  PVector velocity;
  PVector acceleration; //gravity of character
  
character(float x, float y, float vx, float vy){
  position = new PVector(x,y);
  velocity = new PVector(vx,vy);
  acceleration = new PVector(0,0.01); //let the players always have gravity towards down, make the game more interesting!
}

void update(){
  position.add(velocity); //velocity lets players move up and down
  velocity.add(acceleration); //acceleration lets players move downward automatically
  
  if(keyPressed){ //'w' and 's' control character moves up and down
   if(key == 'w'){
     velocity.y -= 0.05;
   }else if(key == 's'){
     velocity.y += 0.02; //based on my evaluation, downwards is more suitable for slower move. Because there is also a gravity force 
   }
  }
  if(position.y > height/2 + 200 || position.y < height/2 - 220){
   gameOver = true; //if players want to cheat? no way! game over !!! (out of screen)
                    //Also limit their movements
  }
}
  
 void display(){
  fill(251, 84, 41);
  rect(position.x, position.y + velocity.y,20,20); //draw the character
 }  
}
