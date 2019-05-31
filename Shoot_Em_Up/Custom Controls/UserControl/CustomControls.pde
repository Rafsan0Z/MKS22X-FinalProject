class Controls{
  float size,x,y;
  float c;
  String text;
  boolean on;
  int Code;
  Controls(float X, float Y, String T){
    size = 40;
    x = X; y = Y;
    c = 255;
    text = T;
    on = false;
    if(Default){setCode();}
  }
  void setCode(){
    if(text=="Up"){Code = UP;}
    if(text=="Down"){Code = DOWN;}
    if(text== "Left"){Code = LEFT;}
    if(text== "Right"){Code = RIGHT;}
  }
  void display(){
    //setCode();
    change();
    fill(c);
    rect(x,y,size,size);
    fill(155);
    text(text,x+size/2-10,y+size/2);
  }
  void setText(String t){
    text = t;
  }
  void change(){
    if(on){c = 50;}
    else{c = 255;}
  }
  void mutate(){
    if(keyPressed && (Default && keyCode == Code)){on = true;}
    else if(keyPressed && text.equals(key + "")){on = true;}
    else{on = false;}
    //println(key,text);
  }
}

void keyPressed(){
  
}
