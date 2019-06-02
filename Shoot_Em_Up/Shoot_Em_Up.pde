import java.util.*;

boolean clicked;
int mode,time,t0,prev,etime,phase,partnum,fci;
Player human;
Rect Sidebar;
int initialT,waitTime;
int score,countdown;
boolean run;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> enemyproj = new ArrayList<Projectile>();
ArrayList<Projectile> playerproj = new ArrayList<Projectile>();
ArrayList<Powerups> extra = new ArrayList<Powerups>();
boolean mu,md,ml,mr,f,s,gr;
boolean[][] partition;
void setup(){
  size(1500,1000);
  human = new Player(500,960,100,5,100,5);
  extra.add(new Health(500,100,10));
  Sidebar = new Rect(width-300,110,250,20);
  mode = -2;
  score = 0;
  countdown = 0;
  initialT = 0;
  waitTime = 5000;
  human = new Player(500,960,100,5,100,5);
  for(int i=0;i<5;i++){
   Enemy e = new testCircle(100,50+i*100,3,1.5,100,5,new int[] {1,0,0});
   Enemy e2 = new testCircle(700,50+i*100,3,1.5,100,5,new int[] {1,0,0});
   enemies.add(e);
  enemies.add(e2);
  }
  partnum=10;
  partition= new boolean[partnum][partnum];
}

void sideBars(){
  Sidebar.display();
  fill(50);
  textFont(createFont("AgencyFB-Reg-48",16));
  text("HealthBar",width-200,100);
  text("Score", width-200,210);
  text(score,width-200,250); 
}
 

void draw(){ //<>//
  background(255);
  if(mode == -2){
    textSize(90);
    fill(random(105),random(135),random(75));
    text("Space Patrol",250,400);
    textSize(32);
    text("Press P to Play!",400,500);
    text("Press O for Options!",360,600);
    if(keyPressed){
      if(key == 'P'){mode = -1;}
      else if(key == 'O'){}
      else{text("Please Enter valid Key!",350,700);}
    }
  }
  else if(mode == -1){
    line(width-400,0,width-400,height);
    fill(175);
    ellipse(500,500,400,400);
  /*
    fill(255);
    textFont(createFont(PFont.list()[10],16));
    text("PRESS P TO PLAY AND WAIT FIVE SECONDS",320,500);
    text(countdown,500,550);
    if(keyPressed && key == 'p'){
        initialT = millis();
        run = true;
    }
    if(time - initialT < waitTime){
        if(run){time = millis();}
        countdown = (time - initialT)/1000;
     }
    else{mode++;}
  } //<>//
  */

  sideBars();
    Letter(10);
    text("PRESS P TO PLAY",370,550);
    if(keyPressed && key == 'p'){
      t0=millis();
      prev=t0;
      mode++;
      fci=frameCount;
    }
  }
  else if(mode == 0){
    if(frameCount-fci==60){
      enemies.add(new testCircle(600,160,3,2,100,5,new int[] {0,10,0}));
    }
    if(enemies.size()==0&&phase==0){
     enemies.add(new testCircle(200,160,3,2,100,5,new int[] {1,10,5}));
     phase++;
    }
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
    //if(etime>500){
    for(Enemy e:enemies){
        e.attack();
    }
    //  prev=millis();
    //}
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
  if(key=='z'||key=='Z'){
   f=false; 
    }
  }
}


void mouseClicked(){
  if(mousePressed && !clicked){clicked = true;}
  else{clicked = false;}
}

void Letter(int l){
  fill(255);
  textFont(createFont("AgencyFB-Reg-48",32));
  text(""+l,500,500);
}
