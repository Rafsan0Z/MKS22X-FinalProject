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
    setCode();
  }
  void setCode(){
    if(text==commands[0]){Code = UP;}
    if(text==commands[1]){Code = DOWN;}
    if(text==commands[2]){Code = LEFT;}
    if(text==commands[3]){Code = RIGHT;}
  }
  void display(){
    setCode();
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
    if(keyPressed && keyCode == Code){on = true;}
    else{on = false;}
  }
}

void keyPressed(){
  
}
