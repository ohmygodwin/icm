class Triangle {
  float x1, y1, x2, y2, x3, y3;

  Triangle(float x1_, float y1_, float x2_, float y2_, float x3_, float y3_) {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    x3 = x3_;
    y3 = y3_;
  }

  void display() {
    color c = video.get(int(x3),int(y3));
    
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    
    noStroke();
    fill(r,g,b);
    triangle(x1, y1, x2, y2, x3, y3);
  }
}

