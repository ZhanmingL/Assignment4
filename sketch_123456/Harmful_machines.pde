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
  scores += 1;
  }
}

void display(){
  fill(100);
  rect(width + position.x % width, 0 + position.y % height, 50, 80);
  rect(width + position.x % width, 250 + position.y % height, 50, 80);
  fill(153, 73, 176);
  textSize(20);
  text("You own " + scores + " score(s)",220,375);

 }
}
