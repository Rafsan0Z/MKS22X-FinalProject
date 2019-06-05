import java.util.*;

boolean clicked,run,answer = false,mu,md,ml,mr,f,s,gr,Default;
int mode,time,t0,prev,etime,partnum,fci,minimode,initialT,waitTime,score,countdown,phasefc;
int phase=0;
int level = 1;
Player human;
Rect Sidebar;
explosion Ex = new explosion(new PVector(width/2,8));
char Button;
boolean[][] partition;
int[] level1phaseTimes = new int[] {9,5,6,6,3,6,6,5,6};
Controls Up,Down,Left,Right;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> enemyproj = new ArrayList<Projectile>();
ArrayList<Projectile> playerproj = new ArrayList<Projectile>();
ArrayList<Powerups> extra = new ArrayList<Powerups>();
ArrayList<Controls> Balls = new ArrayList<Controls>();
ArrayList<Question> Qs = new ArrayList<Question>();
String[] commands = new String[5];
void setup(){
  size(1000,900);
  enemies.clear();
  enemyproj.clear();
  playerproj.clear();
  extra.clear();
  Balls.clear();
  Qs.clear();
  Balls.add(new Controls(350,100,commands[0] = "Up"));
  Balls.add(new Controls(350,250,commands[1] = "Down"));
  Balls.add(new Controls(250,175,commands[2] = "Left"));
  Balls.add(new Controls(450,175,commands[3] = "Right"));
  Balls.add(new Controls(350,175,commands[4] = "z"));
  Qs.add(new Question("Enter Key for Up",350,200));
  Qs.add(new Question("Enter Key for Down",350,300));
  Qs.add(new Question("Enter Key for Left",350,400));
  Qs.add(new Question("Enter Key for Right",350,500));
  Qs.add(new Question("Enter Key for Fire",350,600));
  minimode = -1;
  human = new Player(500,960,100,5,100,5);
  //extra.add(new Health(500,100,10));
  Sidebar = new Rect(width-300,110,250,20);
  mode = -3;
  score = 0;
  countdown = 0;
  initialT = 0;
  waitTime = 5000;
  human = new Player(500,960,100,5,100,5);
  partnum=10;
  partition= new boolean[partnum][partnum];
  Default = true;
}

void sideBars(){

  Sidebar.display();
  line(Sidebar.x,0,Sidebar.x,height);
  fill(50);
  textFont(createFont("AgencyFB-Reg-48",16));
  text("HealthBar",width-200,100);
  text("Score", width-200,210);
  text(score,width-200,250);
}

 //<>// //<>// //<>//
