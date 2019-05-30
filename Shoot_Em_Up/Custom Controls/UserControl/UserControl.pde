ArrayList<Controls> Balls = new ArrayList<Controls>();
ArrayList<Question> Qs = new ArrayList<Question>();
Controls Up,Down,Left,Right;
float mode,minimode;
char Button;
boolean answer = false,keyReleased = false;
void setup(){
  size(1500,1500);
  Up = new Controls(750,100,"Up");
  Down = new Controls(750,250,"Down");
  Left = new Controls(650,175,"Left");
  Right = new Controls(850,175,"Right");
  Balls.add(Up);
  Balls.add(Down);
  Balls.add(Left);
  Balls.add(Right);
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
    textSize(32);
    //for(Question q: Qs){
    //  textSize(32); //<>//
    //  q.display();
    //  if(!q.isAnswered()){
    //    if(keyPressed){q.ans = key + "";}
    //  } //<>//
    //}
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
    if(keyPressed && key == 'N'){background(255);minimode = 0;}
    }
  }
  if(mode == 1){
  for(Controls b: Balls){
    b.display();
    b.mutate();
  }
  }
}
