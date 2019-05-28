//This is for Enemies in level 2!./
Rect square;
float counter;
void setup(){
  size(1500,1500);
  square = new Rect(750,550,20,20);
  counter = 0.0;
}

void draw(){
  background(255);
  counter++;
  square.display();
  square.move();
}

void keyPressed(){
  if(key == 'r'){     
  }
}
