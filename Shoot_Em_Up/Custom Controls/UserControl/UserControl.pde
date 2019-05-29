ArrayList<Controls> Balls = new ArrayList<Controls>();
ArrayList<Question> Qs = new ArrayList<Question>();
Controls Up,Down,Left,Right;
float mode;
char Button;
boolean answer = false;
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
  Qs.add(new Question("Enter Key for Up",750,600));
  Qs.add(new Question("Enter Key for Down",750,600));
  mode = 0;
}

void draw(){
  background(255);
  if(mode == 0){
    for(Question q: Qs){
      int time = second();
      for(int i = time; i < time + 5; i += second() - time){ //<>//
      textSize(32);
      q.display();
      if(keyPressed){
        Button = key;
      }
      text(Button,750,400);
      println(i); //<>//
      }
    }
  }
  if(mode == 1){
  for(Controls b: Balls){
    b.display();
    b.mutate();
  }
  }
}
