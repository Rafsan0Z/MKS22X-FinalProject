//This is for Enemies in level 2!./
float x,y,l,w,angle;
void setup(){
  size(500,500);
  x = 250; y = 250; l = 40; w = 40;angle = 1;
}

void draw(){
  background(255);
  rect(250,250,10,10);
  //angle++;
  if(angle >= 360){angle = 0;}
  keyPressed();
}

void keyPressed(){
  if(key == 'r'){     
     float c = cos(angle);
  pushMatrix();
  translate(250,250);
  rotate(PI/3.0);
  rect(0,0,10,10);
  popMatrix();
  angle++;
  }
}
