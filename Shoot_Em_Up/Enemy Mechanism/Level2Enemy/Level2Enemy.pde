//This is for Enemies in level 2!./
Rect square;
ArrayList<Split> group = new ArrayList<Split>();
int counter,bpass;
boolean split = true;
void setup(){
  size(1500,1500);
  square = new Rect(750,550,20,20);
  counter = 0;bpass = 0;
  group.add(new Split(750,200,4));
}

void draw(){
  background(255);
  counter = 0;
  for(Split s: group){
    s.display();
    s.move();
    counter++;
    bpass++;
  }
  if(split && bpass%80 == 0){group.get(counter-1).divide();split = false;}
  counter = 0;
}

void keyPressed(){
  if(key == 'r'){     
  }
}
