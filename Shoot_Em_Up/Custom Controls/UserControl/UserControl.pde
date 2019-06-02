ArrayList<Controls> Balls = new ArrayList<Controls>();
ArrayList<Question> Qs = new ArrayList<Question>();
String[] commands = new String[5];
Controls Up,Down,Left,Right;
float mode,minimode;
char Button;
boolean answer = false,keyReleased = false;
PShape LA,RA,UA,DA;
void setup(){
  size(1500,1500);
  Balls.add(new Controls(750,100,commands[0] = "Up"));
  Balls.add(new Controls(750,250,commands[1] = "Down"));
  Balls.add(new Controls(650,175,commands[2] = "Left"));
  Balls.add(new Controls(850,175,commands[3] = "Right"));
  Balls.add(new Controls(750,175,commands[4] = "Fire"));
  Qs.add(new Question("Enter Key for Up",550,200));
  Qs.add(new Question("Enter Key for Down",550,300));
  Qs.add(new Question("Enter Key for Left",550,400));
  Qs.add(new Question("Enter Key for Right",550,500));
  Qs.add(new Question("Enter Key for Fire",550,600));
  mode = 0;
  minimode = -1;
}

void draw(){
  background(255);
  if(mode == 0){
    if(minimode == -1){
    textSize(32);
    fill(155);
    text("Default Controls. The Press D",550,200);
    text("Custom Controls. Then Press C",550,300);
    if(keyPressed && key == 'C'){minimode++;}
    else if(keyPressed && key == 'D'){minimode = commands.length;}
    } //<>// //<>//
    else if(minimode < commands.length && minimode >= 0){
      text("Click on mouse to confirm selection!",750,100);
      Question q = Qs.get((int)minimode);
      Controls b = Balls.get((int)minimode); 
      q.display();
      if(!q.isAnswered()){
        if(keyPressed){
          if(key == CODED){
            String T = CodeKey(keyCode);
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
    }
    else if (minimode >= commands.length){
    int counter = 0;
    for(Question q: Qs){
      if(Balls.get(counter).Default){q.setAns(commands[counter]);q.confirm();}
      q.display();
      counter++;
    }
    text("ARE YOU SURE ? : PRESS Y/N",550,750);
    if(keyPressed && key == 'N'){
      background(255);
      for(Question q: Qs){q.clear();}
      minimode = 0;
    }
    else if(keyPressed && key == 'Y'){mode = 1;}
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

String CodeKey(int Key){
  if(Key == UP){return "Up";}
  else if(Key == LEFT){return "Left";}
  else if(Key == RIGHT){return "Right";}
  else{return "Down";}
}
