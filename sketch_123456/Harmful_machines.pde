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
  velocity.add(acceleration); //x value (horizontally) moves faster and faster
  if(position.x < -400){ //reset two machines after they reach the left
  position.x = width; //come back to the right
  position.y = random(0, height - 80); //randomly regenerate two machines, different vertical positions
  scores += 1; //counts for one score!
  }
}

void display(){
  fill(146, 39, 150);
  rect(width + position.x % width, 0 + position.y % height, 50, 80);
  rect(width + position.x % width, 250 + position.y % height, 50, 80); //draw two bad machines
  fill(253, 54, 23);
  ellipse(width + position.x % width, 0 + position.y % height, 50, 80);
  ellipse(width + position.x % width, 250 + position.y % height, 50, 80); //bad machines components
  fill(153, 73, 176);
  textSize(20);
  text("You own " + scores + " score(s)",220,375); //tell players how many scores do they have
 }
}
