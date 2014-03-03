class Spin {
  float speed = random(-0.05, 0.05);
  float angle = 0;
  float d;
  float x, y;
  
  Spin(float xpos, float ypos) {
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
  SquareSpin(float x, float y) {
    super(x, y);
  }
   void show() {
    pushMatrix();
    translate(((width/2)+x), ((height/2)+y));
    rotate(angle);
    rectMode(CENTER);
    noStroke();
    fill(183, 223, 221, 180);
    rect(x/128, y/128, d, d);
    popMatrix();
  }
}

class CircleSpin extends Spin {
  CircleSpin(float x, float y) {
    super(x, y);
  }
   void show() {
    //pushMatrix();
    //translate(((width/2)+x), ((height/2)+y));
    rotate(angle);
    noFill();
    strokeWeight(2);
    stroke(12, 100, 150);
    ellipseMode(CORNER);
    ellipse(x, y, d, d);
    //popMatrix();
  }
}
