float bbycircle;
float bbycircle2;
float speed = 3;

void setup() {
 size(662, 300);
 background(255);
}

void draw() {
 noStroke();
 fill(0);
 ellipse(bbycircle,bbycircle2,32,32);
 if (bbycircle >= width) {
 
 }
bbycircle = bbycircle + speed;
}
