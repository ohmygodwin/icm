SquareSpin[][] square = new SquareSpin[13][13];
CircleSpin[][] circle = new CircleSpin[13][13];
int distance = 60;

void setup() { 
 size(662, 662);
 
 for (int a = 0; a <= width + distance; a = a + distance) {
  for (int b = 0; b <= height + distance; b = b + distance) {
    square[a/distance][b/distance] = new SquareSpin(a-320, b-320);
    circle[a/distance][b/distance] = new CircleSpin(a-320, b-320);
  }
 }
}

void draw() {
 background(54, 161, 104);
 filter(INVERT);
 //frameRate(1);
 pushMatrix();
 translate(width/128, height/128);
 
 float f = map(mouseX, 0, width, 7, 100);
 float g = map(mouseY, 0, height, 7, 100);
 
for (SquareSpin[] i : square) {
 for (SquareSpin square : i) {
   square.go();
   square.show();
   square.updateSize(f);
 }
}

for (CircleSpin[] i : circle) {
 for (CircleSpin circle : i) {
   circle.go();
   circle.show();
   circle.updateSize(g);
 }
}
 
popMatrix();
}
