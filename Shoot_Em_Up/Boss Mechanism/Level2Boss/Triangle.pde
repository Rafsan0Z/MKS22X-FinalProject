class Triangle{
  float x1,y1,x2,y2,x3,y3,typex,typey;
  Triangle(float X1,float Y1,float X2,float Y2,float X3,float Y3,float Typex,float Typey){
    x1 = X1;y1 = Y1;x2 = X2;y2 = Y2;x3 = X3;y3 = Y3;typex = Typex;typey = Typey;
  }
  void display(){
    triangle(x1,y1,x2,y2,x3,y3);
  }
  void move(){
    y1 -= typey;
    y2 -= typey;
    y3 -= typey;
    x1 += typex;
    x2 += typex;
    x3 += typex;
  }
}
