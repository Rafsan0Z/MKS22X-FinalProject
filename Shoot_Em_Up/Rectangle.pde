float health = 1000;
float MAX_HEALTH = health;
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
  fill(health*1.5,0,0);
  noStroke();
  float drawWidth = (health / MAX_HEALTH) * rectWidth;
  rect(width-340, 150, drawWidth, 25);
  stroke(0);
  noFill();
  rect(width-340, 150, rectWidth, 25);
  }
  void change(){
    if (health > 0 && key == 'a')
  {
    health -= 1;
  }
  if (health < MAX_HEALTH && key == 'b')
  {
    health += 1;
  }
  if(key == 'g' && health < MAX_HEALTH){
    if(health + 50 > MAX_HEALTH){health = MAX_HEALTH;}
    else{health += 50;}
  }
  if(key == 'n' && health > 0){
    if(health - 50 < 0){health = 0;}
    else{health -= 50;}
  }
  }
}
