float bbycircle;
float bbycircle2;
float speed = 6;
float speed2 = 12;
boolean saveMe = false;

void setup() {
 size(662, 304);
 background(255);
}

void draw() {
if (keyPressed && key == 's') {
    saveFrame("frame-######.png");
    saveMe = false;
  }
  
 bbycircle = bbycircle + speed;
 bbycircle2 = bbycircle2 + speed2;
 
 if ((bbycircle > width) || (bbycircle < 0)) {
 speed = -speed;
 }
 
 if ((bbycircle2 > height) || (bbycircle2 < 0)) {
 speed2 = -speed2;
 }
 
 stroke(255,0,0);
 fill(255);
 ellipse(bbycircle,bbycircle2,5,5);
 
}

void mouseClicked(){
setup();
}
