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
    
    noFill();
    //strokeWeight(3);
    //stroke(255);
    //rect(x/128, y/128, d, d);
    
    strokeWeight(1);
    stroke(0, 64, 151, 200);
    rect(x/128, y/128, d, d);  
    
    popMatrix();
  }
}

class SquareSpin2 extends Spin {
  SquareSpin2(int x, int y) {
    super(x, y);
  }
  
   void show() {
    pushMatrix();
    
    translate(((width/2)+x), ((height/2)+y));
    rotate(angle);
    rectMode(CORNER);
    noStroke();
    fill(166, 118, 96, 100);
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
    noStroke();
    fill(207, 152, 49, 170);
    ellipse(x/128, y/128, d, d);
    popMatrix();
  }
}
