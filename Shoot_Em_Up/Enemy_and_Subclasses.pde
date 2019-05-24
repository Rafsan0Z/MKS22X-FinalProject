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
    //y+=spd;
  }
  void display(){
    fill(0);
    ellipse(x,y,radius*2,radius*2);
  }
  void attack(){
    //shootDown();
    createRings();
  }
  void shootDown(){
    enemyproj.add(new Bullet(this.x,this.y,1,0,5+spd,10));
    enemyproj.add(new Bullet(this.x,this.y,1,5,5+spd,10));
    enemyproj.add(new Bullet(this.x,this.y,1,-5,5+spd,10));
  }
  void createRings(){
    for(int i=0;i<10;i++){
      enemyproj.add(new Bullet(x+100*cos(radians(i*36)),y+100*sin(radians(i*36)),1,0,3+spd,10));
    }
  }
  void takeDamage(){
    
  }
}
