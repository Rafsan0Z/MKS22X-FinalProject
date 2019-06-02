class Obstacle implements Displayable,Damageable{
float x,y,radius;
Obstacle(float X, float Y, float Rad){
  x = X; y = Y; radius = Rad;
}
void display(){
  fill(140);
  rect(x,y,x+2*radius,y+2*radius);
}
  boolean isTouching(Living other){
    return dist(x,y,other.x,other.y) <=this.radius+other.radius;
  }
}

class MovingObs extends Obstacle implements Moveable{
  MovingObs(float X, float Y, float Rad){
    super(X,Y,Rad);
  }
  void move(){
    y += 1;
  }
}
