class Circles {
  
  float x, y, radius;
  String ohWord;
  /*
  Circles() {
    x = 2000;
    y = 2000;
    radius = 1;
    ohWord = "hi";
  }
 */ 
  Circles(float xpos, float ypos, float rad, String worddd) {
    x = xpos;
    y = ypos;
    radius = rad;
    ohWord = worddd;
  }
  
  void show() {
    ellipseMode(CENTER);
    stroke(255);
    strokeWeight(2);
    noFill();
    ellipse(x, y, radius, radius);
  }
  
  void check() {
    if (dist(mouseX, mouseY, x, y) < 100) {
      textFont(font, 16);
      fill(255);
      textAlign(CENTER);
      text(ohWord, x, y-10);
    }
  }
}
