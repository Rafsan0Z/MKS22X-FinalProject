import java.util.*;

boolean clicked;
int mode,time,t0,prev,etime;
Player human;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> shoot = new ArrayList<Projectile>();
ArrayList<Powerups> extra = new ArrayList<Powerups>();
boolean mu,md,ml,mr,f,s;
void setup(){
  size(1000,1000);
  human = new Player(500,960,100,5,100,5);
  Enemy e = new testCircle(500,100,100,3,100,5);
  Enemy e2 = new testCircle(600,160,100,2,100,5);
  enemies.add(e);
  enemies.add(e2);
  extra.add(new Health(500,100,10));
  mode = -1;
}

void draw(){
  background(255);
  if(mode == -1){
    fill(175);
    ellipse(500,500,400,400);
    Letter();
    text("PRESS P TO PLAY",370,550);
    if(keyPressed && key == 'p'){
      t0=millis();
      prev=t0;
      mode++;
    }
  }
  else if(mode == 0){
    println(enemies.size());
    //background(255);
    time=millis()-t0;
    etime=millis()-prev;
    Iterator<Enemy> iter = enemies.iterator();
    while(iter.hasNext()){
       Enemy e = iter.next();
       e.display();
       e.move();
       if(human.isTouching(e)){
      mode=1;
        }
       if(e.x+e.radius < 0 || e.x-e.radius > width || e.y+e.radius < 0 || e.y-e.radius > height){
         iter.remove();
       }
    }
    if(etime>100){
      for(Enemy e:enemies){
        e.attack();
      }
      prev=millis();
    }
    human.display();
    human.move();
    human.attack();
    
    for(Projectile p: shoot){
      p.move();
      p.display();
    }
    for(Powerups p: extra){
      p.move();
      p.display();
    }
    if(human.x+human.radius < 0 || human.x-human.radius > width || human.y+human.radius < 0 || human.y-human.radius > height){
      mode = 1;
    }
  }
  else if(mode == 1){
    //background(255);
    text("GAME OVER!",500,200);
    text("PRESS E TO EXIT", 500, 300);
    if(keyPressed && key == 'e'){exit();}
  }
}

public void keyPressed(){
  if(key==CODED){
     if(keyCode==UP){
       mu=true; 
     }
     if(keyCode==LEFT){
       ml=true; 
     }
     if(keyCode==RIGHT){
       mr=true; 
     }
     if(keyCode==DOWN){
       md=true; 
     }
     if(keyCode==SHIFT){
       s=true; 
     }
  }
  if(key=='z'){
   f=true; 
  }
}

public void keyReleased(){
  if(key==CODED){
     if(keyCode==UP){
       mu=false; 
     }
     if(keyCode==LEFT){
       ml=false; 
     }
     if(keyCode==RIGHT){
       mr=false; 
     }
     if(keyCode==DOWN){
       md=false; 
     }
     if(keyCode==SHIFT){
       s=false; 
     }
  }
  if(key=='z'){
   f=false; 
  }
}


void mouseClicked(){
  if(mousePressed && !clicked){clicked = true;}
  else{clicked = false;}
}

void Letter(){
  fill(255);
  textFont(createFont("Bauhaus93-48",32));
  text("1",500,500);
  //delay(1000);
  //fill(255);
  //text("2",500,500);
  //fill(255);
  //text("3",500,500);
  //delay(1000);
}
