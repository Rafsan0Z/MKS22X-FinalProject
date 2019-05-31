class Grid{
  ArrayList<ArrayList<Cell>> cells;
  boolean[][] partition;
  Player pl;
  void checkAllCollisions(){
    for(int i=0;i<partnum;i++){
      for(int j=0;j<partnum;j++){
         cells.get(i).get(j).checkCollisions(); 
      }
    }
  }
}

class Cell{
  LinkedList<Projectile> enemyproj;
  void checkCollisions(){
    //use descendingIterator to check if isTouching player
  }
}
