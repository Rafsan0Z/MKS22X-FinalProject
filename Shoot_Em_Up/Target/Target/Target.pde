target T;
void setup(){
  size(1000,1000);
  T = new target(500,500);
}

void draw(){
  background(255);
  T.display();
}

class target{
  float x1,y1,x2,y2;
  float radius;
  float L;
  target(float X1,float Y1){
    x1=X1;y1=Y1;radius=10;L=50;
  }
  void display(){
    line(x1,y1,x1,y1+L);
    line(x1,y1+2*radius+L,x1,y1+2*radius+2*L);
    line(x1-L-radius,y1+L+radius,x1-radius,y1+L+radius);
    line(x1+radius,y1+L+radius,x1+L+radius,y1+L+radius);
  }
  void move(){
  }
}
