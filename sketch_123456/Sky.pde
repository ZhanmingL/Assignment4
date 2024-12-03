class sky{
  PVector position;
  PVector velocity;
  PVector acceleration; //main elements of PVectors

  
sky(float x,float y,float vx,float vy,float ax,float ay){
  position = new PVector(x,y);
  velocity = new PVector(vx,vy);
  acceleration = new PVector(ax,ay);
}

void update(){
  position.add(velocity);
  velocity.add(acceleration); //in order to move faster and faster
}

void display(){
 noStroke();
 fill(154, 253, 255);
 rect((position.x)%3000,0,3000,height); //one time of whole background of sky
 fill(255);
 for (int i = 0; i < rectSkyX.length; i++){ //put arrays including X and Y values into clouds
  for (int o = 0; o < rectSkyY.length; o++){
   ellipse(rectSkyX[i]+(position.x)%3000,rectSkyY[o]+(position.y)%3000 + random(-100,100),random(10,300),5);
 }
 }
}
}
