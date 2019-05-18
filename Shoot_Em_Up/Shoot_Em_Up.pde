boolean clicked = false;
Player human;
ArrayList<Projectile> shoot = new ArrayList<Projectile>();
ArrayList<Powerups> extra = new ArrayList<Powerups>();
void setup(){
  size(1000,1000);
  human = new Player(500,960,100);
  extra.add(new Health(500,100,10));
}

void draw(){
  background(255);
  human.display();
  human.move();
  human.attack();
  for(Projectile p: shoot){
    p.move();
    p.display();
  }
  for(Powerups p: extra){
    p.move();
    p.display();
  }
}

void mouseClicked(){
  if(mousePressed && !clicked){clicked = true;}
  else{clicked = false;}
}
