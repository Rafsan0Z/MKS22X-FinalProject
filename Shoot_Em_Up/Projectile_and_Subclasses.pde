abstract class Projectile implements Moveable,Displayable{
  float x,y,damage;
  Projectile(float X, float Y, float Dam){
    x = X; y = Y; damage = Dam;
  }
  abstract boolean isTouching(Living other);
  abstract boolean isOffScreen();
  abstract boolean isTouchingRect(float rx, float ry, float rw, float rh);
}

class Bullet extends Projectile{
  float dx, dy, radius;
  Bullet(float X, float Y, float Dam, float _dx, float _dy, float r){
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
    return dist(x,y,other.x,other.y)
    <=this.radius+other.radius;
  }
  boolean isOffScreen(){
     return x+radius < 0 || x-radius > width || y+radius < 0 || y-radius > height; 
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

abstract class advBullet extends Bullet{
   int state,starttime;
   Living src;
   advBullet(float X, float Y, float Dam, float _dx, float _dy, float r, int _state, Living source){
     super(X,Y,Dam,_dx,_dy,r);
     state = _state;
     src = source;
     starttime=frameCount;
   }
}

class aimBullet extends advBullet{
   float targetIniX, targetIniY;
   Living target;
   aimBullet(float X, float Y, float Dam, float r, int _state, Living source,Living _target){
     super(X,Y,Dam,0,0,r,_state,source);
     target=_target;
     targetIniX=target.x;
     targetIniY=target.y;
     dx=-(x-targetIniX)/100.0;
     dy=-(y-targetIniY)/100.0;
   }
   void move(){
     dx*=(1.01);
     dy*=(1.01);
     y+=dy;
     x+=dx;
   }
}

class hoverBullet extends advBullet{
   float srcIniX, srcIniY;
   hoverBullet(float X, float Y, float Dam, float r, int _state, Living source){
     super(X,Y,Dam,0,0,r,_state,source); 
     srcIniX=src.x;
     srcIniY=src.y;
   }
   void move(){
     if(state>0){
       dx=(x-srcIniX)/100;
       dy=(y-srcIniY)/100;
       //dx=(x-src.x)/dist(x,y,src.x,src.y);
       //dy=(y-src.y)/dist(x,y,src.x,src.y);
     }
     else{
       if(frameCount>starttime+60){
          state++; 
       }
     }
     y+=dy;
     x+=dx;
  }
}


/*class Bombs extends Projectile{
  Bombs(float X, float Y, float Dam){super(X,Y,Dam);}
  void display(){
   fill(0,(int)(Math.random()*256),0);
   rect(x,y,15,15);
  }
  void move(){y -= 30;}
  boolean isTouching(Living other){
   return false; 
  }
}*/
