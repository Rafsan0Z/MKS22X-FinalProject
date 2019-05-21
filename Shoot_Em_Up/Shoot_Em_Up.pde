boolean clicked = false;
int mode;
Player human;
Enemy e;
int initialT,waitTime;
ArrayList<Projectile> shoot = new ArrayList<Projectile>();
ArrayList<Powerups> extra = new ArrayList<Powerups>();
boolean mu,md,ml,mr,f,s;
void setup(){
  size(1500,1000);
  human = new Player(500,960,100,5,100,5);
  e = new testCircle(500,500,100,5,100,5);
  extra.add(new Health(500,100,10));
  mode = -1;
}

void sideBars(){
  fill(50);
  textFont(createFont("AgencyFB-Reg-48",16));
  text("HealthBar",width-200,100);
  fill(red(color(255,204,0)),0,0);
  rect(width-300,110,250,20);
}

void draw(){ //<>//
  background(255);
  line(width-400,0,width-400,height);
  sideBars();
  if(mode == -1){
    initialT = second();
    waitTime = 5;
    fill(175);
    ellipse(500,500,400,400);
    fill(255);
    textFont(createFont(PFont.list()[10],16));
    text("PRESS P TO PLAY AND WAIT FIVE SECONDS",320,500);
    if(keyPressed && key == 'p'){
      int time = second() - initialT;
         while(time < waitTime){
           //println(time);
           time = second() - initialT;
         }
    mode++;
    }
  } //<>//
  else if(mode == 0){
  //background(255);
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

void Letter(int l){
  fill(255);
  textFont(createFont("AgencyFB-Reg-48",32));
  text(""+l,500,500);
}
