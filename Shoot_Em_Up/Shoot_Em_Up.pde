void setup(){}

void draw(){}

interface Displayable{}

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
    if(keyPressed && key == RIGHT){y -= 1;}
  }
}

class Enemy extends Living{}

class Boss extends Enemy{}

class TankEnemy extends Enemy{}

class Obstacle implements Displayable,Damageable{}

class MovingObs extends Obstacle implements Moveable{}

abstract class Projectile implements Moveable,Displayable{}

class Bullets extends Projectile{}

class Bombs extends Projectile{}

abstract class Powerups implements Moveable,Displayable{}

class Health extends Powerups{}
