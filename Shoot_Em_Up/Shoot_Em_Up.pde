import java.util.*;

boolean clicked;
int mode,time,t0,prev,etime,phase,partnum;
Player human;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> enemyproj = new ArrayList<Projectile>();
ArrayList<Projectile> playerproj = new ArrayList<Projectile>();
ArrayList<Powerups> extra = new ArrayList<Powerups>();
boolean mu,md,ml,mr,f,s,gr;
boolean[][] partition;
void setup(){
  size(1000,800);
  human = new Player(500,960,100,5,100,5);
  Enemy e = new testCircle(500,100,3,3,100,5);
  //Enemy e2 = new testCircle(600,160,100,2,100,5);
  enemies.add(e);
  //enemies.add(e2);
  extra.add(new Health(500,100,10));
  mode = -1;
  partnum=10;
  partition= new boolean[partnum][partnum];
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
     for(int i=0;i<partnum;i++){
         for(int j=0;j<partnum;j++){
            if(human.isTouchingRect(width/partnum*i,height/partnum*j,width/partnum,height/partnum)){
              partition[i][j]=true;
            }
            else{
              partition[i][j]=false; 
            }
         }
      }
    if(gr){
      for(int i=0;i<partnum;i++){
        line(width/partnum*i,0,width/partnum*i,height);
      }
      for(int i=0;i<partnum;i++){
        line(0,height/partnum*i,width,height/partnum*i);
      }
      for(int i=0;i<partnum;i++){
         for(int j=0;j<partnum;j++){
            if(partition[i][j]){
              fill(0,255,0);
              rect(width/partnum*i,height/partnum*j,width/partnum,height/partnum);
            }
         }
      }
    }
   
    //background(255);
    time=millis()-t0;
    etime=millis()-prev;
    if(etime>500){
      for(Enemy e:enemies){
        e.attack();
      }
      prev=millis();
    }
    for(Iterator<Enemy> iter= enemies.iterator(); iter.hasNext();){
       Enemy e = iter.next();
       e.display();
       e.move();
       if(human.isTouching(e)){
      mode=1;
        }
       if(e.x+e.radius < 0 || e.x-e.radius > width || e.y+e.radius < 0 || e.y-e.radius > height){
         iter.remove();
       }
       if(e.health<=0){
             iter.remove(); 
        }
    }
    for(Iterator<Projectile> iterp = playerproj.iterator(); iterp.hasNext();){
        Projectile p = iterp.next();
        for(Iterator<Enemy> iter= enemies.iterator(); iter.hasNext();){
           Enemy e = iter.next();
           if(p.isTouching(e)){
             e.takeDamage(p.damage);
             iterp.remove();
           }
        }
     }
    if(frameCount==200){
      enemies.add(new testCircle(600,160,3,2,100,5));
    }
    if(enemies.size()==0&&phase==0){
     enemies.add(new testCircle(200,160,3,2,100,5));
     phase++;
    }
    human.move();
    human.display();
    human.attack();
    for(Iterator<Projectile> iter = enemyproj.iterator();iter.hasNext();){
      Projectile p = iter.next();
      p.move();
      p.display();
      if(p.isTouching(human)){
        mode=1;
      }
      if(p.isOffScreen()){
       iter.remove(); 
      }
    }
    for(Iterator<Projectile> iter = playerproj.iterator();iter.hasNext();){
      Projectile p = iter.next();
      p.move();
      p.display();
      if(p.isOffScreen()){
       iter.remove(); 
      }
    }
    for(Powerups p: extra){
      p.move();
      p.display();
    }
    if(human.x+human.radius > width){
      human.x=width-human.radius;
    }
    if(human.x-human.radius<0){
      human.x=human.radius; 
    }
    if(human.y+human.radius>height){
     human.y=height-human.radius; 
    }
    if(human.y-human.radius<0){
     human.y=human.radius;
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
  if(key=='z'||key=='Z'){
   f=true; 
  }
  if(key==TAB){
   gr=true; 
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
  if(key=='z'||key=='Z'){
   f=false; 
  }
  if(key==TAB){
   gr=false; 
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
