explosion Ex;
void setup(){
  size(800,800);
  Ex = new explosion(new PVector(400,40));
}

void draw(){
  background(255);
    //rect(mouseX,mouseY,10,10);
    Ex.Add(mouseX,mouseY);
    Ex.move();
}

class explosion{
  ArrayList<particle> group;
  PVector center;
  explosion(PVector p){
    center = p.copy();
    group = new ArrayList<particle>();
  }
  void Add(float x, float y){
    group.add(new particle(new PVector(x,y)));
  }
  void move(){
    int counter = group.size()-1;
    for(;counter >= 0;counter--){
      particle p = group.get(counter);
      p.move();
      if(!p.isAlive()){group.remove(counter);}
    }
  }
}
