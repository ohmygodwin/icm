Body b;

float gravity = 0.2;  

void setup() {
  size(320,240);
  b = new Body();
}

void draw() {
  background(0);
  b.update();
  b.display();
  b.edges();
}








