target T;
void setup(){
  size(1000,1000);
  T = new target(500,500);
}

void draw(){
  background(255);
  fill(200);
  rect(500,800,20,20);
  T.display();
  T.move(mouseX,mouseY);
  T.fire();
}

class target{
  float x1,y1,x2,y2;
  float radius;
  float L;
  PVector center = new PVector(x1,y1+L+radius);
  float s = 1;
  target(float X1,float Y1){
    x1=X1;y1=Y1;radius=10;L=50;
    setCenter();
  }
  void display(){
    line(x1,y1,x1,y1+L);
    line(x1,y1+2*radius+L,x1,y1+2*radius+2*L);
    line(x1-L-radius,y1+L+radius,x1-radius,y1+L+radius);
    line(x1+radius,y1+L+radius,x1+L+radius,y1+L+radius);
    ellipse(x1,y1+L+radius,radius,radius);
    strokeWeight(s);
    line(510,800,center.x,center.y);
  }
  void move(float x,float y){
    x1=x;y1=y;
    center.x=x1;
    center.y=y1+L+radius;
  }
  void setCenter(){
    center = new PVector(x1,y1+L+radius);
  }
  void fire(){
    if(mousePressed){s = 10;}
    else{s=1;}
  }
}
