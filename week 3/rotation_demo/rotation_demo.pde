float x;
float y;
float a;

void setup() {
 size(662,300);
}

void draw() {
 background(255);
 
 pushMatrix();
 
 translate(x,y);
 rotate(a);
 
 fill(255,0,0,150);
 noStroke();
 rect(30, 20, 85, 75);
 rect(60, 50, 95, 85);
 rect(90, 80, 25, 15);
 
 popMatrix();
 
 a = a + 0.05;
 
 x = random(width);
 y = random(height);
 
}
