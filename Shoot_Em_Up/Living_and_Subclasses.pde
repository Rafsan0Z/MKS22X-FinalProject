abstract class Living implements Displayable,Moveable,Damageable{
  float x,y,health,spd,maxHealth,maxSpd;
  Living(float X, float Y, float life, float speed, float maxLife, float maxSpeed){
    x = X; 
    y = Y; 
    health = life; 
    spd=speed;
    maxHealth = maxLife;
    maxSpd = maxSpeed;
  }
}

class Player extends Living{
   Player(float X, float Y, float life, float speed, float maxLife, float maxSpeed){
     super(X,Y,life,speed,maxLife,maxSpeed);
  }
  //new constuctor includes spd,maxHealth,maxSpd
  /*
  Player(float X, float Y, float life){
    x = X; y = Y; health = life;
  }
  */
  void move(){
    /*if(keyPressed){
      if(keyCode == UP){y -= 1;}
      if(keyCode == DOWN){y += 1;}
      if(keyCode == RIGHT){x += 1;}
      if(keyCode == LEFT){x -= 1;}
    }*/
    if(s){
      spd=maxSpd/2;
    }
    else{
      spd=maxSpd; 
    }
    if(mu){
      y-=spd;
    }
    if(ml){
      x-=spd;
    }
    if(mr){
      x+=spd;
    }
    if(md){
      y+=spd;
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
    if(f){
      Bombs fire = new Bombs(x+12.7,y,10);
      shoot.add(fire); 
    }
  }
}

//class Enemy extends Living{}

//class Boss extends Enemy{}

//class TankEnemy extends Enemy{}
