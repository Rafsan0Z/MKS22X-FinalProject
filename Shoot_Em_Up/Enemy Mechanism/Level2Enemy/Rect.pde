class Rect{
  float x,y,l,w;
  Rect(float X,float Y,float L,float W){
    x = X;y = Y;l = L;w = W;
  }
  void display(){
    fill(155);
    pushMatrix();
    translate(x,y);
    rotate(counter*TWO_PI/360);
    rect(0,0,20,20);
    popMatrix();
  }
  void move(){
    y += 1;
  }
}
