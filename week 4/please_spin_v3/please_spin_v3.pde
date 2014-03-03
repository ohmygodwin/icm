int squareCount = 0;
int circleCount = 0;
SquareSpin[] square = new SquareSpin[300];
CircleSpin[] circle = new CircleSpin[300];

void setup() { 
  size(662, 662);
 for (int a = -320; a <= 320; a = a + 40) {
  for (int b = -320; b <= 320; b = b + 40) {
    square[squareCount] = new SquareSpin(a, b);
    squareCount++;
  }
 }

 for (int c = -320; c <= 320; c = c + 40) {
  for (int d = -320; d <= 320; d = d + 40) {
    circle[circleCount] = new CircleSpin(c, d);
    circleCount++;
  }
 } 
}

void draw() {
 background(220, 155, 127);
 pushMatrix();
 translate(width/128, height/128);
 
 int f = 0;
 int j = 0;
 float d = map(mouseX, 0, width, 7, 70);
 float d2 = map(mouseY, 0, height, 7, 70);
 
  while (f < squareCount) {
   square[f].go();
   square[f].show();
   square[f].updateSize(d);
   f++; 
 }

 while (j < circleCount) {
   circle[j].go();
   circle[j].show();
   circle[j].updateSize(d2);
   j++;
 }
popMatrix();
}
