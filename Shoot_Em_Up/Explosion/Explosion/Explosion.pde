void setup(){
  size(200,200);
}

void draw(){
  if(mousePressed){
    rect(mouseX,mouseY,10,10);
  }
}

class explosion{
  ArrayList<particle> group;
  PVector center;
  explosion(){
    group = new ArrayList<particle>();
  }
  void add(float x, float y){
    group.add(new particle(new PVector(x,y)));
  }
  void move(){
    for(particle p: group){
      //move particle
    }
  }
}
