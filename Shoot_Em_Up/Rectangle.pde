/*float health = 1000;
float MAX_HEALTH = health;
*/
float rectWidth = 300;
class Rect implements Displayable{
  float x,y,Long,Tall;
  float Color;
  Rect(float X, float Y, float Width, float Height){
    x = X; y = Y; Long = Width; Tall = Height;
    Color = red(color(255,204,0));
  }
  void display(){
  //background(255);
  fill(human.health*1.5,0,0);
  noStroke();
  float drawWidth = (human.health / human.maxHealth) * rectWidth;
  rect(width-300, 120, drawWidth, 25);
  stroke(0);
  noFill();
  rect(width-300, 120, rectWidth, 25);
  }
  boolean isTouching(Living other){
     return false; 
  }
}
