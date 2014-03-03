class Circles {
  
  float x, y, radius;
  
  Circles(float xpos, float ypos, float rad) {
    x = xpos;
    y = ypos;
    radius = rad;
  }
  
  void show() {
    
    ellipseMode(CENTER);
    stroke(100);
    noFill();
    ellipse(x, y, radius, radius);
  }
}