void draw(){ //<>// //<>// //<>//
  background(255); //<>// //<>//
  if(mode == -3){
    Ex.Add(mouseX,mouseY);
    Ex.move();
    fill(random(105),random(135),random(75));
    textFont(createFont("Arial Bold", 90));
    text("SPACE PATROL",190,400);
    textFont(createFont("Lucida Sans",32)); //<>// //<>//
    textSize(32);
    text("Press P to Play!",400,500);
    text("Press O for Options!",360,550);
    text("Press A for About!",360,600);
    text("Press C for Credits!",360,650);
    if(keyPressed){
      if(key == 'P'){mode = -1;}
      else if(key == 'O'){mode = -2;}
      else if(key == 'A'){mode = -4;}
      else if(key == 'C'){mode = -5;}
      else if(keyCode != SHIFT){text("Please Enter valid Key!",350,200);}
    }
  }
  else if(mode == -4){
    About();
    text("Press R to return to Menu",750,800);
    if(keyPressed){
      if(key == 'R'){mode = -3;}
    }
  }
  else if(mode == -5){
    Credits();
    text("Press R to return to Menu",650,800);
    if(keyPressed){
      if(key == 'R'){mode = -3;}
    }
  }
  else if(mode == -2){
    if(minimode == -1){
    textSize(32);
    fill(155);
    text("Default Controls. The Press D",350,200);
    text("Custom Controls. Then Press C",350,300);
    if(keyPressed && key == 'C'){minimode++;}
    else if(keyPressed && key == 'D'){minimode = commands.length;} //<>// //<>// //<>//
    } //<>// //<>// //<>//
    else if(minimode < commands.length && minimode >= 0){ //<>// //<>//
      text("Click on mouse to confirm selection!",350,100);
      Question q = Qs.get((int)minimode);
      Controls b = Balls.get((int)minimode);
      q.display();
      if(!q.isAnswered()){
        if(keyPressed){
          if(key == CODED){
            String T = CodeKey(keyCode); //<>// //<>//
            if(T == b.text){q.setAns(b.text);}
            else{q.setAns(T);b.Default = false;}
          }
          else{
            q.setAns(key + "");
            b.Default = false;}
            commands[(int)minimode] = q.ans;
            b.setText(q.ans);
       }
       if(mousePressed && q.ans != ""){q.confirm();}
      }
      else if(q.isAnswered()){minimode++;}
      Default = false;
    }
    else if (minimode >= commands.length){
    int counter = 0;
    for(Question q: Qs){
      if(Balls.get(counter).Default){q.setAns(commands[counter]);q.confirm();}
      q.display();
      counter++;
    }
    text("ARE YOU SURE ? : PRESS Y/N",350,750);
    if(keyPressed && key == 'N'){
      background(255);
      for(Question q: Qs){q.clear();}
      minimode = 0;
    }
    else if(keyPressed && key == 'Y'){mode = -3;minimode=-1;}
    }
  }
  else if(mode == -1){
  for(Controls b: Balls){
    //b.setText(commands[counter]);
    b.mutate();
    b.display();
   // println(b.text,key);
    //counter++; //<>// //<>// //<>//
  } //<>// //<>//
  sideBars(); //<>// //<>// //<>//
    text("Controls Work? Then Press S. If not Press R",150,500);
    if(keyPressed){
      if(key == 'S'){mode = 0;}
      if(key == 'R'){mode = -3;}
    }
  }
  else if(mode == 0){
    if(level == 1){
      phasefc++;
     if(phase%2==1&&phase<level1phaseTimes.length*2){
       if(phasefc==level1phaseTimes[phase/2]*60||enemies.size()==0){
         phase++;
         phasefc=0;
       }
      }
     if(phase==0){
     for(int i=0;i<6;i++){
       enemies.add(new testCircle(100+i*100,50,3,1,100,5,new int[] {2},i*10,60));
     }

    }
    if(phase==2){
      for(int i=0;i<3;i++){
        enemies.add(new testCircle((i+1)*700.0/4,50,3,1.5,100,5,new int[] {1,0,0,1,1,10}));
      }
    }
    if(phase==4){
      enemies.add(new testCircle(200,50,8,1,100,5,new int[] {0,13},0,40));
      enemies.add(new testCircle(500,50,8,1,100,5,new int[] {0,13},20,40));
    }
    if(phase==6){
      for(int i=0;i<6;i++){
        enemies.add(new testCircle((100+i*100),30,3,1,100,5,new int[] {0,0,0,1,3,9},0,70));
      }
    }
    if(phase==8){
      enemies.add(new testCircle(300,30,2,3,100,5,new int[] {0,0,5},0,50));
      enemies.add(new testCircle(400,30,2,3,100,5,new int[] {0,0,5},0,50));
      enemies.add(new testCircle(200,80,2,2.5,100,5,new int[] {0,0,5},0,50));
      enemies.add(new testCircle(500,80,2,2.5,100,5,new int[] {0,0,5},0,50));
    }
    if(phase==10){
      enemies.add(new zigzag(350,30,5,2,100,5,new int[]{0,3,0,0,0,0,3,-60},0,20,125,-5,250));
      enemies.add(new zigzag(150,30,5,2,100,5,new int[]{0,3,0,0,0,0,3,-60},0,20,5,-1,50));
      enemies.add(new zigzag(550,30,5,2,100,5,new int[]{0,3,0,0,0,0,3,-60},0,20,5,-1,50));
    }
    if(phase==12){
      enemies.add(new zigzag(350,30,20,1,100,5,new int[]{2,7,2,3,3,20,-120},0,40,250,-5,500));
    }
    if(phase==14){
      for(int i=0;i<5;i++){
      Enemy e = new testCircle(100,30+i*50,3,1,100,5,new int[] {0,5,1,2,1,10},i*24,120);
      Enemy e2 = new testCircle(600,30+i*50,3,1,100,5,new int[] {0,5,1,2,1,10},i*24,120);
      enemies.add(e);
      enemies.add(e2);
     }
    }
     if(phase%2==0){
        phase++; 
     }

    }
    if(level == 2){
    phasefc++;
    /*if(frameCount-fci==60){
      enemies.add(new testCircle(600,160,3,2,100,5,new int[] {0,10,0}));
    }
    */
 
    if(phase==0){
     for(int i=0;i<6;i++){
       enemies.add(new rotate(100+i*100,50,3,1,100,5,new int[] {2},i*10,60));
     }
    }
    if(phase==2){
      for(int i=0;i<3;i++){
        enemies.add(new testCircle((i+1)*700.0/4,50,3,1.5,100,5,new int[] {1,0,0,1,1,10}));
      }
    }
    if(phase == 4){
      for(int i=0;i<6;i++){
       enemies.add(new zigzag(100+i*100,50,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));
     }
    }
    if(phase == 6){
      for(int i=0;i<6;i++){
       enemies.add(new zigzag(100+i*100,50,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));
     }
    }
    if(phase == 8){
      for(int i=0;i<6;i++){
       enemies.add(new zigzag(100+i*100,50,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));
     }
    }
    if(phase == 10){
      for(int i=0;i<8;i++){
       enemies.add(new testCircle(80+i*80,50,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));
       //if(i%2 == 0){enemies.add(new rotate(120+i*80,70,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));}
     }
    }
    if(phase == 12){
      for(int i=0;i<8;i++){
       enemies.add(new rotate(80+i*80,50,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));
       //if(i%2 == 0){enemies.add(new zigzag(120+i*80,70,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));}
     }
    }
    if(phase == 14){
      for(int i=0;i<8;i++){
       enemies.add(new hide(50,300-80*i,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));
       //if(i%2 == 0){enemies.add(new zigzag(120+i*80,70,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));}
     }
    }
    if(phase == 16){
      for(int i=0;i<8;i++){
       enemies.add(new hide(50,300-80*i,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));
       //if(i%2 == 0){enemies.add(new zigzag(120+i*80,70,3,1,100,5,new int[] {1,0,0,1,1,10},i*10,60));}
     }
    }
    if(phase == 18){
      
    }
       if(phase%2==1&&phase<level1phaseTimes.length*2){
       if(phasefc==level1phaseTimes[phase/2]*60||enemies.size()==0){
         phase++;
         phasefc=0;
       }
    }
    if(phase%2==0){
      phase++;
    }
    }
     /*for(int i=0;i<partnum;i++){
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
   */
    //background(255);
    time=millis()-t0;
    etime=millis()-prev;
    for(Enemy e:enemies){
        e.attack();
    }
    for(Iterator<Enemy> iter= enemies.iterator(); iter.hasNext();){
       Enemy e = iter.next();
       e.display();
       e.move();
       if(human.isTouching(e)){
      mode=1;
        }
       if(e.x+e.radius < 0 || e.x-e.radius > Sidebar.x || e.y+e.radius < 0 || e.y-e.radius > height){
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
      if(p.damage==0||p.isOffScreen()){
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
    if(human.x+human.radius > Sidebar.x){
      human.x=Sidebar.x-human.radius;
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
    sideBars();
  }
  else if(mode == 1){
    //background(255);
    text("GAME OVER!",500,200);
    text("PRESS E TO EXIT", 500, 300);
    text("PRESS R TO RETURN TO MAIN MENU", 500, 400);
    if(keyPressed && (key == 'e' || key == 'E')){exit();}
    if(keyPressed && (key == 'r'||key== 'R')){ setup();}
  }
  //println(Default);
}

public void keyPressed(){
  if(key==CODED && Default){
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
  else{
    if(Balls.get(0).text.equals(key+"")){
       mu=true;
     }
     if(Balls.get(2).text.equals(key+"")){
       ml=true;
     }
     if(Balls.get(3).text.equals(key+"")){
       mr=true;
     }
     if(Balls.get(1).text.equals(key+"")){
       md=true;
     }
     if(keyCode==SHIFT){
       s=true;
     }
  }
  if(Balls.get(4).Default){
   if(key == 'z'){
     f=true;
   }
  }
  else{
    if(Balls.get(4).text.equals(key+"")){f=true;}
  }
}

public void keyReleased(){
  if(key==CODED && Default){
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
  else{
    if(Balls.get(0).text.equals(key+"")){
       mu=false;
     }
     if(Balls.get(2).text.equals(key+"")){
       ml=false;
     }
     if(Balls.get(3).text.equals(key+"")){
       mr=false;
     }
     if(Balls.get(1).text.equals(key+"")){
       md=false;
     }
     if(keyCode==SHIFT){
       s=false;
     }
  }
  if(Balls.get(4).Default){
   if(key == 'z'){
     f=false;
   }
  }
  else{
    if(Balls.get(4).text.equals(key+"")){f=false;}
  }
}


void mouseClicked(){
  if(mousePressed && !clicked){clicked = true;}
  else{clicked = false;}
}

void Letter(String l){
  fill(255);
  textFont(createFont("AgencyFB-Reg-48",32));
  text(l,500,500);
}

String CodeKey(int Key){
  if(Key == UP){return "Up";}
  else if(Key == LEFT){return "Left";}
  else if(Key == RIGHT){return "Right";}
  else if(Key == DOWN){return "Down";}
  return "";
}
