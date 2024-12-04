class character{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
character(float x, float y, float vx, float vy){
  position = new PVector(x,y);
  velocity = new PVector(vx,vy);
  acceleration = new PVector(0,0.01);
}

void update(){
  position.add(velocity);
  velocity.add(acceleration);
  
  if (keyPressed){
   if(key == 'w'){
     velocity.y -= 0.05;
   }else if(key == 's'){
     velocity.y += 0.02;
   }
  }
}
  
void display(){
  fill(251, 84, 41);
  rect(position.x, position.y + velocity.y,20,20);
}

  
}
