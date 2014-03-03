int squareCount = 0;
int circleCount = 0;
int squareCount2 = 0;

SquareSpin[] square = new SquareSpin[300];
CircleSpin[] circle = new CircleSpin[300];
SquareSpin2[] square2 = new SquareSpin2[300];

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
 /*
 for (int a2 = -320; a2 <= 320; a2 = a2 + 40) {
  for (int b2 = -320; b2 <= 320; b2 = b2 + 40) {
    square2[squareCount2] = new SquareSpin2(a2, b2);
    squareCount2++;
  }
 }
 */
 
}

void draw() {
 background(255, 233, 225);
 pushMatrix();
 translate(width/128, height/128);
 
 //mapping the mouse position to the size of the square
 int f = 0;
 int f2 = 0;
 int j = 0;
 float d = map(mouseX, 0, width, 7, 70);
 float d2 = map(mouseY, 0, height, 7, 70);
 float d3 = map(mouseX, 0, width, 4, 50);
 
 /*
 while (f2 < squareCount2) {
   square2[f2].go();
   square2[f2].show();
  square2[f2].updateSize(d3);
   f2++;
 }
 */
 
 while (j < circleCount) {
   circle[j].go();
   circle[j].show();
  circle[j].updateSize(d2);
   j++;
 }
 
  while (f < squareCount) {
   square[f].go();
   square[f].show();
  square[f].updateSize(d);
   f++;
 }
 
popMatrix();
}
