class Spin {
  float speed = random(-0.05, 0.05);
  float angle = 0;
  float d = 20;
  int x, y;
  
  Spin(int xpos, int ypos) {
    x = xpos;
    y = ypos; 
  }
  
  void go() {
    angle += speed;
  }
  
  void updateSize(float size) {
    d = size;
  }
}

class SquareSpin extends Spin {
  SquareSpin(int x, int y) {
    super(x, y);
  }
   void show() {
    pushMatrix();
    translate(((width/2)+x), ((height/2)+y));
    rotate(angle);
    rectMode(CENTER);
    noStroke();
    fill(150, 93, 102, 200);
    rect(x/128, y/128, d, d);
    popMatrix();
  }
}

class CircleSpin extends Spin {
  CircleSpin(int x, int y) {
    super(x, y);
  }
   void show() {
    pushMatrix();
    translate(((width/2)+x), ((height/2)+y));
    rotate(angle);
    ellipseMode(CORNER);
    noFill();
    strokeWeight(2);
    stroke(2, 81, 75);
    ellipse(x/128, y/128, d, d);
    popMatrix();
  }
}
