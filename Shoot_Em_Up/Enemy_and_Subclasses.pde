abstract class Enemy extends Living{
  Enemy(float X, float Y, float life, float speed, float maxLife, float maxSpeed){
     super(X,Y,life,speed,maxLife,maxSpeed);
  }
  abstract void move();
  abstract void display();
  abstract void attack();
  abstract void takeDamage();
  //abstract boolean isDamaged();
}
class testCircle extends Enemy{
  testCircle(float X, float Y, float life, float speed, float maxLife, float maxSpeed){
    super(X,Y,life,speed,maxLife,maxSpeed);
  }
  void move(){
    
  }
  void display(){
    fill(0);
    ellipse(x,y,50,50);
  }
  void attack(){
    
  }
  void takeDamage(){
    
  }
}
