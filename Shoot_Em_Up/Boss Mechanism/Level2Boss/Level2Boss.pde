Triangle t1,t2,t3;
boolean release;
float a,b,x,y;
void setup(){
  size(500,500);
  a = 60;b = 30;x=250;y=250;
  Ts.add(new Triangle(x-10,y+b/2,x+10,y+b/2,x,y+20+b/2,0,-1));
  Ts.add(new Triangle(x-10,y-b/2,x+10,y-b/2,x,y-20-b/2,0,1));
  Ts.add(new Triangle(x-a/2,y-10,x-a/2,y+10,x-20-a/2,y,-1,0));
  Ts.add(new Triangle(x+a/2,y-10,x+a/2,y+10,x+20+a/2,y,1,0));
  release = false;
}
ArrayList<Bullet> shapes = new ArrayList<Bullet>();
ArrayList<Triangle> Ts = new ArrayList<Triangle>();
void draw(){
  background(255);
  ellipse(x,y,a,b);
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
