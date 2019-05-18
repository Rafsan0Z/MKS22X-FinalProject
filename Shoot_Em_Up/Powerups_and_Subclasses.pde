abstract class Powerups implements Moveable,Displayable{
  float x,y;
  Powerups(Float X, Float Y){x = X; y = Y;}
  void display(){
    fill(0,105,0);
    ellipse(x,y,40,40);
  }
  void move(){
    y += 1;
  }
}

class Health extends Powerups{
  float health;
  Health(float X, float Y, float life){
    super(X,Y);
    health = life;
  }
  void display(){
    super.display();
    fill(0,200,0);
    rect(x-7.5,y-2.5,15,5);
    fill(0,200,0);
    rect(x-2.5,y-7.5,5,15);
  }
}
