class Split{
  float x,y,times;
  Split(float X, float Y, float half){
    x = X; y = Y; times = half;
  }
  void display(){
    ellipse(x,y,20,20);
  }
  void divide(){
    group.add(new Split(x-50,y+30,times-1));
    group.add(new Split(x+50,y+30,times-1));
  }
  void move(){
    y++;
  }
}
