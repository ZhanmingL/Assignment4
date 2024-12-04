class machine{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
machine(float x, float y, float vx, float vy, float ax, float ay){
  position = new PVector(x,y);
  velocity = new PVector(vx,vy);
  acceleration = new PVector(ax,ay);
}
  
void update(){
  position.add(velocity);
  velocity.add(acceleration);
  if(position.x < -400){
  position.x = width;
  position.y = random(0, height - 80);
  }
}

void display(){
  fill(100);
  rect(width + position.x % width, -200 + position.y % height, 50, 300);
  rect(width + position.x % width, 200 + position.y % height, 50, 300);
}
  
  
  
  
}
