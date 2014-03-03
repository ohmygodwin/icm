/* control the size of the squares by moving your mouse to the right or left! */

int count = 0;

SquareSpin[] square = new SquareSpin[300];

void setup() { 
  size(662, 662);
 
 //oh my god, i can't believe i'm about to use loops in loops like this...
 for (int a = -320; a <= 320; a = a + 40) {
  for (int b = -320; b <= 320; b = b + 40) {
    square[count] = new SquareSpin(a, b);
    count++;
  }
 }
 //amazing!!
 
}

void draw() {
 background(255);
 pushMatrix();
 translate(width/128, height/128);
 
 //mapping the mouse position to the size of the square
 int f = 0;
 float d = map(mouseX, 0, width, 5, 100);

 while (f < count) {
   square[f].go();
   square[f].show();
  square[f].updateSize(d);
   f++;
 }
 
popMatrix();
}
