void setup() {
  size(662,300);
  background(255);
}


/*
void img(float x, float y) {
 noFill();
 ellipse(x,y,50,50); 
 ellipse(x+25,y+25,50,50); 
}

*/

void img() {
 noFill();
 ellipse(mouseX,mouseY,50,50); 
 ellipse(mouseX+25,mouseY+25,50,50); 
}

void draw() {
  if (mousePressed == true) {
    img();
  }
}

/*

void draw() {
  background(255);
  
  for (int x = -50; x < width; x = x + 100) {
  for (int y = -50; y < height; y = y + 100) {
    img(x, y);
  }
}

for (int a = 0; a < width; a = a + 100) {
  for (int b = 0; b < height; b = b + 100) {
    img(a, b);
  }
}
  
}

*/


