Triangle t1,t2,t3;
boolean release;
void setup(){
  size(500,500);
  t1 = new Triangle(240,280,260,280,250,290,0,-1);
  t2 = new Triangle(240,220,260,220,250,210,0,1);
  t3 = new Triangle(200,240,200,260,190,250,-1,0);
  Ts.add(t1);
  Ts.add(t2);
  Ts.add(t3);
  release = false;
}
ArrayList<Bullet> shapes = new ArrayList<Bullet>();
ArrayList<Triangle> Ts = new ArrayList<Triangle>();
void draw(){
  background(255);
  ellipse(250,250,60,30);
  for(Triangle t: Ts){
    t.display();
    if(release){t.move();}
  }
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

void keyPressed(){
  if(key == 'r'){release = true;}
}
