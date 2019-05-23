import java.util.*;
boolean clicked = false;
int mode;
Player human;
Enemy e;
Rect Sidebar;
int initialT,waitTime,time,etime,prev;
int score,countdown;
boolean run;
ArrayList<Projectile> shoot = new ArrayList<Projectile>();
ArrayList<Powerups> extra = new ArrayList<Powerups>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean mu,md,ml,mr,f,s;
void setup(){
  size(1500,1000);
  human = new Player(500,960,100,5,100,5);
  e = new testCircle(500,500,100,5,100,5);
  extra.add(new Health(500,100,10));
  Sidebar = new Rect(width-300,110,250,20);
  mode = -1;
  score = 0;
  countdown = 0;
  initialT = 0;
  waitTime = 5000;
  prev = 0;
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
  if(mode == -1){
    line(width-400,0,width-400,height);
    fill(175);
    ellipse(500,500,400,400);
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
    else{initialT = millis(); prev = initialT; mode = 2;}
  } //<>//
  else if(mode == 0){
  sideBars();
  e.display();
  human.display();
  human.move();
  human.attack();
  if(human.isTouching(e)){
    mode=1;
  }
  for(Projectile p: shoot){
    p.move();
    p.display();
  }
  for(Powerups p: extra){
    p.move();
    p.display();
  }
  if(human.x < 0 || human.x > width || human.y < 0 || human.y > height){mode = 1;}
  }
  else if(mode == 1){
    //background(255);
    text("GAME OVER!",500,200);
    text("PRESS E TO EXIT", 500, 300);
    if(keyPressed && key == 'E'){exit();}
  }
  else if(mode == 2){
    initialT = millis();
    time = millis() - initialT;
    etime = millis() - prev;
    sideBars();
    Iterator<Enemy> iter = enemies.iterator();
     while(iter.hasNext()){
      Enemy e = iter.next();
      e.display();
      e.move();
    }
    if(etime<100){
    for(int i = 1; i <= 10; i++){
      enemies.add(new testCircle(100*i,-10,100,5,100,5));
      iter = enemies.iterator();
    }
    }
    //println(iter);
    human.display();
    human.move();
    human.attack();
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
  if (health > 0 && key == 'a')
  {
    health -= 1;
  }
  if (health < MAX_HEALTH && key == 'b')
  {
    health += 1;
  }
  if(key == 'g' && health < MAX_HEALTH){
    if(health + 50 > MAX_HEALTH){health = MAX_HEALTH;}
    else{health += 50;}
  }
  if(key == 'n' && health > 0){
    if(health - 50 < 0){health = 0;}
    else{health -= 50;}
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

void Letter(int l){
  fill(255);
  textFont(createFont("AgencyFB-Reg-48",32));
  text(""+l,500,500);
}
