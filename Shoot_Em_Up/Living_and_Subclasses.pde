abstract class Living implements Displayable,Moveable,Damageable{
  float x,y,health,spd,maxHealth,maxSpd,radius;
  Living(float X, float Y, float life, float speed, float maxLife, float maxSpeed){
    x = X; 
    y = Y; 
    health = life; 
    spd=speed;
    maxHealth = maxLife;
    maxSpd = maxSpeed;
  }
  boolean isTouching(Living other){
    return dist(x,y,other.x,other.y)
    <=this.radius+other.radius;
  }
  boolean isTouchingRect(float rx, float ry, float rw, float rh){
    float checkX = x;
    float checkY = y;
    if(x<rx){
       checkX=rx; 
    }
    else if(x > rx+rw){
       checkX=rx+rw; 
    }
    if(y<ry){
       checkY=ry; 
    }
    if(y>ry+rh){
       checkY=ry+rh; 
    }
    return dist(x,y,checkX,checkY)<=radius;
  }
}

class Player extends Living{
   Player(float X, float Y, float life, float speed, float maxLife, float maxSpeed){
     super(X,Y,life,speed,maxLife,maxSpeed);
     radius=10;
  }
  //new constuctor includes spd,maxHealth,maxSpd
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
    /*fill(205);
    rect(x,y,40,40);
    fill(100,0,0);
    rect(x,y-15,10,15);
    fill(100,0,0);
    rect(x+30,y-15,10,15);
    */
    
    if(s){
    fill(120,120,120,50);
    ellipse(x,y,radius*3,radius*3);
    fill(255,0,0);
    ellipse(x,y,radius*2,radius*2);
    }
    else{
    fill(120);
    ellipse(x,y,radius*4,radius*4);
    }
  }
  void attack(){
    if(f&&frameCount%5==0){
      playerproj.add(new Bullet(x,y,1,0,-10,15)); 
    }
  }
}
