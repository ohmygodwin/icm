float bbycircle;
float bbycircle2;
float radius;
float blue;
boolean saveMe = false;

void setup() {
 size(662, 300);
 background(255);
}

void draw() {
  if (keyPressed && key == 's') {
    saveFrame("frame-######.png");
    saveMe = false;
  }
  
 noStroke();
 fill(blue,200,150);
 filter(BLUR, 1);
 ellipse(bbycircle,bbycircle2,radius,radius);
 
 blue = random(0,255);
 bbycircle = random(width);
 bbycircle2 = random(height);
 radius = random(3, 8);
}
