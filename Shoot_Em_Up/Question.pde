class Question{
  String ques;
  float x,y;
  boolean answer = false;
  String ans = "";
  Question(String question, float X, float Y){
    ques = question;
    x = X; y = Y;
  }
  void display(){
    fill(155);
    text(ques,x,y);
    fill(200);
    rect(x+400,y-30,40,40);
    fill(0);
    text(ans,x+410,y);
  }
  boolean isAnswered(){
    return answer;
  }
  void setAns(String text){
    ans = text;
  }
  void confirm(){answer = true;}
  void clear(){
    ans = "";
    answer = false;
  }
}
