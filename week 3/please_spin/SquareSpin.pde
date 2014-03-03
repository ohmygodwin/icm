class SquareSpin {
  
  float speed = random(-0.05, 0.05);
  float angle = 0;
  float d = 20;
  int x, y;
  
  
  
  SquareSpin(int xpos, int ypos) {
    x = xpos;
    y = ypos; 
  }
  
  void go() {
    angle += speed;
  }
  
  void show() {
    pushMatrix();
    translate(((width/2)+x), ((height/2)+y));
    rotate(angle);
    rectMode(CENTER);
    noFill();
    rect(x/128, y/128, d, d);   
    popMatrix();
  }
  
  void updateSize(float size) {
    d = size;
  }
  
}

