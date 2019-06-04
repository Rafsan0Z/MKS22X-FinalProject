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
