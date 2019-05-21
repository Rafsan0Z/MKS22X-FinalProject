float health = 1000;
float MAX_HEALTH = 1000;
float rectWidth = 500;

void setup()
{
  size(1000, 1000);
}

void draw()
{
  background(255);
  fill(health*1.5,0,0);
  noStroke();
  float drawWidth = (health / MAX_HEALTH) * rectWidth;
  rect(100, 100, drawWidth, 50);
  stroke(0);
  noFill();
  rect(100, 100, rectWidth, 50);
  println(health);
}

void keyPressed()
{
  if (health > 0 && key == 'a')
  {
    health -= 1;
  }
  if (health < MAX_HEALTH && key == 'b')
  {
    health += 1;
  }
  if(key == 'g' && health < MAX_HEALTH){
    health += 50;
  }
  if(key == 'n' && health > 0){
    health -= 50;
  }
}
