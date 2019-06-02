interface Displayable{
  void display();
  boolean isTouching(Living other);
}

interface Moveable{
  void move();
}

interface Damageable{}
