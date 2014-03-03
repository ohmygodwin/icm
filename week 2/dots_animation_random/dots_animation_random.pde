float x;
float y;
float radius;
float gray;
float t;
float z;
boolean saveMe = false;

void setup() {
 size(680, 330);
}

void draw() {
 background(40);
 noStroke();
 fill(gray);
 ellipse(x,y,radius,radius);
 
 if (keyPressed && key == 's') {
    saveFrame("frame-######.png");
    saveMe = false;
  }
 
 gray = random(40,255);
 
 x = random(width);
 y = random(height);
 
 //x = map(noise(t), 0, 1, 0, width);
 //t = t - 1;
 //y = map(noise(z), 0, 1, 0, height);
 //z = z + 1;
 
 radius = random(4);
}
