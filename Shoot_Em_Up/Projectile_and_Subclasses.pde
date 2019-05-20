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
    ellipse(x,y,10,10);
  }
  void move(){
    y -= 1;
  }
  
}

class Bombs extends Projectile{
  Bombs(float X, float Y, float Dam){super(X,Y,Dam);}
  void display(){
   fill(0,(int)(Math.random()*256),0);
   rect(x,y,15,15);
  }
  void move(){y -= 30;}
}
