class particle{
  PVector P,V,A;
  float life;
  particle(PVector p){
    A = new PVector(0,.01);
    V = new PVector(random(-2,2),random(-2,0));
    P = p.copy();
    life = 50;
  }
  void change(){
    V.add(A);P.add(V);life--;
  }
  void move(){
    change();display();
  }
  void display(){
    fill(8*life);
    rect(P.x,P.y,10,10);
  }
  boolean isAlive(){return life > 0;}  
}
