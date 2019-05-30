ArrayList<Controls> Balls = new ArrayList<Controls>();
ArrayList<Question> Qs = new ArrayList<Question>();
String[] commands = new String[4];
Controls Up,Down,Left,Right;
float mode,minimode;
char Button;
boolean answer = false,keyReleased = false;
void setup(){
  size(1500,1500);
  Balls.add(new Controls(750,100,commands[0]));
  Balls.add(new Controls(750,250,commands[1]));
  Balls.add(new Controls(650,175,commands[2]));
  Balls.add(new Controls(850,175,commands[3]));
  Qs.add(new Question("Enter Key for Up",750,200));
  Qs.add(new Question("Enter Key for Down",750,300));
  Qs.add(new Question("Enter Key for Left",750,400));
  Qs.add(new Question("Enter Key for Right",750,500));
  mode = 0;
  minimode = 0;
}

void draw(){
  background(255);
  if(mode == 0){
    textSize(32); //<>// //<>//
    if(minimode < 4){
      Question q = Qs.get((int)minimode);
      q.display();
      if(!q.isAnswered()){
        if(keyPressed){
          q.setAns(key + "");
       }
       if(mousePressed && q.ans != ""){q.confirm();}
      }
      else if(q.isAnswered()){minimode++;}
    }
    else{
    for(Question q: Qs){
      q.display();
    }
    text("ARE YOU SURE?",750,650);
    if(keyPressed && key == 'N'){
      background(255);
      for(Question q: Qs){q.clear();}
      minimode = 0;
    }
    else if(keyPressed && key == 'Y'){
      int counter = 0;
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
    b.setText(commands[counter]);
    b.display();
    b.mutate();
    counter++;
  }
  }
}
