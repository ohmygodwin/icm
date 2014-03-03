int radius = 50;

void setup() {
  size(700, 300);
}

void pattern() {
  
noStroke();
fill(148, 140, 68, 230);

for (int x = -50; x < width; x = x + 100) {
  for (int y = -50; y < height; y = y + 100) {
    rect(x, y, 100, 100, radius);
  }
}

for (int a = 0; a < width; a = a + 100) {
  for (int b = 0; b < height; b = b + 100) {
    rect(a, b, 100, 100, radius);
  }
}

}

void draw() {
background(255);
pattern();
}
