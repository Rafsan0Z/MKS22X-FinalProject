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
    radius=25;
  }
  void move(){
    
  }
  void display(){
    fill(0);
    ellipse(x,y,radius*2,radius*2);
  }
  void attack(){
    shoot.add(new Bullets(this.x,this.y,1,0,5,10));
    shoot.add(new Bullets(this.x,this.y,1,5,5,10));
    shoot.add(new Bullets(this.x,this.y,1,-5,5,10));
  }
  void takeDamage(){
    
  }
}
