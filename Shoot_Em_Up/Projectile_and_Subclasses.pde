abstract class Projectile implements Moveable,Displayable{
  float x,y,damage;
  Projectile(float X, float Y, float Dam){
    x = X; y = Y; damage = Dam;
  }
  abstract boolean isTouching(Living other);
}

class Bullets extends Projectile{
  float dx, dy, radius;
  Bullets(float X, float Y, float Dam, float _dx, float _dy, float r){
    super(X,Y,Dam);
    dx=_dx;
    dy=_dy;
    radius=r;
  }
  void display(){
    fill(175);
    ellipse(x,y,radius*2,radius*2);
  }
  void move(){
    y += dy;
    x += dx;
  }
  boolean isTouching(Living other){
    return sqrt(sq(this.x-other.x)+sq(this.y-other.y))
    <=this.radius+other.radius;
  }
}

class Bombs extends Projectile{
  Bombs(float X, float Y, float Dam){super(X,Y,Dam);}
  void display(){
   fill(0,(int)(Math.random()*256),0);
   rect(x,y,15,15);
  }
  void move(){y -= 30;}
  boolean isTouching(Living other){
   return false; 
  }
}
