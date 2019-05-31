abstract class Enemy extends Living{
  Enemy(float X, float Y, float life, float speed, float maxLife, float maxSpeed){
     super(X,Y,life,speed,maxLife,maxSpeed);
  }
  abstract void move();
  abstract void display();
  abstract void attack();
  abstract void takeDamage(float d);
  //abstract boolean isDamaged();
}
class testCircle extends Enemy{
  int[] attbehavior;
  testCircle(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab){
    super(X,Y,life,speed,maxLife,maxSpeed);
    radius=15;
    attbehavior=ab;
  }
  void move(){
    y+=spd;
  }
  void display(){
    fill(0);
    ellipse(x,y,radius*2,radius*2);
  }
  void attack(){
    if(attbehavior[0]>0){
      shootDown();
    }
    if(attbehavior[1]>0){
      createRings(attbehavior[1]);
    }
    if(attbehavior[2]>0){
      aimShot(attbehavior[2],human);
    }
  }
  void shootDown(){
    enemyproj.add(new Bullet(this.x,this.y,1,0,5+spd,10));
    enemyproj.add(new Bullet(this.x,this.y,1,5,5+spd,10));
    enemyproj.add(new Bullet(this.x,this.y,1,-5,5+spd,10));
  }
  void createRings(int num){
    for(int i=0;i<num;i++){
      enemyproj.add(new hoverBullet(x+100*cos(radians(i*360.0/num)),y+100*sin(radians(i*360.0/num)),1,10,0,this));
    }
  }
  void aimShot(int num,Living t){
    for(int i=0;i<num;i++){
      enemyproj.add(new aimBullet(x+75*cos(radians(i*360/num)),y+75*sin(radians(i*360/num)),1,10,0,this,t)); 
    }
  }
  void takeDamage(float d){
    health-=d;
  }
}
