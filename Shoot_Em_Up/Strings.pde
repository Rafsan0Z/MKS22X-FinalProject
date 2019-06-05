void About(){
 fill(0);
 textSize(32);
 text("ABOUT",500,100);
 textSize(11);
 text("This is a simple shoot-em-up game with 2 levels, each of which contains a boss. The game allows you to customize the controls."+ "\n" + 
 
  "The controls include up,down,left,right movement, firing bullets,bombs and firing lasers when aquired." + "\n" +

  "When you open the game, you can chose to play the game by pressing P, go to options by pressing O and see the credits by pressing C."+ "\n" + 
  
  "When options is chosen, the user is given the chance to view the default controls, and even chose custom controls."+ "\n" + 
  
  "When players press P, they will be reminded of the controls before starting the game."+ "\n" +

  "In each level, of which there is two, there are waves of enemies with varying characters such as movement and shooting method."+ "\n" + 
  
  "After the end of the wave, the player will face a boss. There will be health dropped by the enemies occasionally and the user will die when the health bar reaches 0."+ "\n" +

  "When the player dies, he/she is given the chance to return to the main menu, or exit the game.",50,200); 
}

void Credits(){
 fill(0);
 textSize(32);
 text("CREDITS",730,100);
 textSize(40);
 text("Contributors", 700,200);
 text("Md. Rafsan Zaman and Kenson Lui",530,250);
 text("Level1: Kenson Lui",630,320);
 text("Level2: Md. Rafsan Zaman",580,370);
 text("Main Menu: Md. Rafsan Zaman",540,420);
 text("About and Credit page: Md. Rafsan Zaman",450,470);
 text("Controls:Md. Rafsan Zaman and Kenson Lui",440,520);
}
