Player human;
void setup(){
  size(1000,1000);
  human = new Player(500,960,100);
}

void draw(){
  background(255);
  human.display();
  human.move();
}

interface Displayable{
  void display();
}

interface Moveable{
  void move();
}

interface Damageable{}

abstract class Living implements Displayable,Moveable,Damageable{
  float x,y,health;
}

class Player extends Living{
  Player(float X, float Y, float life){
    x = X; y = Y; health = life;
  }
  void move(){
    if(keyPressed){
      if(keyCode == UP){y -= 1;}
      else if(keyCode == DOWN){y += 1;}
      else if(keyCode == RIGHT){x += 1;}
      else if(keyCode == LEFT){x -= 1;}
    }
  }
  void display(){
    fill(205);
    rect(x,y,40,40);
  }
}

//class Enemy extends Living{}

//class Boss extends Enemy{}

//class TankEnemy extends Enemy{}

//class Obstacle implements Displayable,Damageable{}

//class MovingObs extends Obstacle implements Moveable{}

//abstract class Projectile implements Moveable,Displayable{}

//class Bullets extends Projectile{}

//class Bombs extends Projectile{}

//abstract class Powerups implements Moveable,Displayable{}

//class Health extends Powerups{}
