class Rect implements Displayable{
  float x,y,Long,Tall;
  float Color;
  Rect(float X, float Y, float Width, float Height){
    x = X; y = Y; Long = Width; Tall = Height;
    Color = red(color(255,204,0));
  }
  void changeColor(){
    
  }
  void display(){
    fill(Color,0,0);
    rect(x,y,Long,Tall);
  }
}
