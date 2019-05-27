void setup(){
  size(500,500);
}
ArrayList<Bullet> shapes = new ArrayList<Bullet>();
void draw(){
  background(255);
  ellipse(250,250,60,30);
  triangle(240,280,260,280,250,290);
  triangle(240,220,260,220,250,210);
  //triangle();
  fire();
  for(Bullet b: shapes){
    b.display();
    b.move();
  }
}

void fire(){
  if(keyPressed && key == 'a'){
    shapes.add(new Bullet(250,210,0));
  }
  if(keyPressed && key == 'd'){
    shapes.add(new Bullet(250,290,1));
  }
}
