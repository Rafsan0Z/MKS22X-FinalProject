int mode;
void setup(){
  size(1000,1000);
  mode = 1;
}

void draw(){
  background(255);
  if(mode == 1){
    textSize(90);
    fill(random(105),random(135),random(75));
    text("Space Patrol",250,400);
    textSize(32);
    text("Press P to Play!",400,500);
    text("Press O for Options!",360,600);
    if(keyPressed){
      if(key == 'P'){mode = 3;}
      else if(key == 'O'){mode = 2;}
      else{text("Please Enter valid Key!",350,700);}
    }
  }
  else if(mode == 2){
 
  }
}
