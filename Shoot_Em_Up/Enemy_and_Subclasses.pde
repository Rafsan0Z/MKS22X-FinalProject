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
  int delay,period;
  testCircle(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab){
    super(X,Y,life,speed,maxLife,maxSpeed);
    radius=15;
    attbehavior=ab;
    delay = 0;
    period = 60;
  }
  testCircle(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab, int _delay){
    super(X,Y,life,speed,maxLife,maxSpeed);
    radius=15;
    attbehavior=ab;
    delay = _delay;
    period = 60;
  }
  testCircle(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab, int _delay, int _p){
    super(X,Y,life,speed,maxLife,maxSpeed);
    radius=15;
    attbehavior=ab;
    delay = _delay;
    period = _p;
  }
  void move(){
    y+=spd;
  }
  void display(){
    fill(0);
    ellipse(x,y,radius*2,radius*2);
  }
  void attack(){
    if((frameCount-fci)%period==delay){
      if(attbehavior[0]>0){
        shootDown(attbehavior[0]);
      }
      if(attbehavior.length>1&&attbehavior[1]>0){
        createRings(attbehavior[1]);
      }
      if(attbehavior.length>2&&attbehavior[2]>0){
        aimShot(attbehavior[2],human);
      }
      if(attbehavior.length>5&&attbehavior[5]>0&&(attbehavior[3]>0||attbehavior[4]>0)){
       shootDown2(attbehavior[3],attbehavior[4],attbehavior[5]);
      }
      if(attbehavior.length>7&&attbehavior[6]>0){
        hoverRings(attbehavior[6],attbehavior[7]);
      }
    }
  }
  void shootDown(int dy){
     enemyproj.add(new Bullet(this.x,this.y,1,0,dy+spd,10));
  }
  void shootDown2(int dx, int dy, int size){

    enemyproj.add(new Bullet(this.x,this.y,1,dx,dy+spd,size));
    enemyproj.add(new Bullet(this.x,this.y,1,-dx,dy+spd,size));
  }
  void createRings(int num){
    for(int i=0;i<num;i++){
      enemyproj.add(new hoverBullet(x+100*cos(radians(i*360.0/num)),y+100*sin(radians(i*360.0/num)),1,10,0,this));
    }
  }
  void aimShot(int num,Living tar){
    for(int i=0;i<num;i++){
      enemyproj.add(new aimBullet(x+75*cos(radians(i*360/num)),y+75*sin(radians(i*360/num)),1,10,0,this,tar));
    }
  }
  void hoverRings(int num, int t){
    for(int i=0;i<num;i++){
      enemyproj.add(new hoverBullet(x+100*cos(radians(i*360.0/num)),y+100*sin(radians(i*360.0/num)),1,10,0,this,-t));
    }
  }
  void takeDamage(float d){
    health-=d;
  }
}

class rotate extends testCircle{
  float counter = 0;
  rotate(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab){
    super(X,Y,life,speed,maxLife,maxSpeed,ab);
  }
  rotate(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab, int _delay){
    super(X,Y,life,speed,maxLife,maxSpeed,ab,_delay);
  }
  rotate(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab, int _delay, int _p){
    super(X,Y,life,speed,maxLife,maxSpeed,ab,_delay,_p);
  }
  void display(){
    counter++;
    fill(0);
    pushMatrix();
    translate(x,y);
    rotate(counter*TWO_PI/360);
    rect(0,0,20,20);
    popMatrix();
  }
}

class zigzag extends testCircle{
   float horiz = 5,factor = -1;
   zigzag(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab){
    super(X,Y,life,speed,maxLife,maxSpeed,ab);
  }
  zigzag(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab, int _delay){
    super(X,Y,life,speed,maxLife,maxSpeed,ab,_delay);
  }
  zigzag(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab, int _delay, int _p){
    super(X,Y,life,speed,maxLife,maxSpeed,ab,_delay,_p);
  }
  void move(){
      x -= factor;
      horiz += factor;
      if(horiz == 0){factor *= -1;}
      if(horiz > 50){factor *= -1;}
      super.move();
  }
}

class hide extends testCircle{
  hide(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab){
    super(X,Y,life,speed,maxLife,maxSpeed,ab);
  }
  hide(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab, int _delay){
    super(X,Y,life,speed,maxLife,maxSpeed,ab,_delay);
  }
  hide(float X, float Y, float life, float speed, float maxLife, float maxSpeed, int[] ab, int _delay, int _p){
    super(X,Y,life,speed,maxLife,maxSpeed,ab,_delay,_p);
  }
  void move(){x += spd;}
}
