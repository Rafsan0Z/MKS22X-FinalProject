boolean clicked = false;
Player human;
ArrayList<Projectile> shoot = new ArrayList<Projectile>();
void setup(){
  size(1000,1000);
  human = new Player(500,960,100);
}

void draw(){
  background(255);
  human.display();
  human.move();
  human.attack();
  for(Projectile p: shoot){
    p.move();
    p.display();
  }
}

void mouseClicked(){
  if(mousePressed && !clicked){clicked = true;}
  else{clicked = false;}
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
    fill(100,0,0);
    rect(x,y-15,10,15);
    fill(100,0,0);
    rect(x+30,y-15,10,15);
  }
  void attack(){
    if(mousePressed){
      Bombs fire = new Bombs(x+12.7,y,10);
      shoot.add(fire);
    }
  }
}

//class Enemy extends Living{}

//class Boss extends Enemy{}

//class TankEnemy extends Enemy{}

//class Obstacle implements Displayable,Damageable{}

//class MovingObs extends Obstacle implements Moveable{}

abstract class Projectile implements Moveable,Displayable{
  float x,y,damage;
  Projectile(float X, float Y, float Dam){
    x = X; y = Y; damage = Dam;
  }
}

class Bullets extends Projectile{
  Bullets(float X, float Y, float Dam){super(X,Y,Dam);}
  void display(){
    fill(175);
    rect(x,y,5,15);
  }
  void move(){
    y -= 1;
  }
  
}

class Bombs extends Projectile{
  Bombs(float X, float Y, float Dam){super(X,Y,Dam);}
  void display(){
   fill((int)(Math.random()*256),0,0);
   rect(x,y,15,15);
  }
  void move(){y -= 1;}
}

//abstract class Powerups implements Moveable,Displayable{}

//class Health extends Powerups{}
