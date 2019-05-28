class Boss{
  float x,y,a,b;
  ArrayList<Triangle> Set;
  Boss(ArrayList<Triangle> Ts, float X, float Y, float r1, float r2){
    Set = Ts; x = X; y = Y; a = r1; b = r2; 
  }
  void move(){
    if(keyPressed){
      if(keyCode == LEFT){x-=1;
      for(Triangle t: Set){t.move();}
    }
      else if(keyCode == RIGHT){x+=1;
      for(Triangle t: Set){t.move();}
    }
      else if(keyCode == UP){y -=1;}
      else if(keyCode == DOWN){y+=1;}
    }
  }
  void display(){
    ellipse(x,y,a,b);
    for(Triangle t: Set){
    t.display();
    if(release){t.drop();}
  }
  }
}
