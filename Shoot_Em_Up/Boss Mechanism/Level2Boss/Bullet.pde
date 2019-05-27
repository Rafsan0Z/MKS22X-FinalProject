class Bullet{
  float x,y,type;
  Bullet(float X, float Y, float Type){
    x = X; y = Y;type = Type;
  }
  void move(){
    if(type == 0){y -= 1;}
    else if(type == 1){y += 1;}
  }
  void display(){
    rect(x,y,10,10);
  }
}
