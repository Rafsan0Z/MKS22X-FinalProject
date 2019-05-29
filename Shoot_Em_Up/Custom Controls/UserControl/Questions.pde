class Question{
  String ques;
  float x,y;
  boolean answer = false;
  Question(String question, float X, float Y){
    ques = question;
    x = X; y = Y;
  }
  void display(){
    fill(155);
    text(ques,x,y);
  }
  void isAnswered(){
    if(keyPressed){
      if(keyCode == ENTER){answer = true;}
    }
  }
}
