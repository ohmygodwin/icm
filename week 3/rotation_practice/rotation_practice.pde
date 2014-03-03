float speed = .01;
float angle = 0;
float d = 40;
float s = d/2;

void setup() {
  size(662, 300);
}

void draw() {
 //for (float angle = 0; angle < 5*PI; angle = angle + (PI / 8)) {
  background(255);
  pushMatrix();
    translate(width/2, height/2);
    angle += speed;
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, s, s);
    
    rect(d, d, s, s);
    rect(d, -d, s, s);
    rect(d, 0, s, s);
    rect(0, d, s, s);
    rect(-d, 0, s, s);
    rect(0, -d, s, s);
    rect(-d, d, s, s);
    
    rect(-d, -d, s, s);
    
    
    popMatrix();
 //}

}

/*
void draw() {
  if (mousePressed) {
    
  }
  
  
}

*/
