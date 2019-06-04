Table table;
void setup(){
  size(1500,1500);
  table = loadTable("Leaderboard.csv");
  for(TableRow row: table.rows()){
    int place = row.getInt("Place");
    String name = row.getString("Name");
    int score = row.getInt("Score");
    String win = row.getString("Win");
    text(name + "is #" + place + ", with a score of " + score,750,200);
  }
}

void draw(){
  
}
