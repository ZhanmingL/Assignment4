class character{
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector accelerationGravity;
  
character(float x, float y, float vx, float vy){
  position = new PVector(x,y);
  velocity = new PVector(vx,vy);
  acceleration = new PVector(0,0);
  accelerationGravity = new PVector(0,0);
}

void update(){
  position.add(velocity);
  velocity.add(acceleration);
  
  if (keyPressed){
   if(key == 'w'){
     position.y -= 2;
   }else if(key == 's'){
     position.y += 2;
   }
  }
}
  
void display(){
  fill(150);
  rect(position.x, position.y + velocity.y,50,50);
  fill(251, 84, 41);
  rect(10+position.x, 10+position.y + velocity.y,20,20);
}

  
}
