class sky{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
sky(float x,float y,float vx,float vy,float ax,float ay){
  position = new PVector(x,y);
  velocity = new PVector(vx,vy);
  acceleration = new PVector(ax,ay);
}

void update(){
  position.add(velocity);
  velocity.add(acceleration);
}

void display(){
 noStroke();
 fill(154, 253, 255);
 rect((position.x)%3000,0,3000,height);
}
}
