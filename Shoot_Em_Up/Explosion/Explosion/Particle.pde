class particle{
  PVector P,V,A;
  float life;
  particle(PVector p){
    A = new PVector(0,.01);
    V = new PVector(-1,1);
    P = p.copy();
    life = 50.0;
  }
}
