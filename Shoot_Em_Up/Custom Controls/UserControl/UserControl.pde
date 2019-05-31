ArrayList<Controls> Balls = new ArrayList<Controls>();
ArrayList<Question> Qs = new ArrayList<Question>();
String[] commands = new String[5];
Controls Up,Down,Left,Right;
float mode,minimode;
char Button;
boolean answer = false,keyReleased = false,Default = true;
PShape LA,RA,UA,DA;
void setup(){
  size(1500,1500);
  Balls.add(new Controls(750,100,commands[0] = "Up"));
  Balls.add(new Controls(750,250,commands[1] = "Down"));
  Balls.add(new Controls(650,175,commands[2] = "Left"));
  Balls.add(new Controls(850,175,commands[3] = "Right"));
  Balls.add(new Controls(750,175,commands[4] = "Fire"));
  Qs.add(new Question("Enter Key for Up",750,200));
  Qs.add(new Question("Enter Key for Down",750,300));
  Qs.add(new Question("Enter Key for Left",750,400));
  Qs.add(new Question("Enter Key for Right",750,500));
  Qs.add(new Question("Enter Key for Fire",750,600));
  mode = 0;
  minimode = -1;
}

void draw(){
  background(255);
  if(mode == 0){
    if(minimode == -1){
    textSize(32);
    fill(155);
    text("Default Controls. The Press D",750,200);
    text("Custom Controls. Then Press C",750,300);
    if(keyPressed && key == 'C'){minimode++;}
    else if(keyPressed && key == 'D'){minimode = commands.length;}
    } //<>// //<>//
    else if(minimode < commands.length && minimode >= 0){
      Question q = Qs.get((int)minimode);
      Controls b = Balls.get((int)minimode); 
      q.display();
      if(!q.isAnswered()){
        if(keyPressed){
          q.setAns(key + "");
          commands[(int)minimode] = q.ans;
          b.setText(commands[(int)minimode]);
       }
       if(mousePressed && q.ans != ""){q.confirm();}
      }
      else if(q.isAnswered()){minimode++;}
      Default = false;
    }
    else if (minimode != -1){
    int counter = 0;
    for(Question q: Qs){
      if(Default){q.setAns(commands[counter]);q.confirm();}
      q.display();
      counter++;
    }
    text("ARE YOU SURE?",750,750);
    if(keyPressed && key == 'N'){
      background(255);
      for(Question q: Qs){q.clear();}
      minimode = 0;
    }
    else if(keyPressed && key == 'Y'){
      counter = 0;
      for(Question q: Qs){
        commands[counter] = q.ans;
        counter++;
      }
      mode = 1;
    }
    }
  }
  if(mode == 1){
  textSize(16);
  int counter = 0;
  for(Controls b: Balls){
    //b.setText(commands[counter]);
    b.mutate();
    b.display();
   // println(b.text,key);
    counter++;
  }
  //leftArrow();
  //shape(LA);
  }
}
