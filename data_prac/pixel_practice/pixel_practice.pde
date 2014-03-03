void setup() {
  size(662, 662);
}

void draw() {
  background(0);
  
  for (int i = 0; i <= width; i = i+ 20) {
    for (int j = 0; j <= height; j = j + 20) {
      set(i, j, color(random(30, 100)));
    }
  }
  
  /*
  loadPixels();
  int index = 100 + 200*width;
  pixels[index] = color(0);
  updatePixels();
  */
}
