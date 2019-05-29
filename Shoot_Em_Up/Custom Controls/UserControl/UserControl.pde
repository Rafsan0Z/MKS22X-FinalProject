ArrayList<Controls> Balls = new ArrayList<Controls>();
Controls Up,Down,Left,Right;
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
}

void draw(){
  background(255);
  for(Controls b: Balls){
    b.display();
    b.mutate();
  }
}
