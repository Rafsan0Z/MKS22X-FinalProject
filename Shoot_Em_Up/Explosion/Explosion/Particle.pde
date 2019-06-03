class particle{
  PVector P,V,A;
  float life;
  particle(PVector p){
    A = new PVector(0,.01);
    V = new PVector(-1,1);
    P = p.copy();
    life = 50.0;
  }
  void change(){
    V.add(A);P.add(V);life -= 1.0;
  }
  void move(){
    change();display();
  }
  void display(){
    fill(0,10*life);
    rect(P.x,P.y,10,10);
  }
}
