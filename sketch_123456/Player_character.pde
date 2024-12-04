class character{
  PVector position;
  PVector velocity;
  PVector acceleration; //gravity of character
  
character(float x, float y, float vx, float vy){
  position = new PVector(x,y);
  velocity = new PVector(vx,vy);
  acceleration = new PVector(0,0.01);
}

void update(){
  position.add(velocity);
  velocity.add(acceleration);
  
  if(keyPressed){
   if(key == 'w'){
     velocity.y -= 0.05;
   }else if(key == 's'){
     velocity.y += 0.02;
   }
  }
  if(position.y > height/2 + 200 || position.y < height/2 - 220){
   gameOver = true;
  }
}
  
void display(){
  fill(251, 84, 41);
  rect(position.x, position.y + velocity.y,20,20);
}

  
}
