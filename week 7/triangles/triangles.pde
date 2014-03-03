import processing.video.*;

Capture video;
boolean saveMe = false;

Triangle[] triangles = new Triangle[100];

void setup() {
  size(662, 480);
  background(255);

    triangles[0] = new Triangle(-25, -16, -74, 69, 26, 69);
    triangles[1] = new Triangle(-25, -16, 74, -16, 25, 69);
    triangles[2] = new Triangle(74, -16, 123, 69, 25, 69);
    triangles[3] = new Triangle(74, -16, 172, -16, 123, 69);
    triangles[4] = new Triangle(172, -16, 222, 69, 123, 69);
    triangles[5] = new Triangle(172, -16, 271, -16, 222, 69);
    triangles[6] = new Triangle(271, -16, 320, 69, 222, 69);
    triangles[7] = new Triangle(271, -16, 369, -16, 320, 69);
    triangles[8] = new Triangle(369, -16, 418, 69, 320, 69);
    triangles[9] = new Triangle(369, -16, 468, -16, 418, 69);
    triangles[10] = new Triangle(468, -16, 517, 69, 418, 69);
    triangles[11] = new Triangle(468, -16, 566, -16, 517, 69);
    triangles[12] = new Triangle(566, -16, 615, 69, 517, 69);
    triangles[13] = new Triangle(566, -16, 665, -16, 616, 69);
    triangles[14] = new Triangle(665, -16, 714, 69, 615, 69);
    
    triangles[15] = new Triangle(-74, 69, -25, 155, 25, 69);
    triangles[16] = new Triangle(25, 69, -25, 155, 74, 155);
    triangles[17] = new Triangle(25, 69, 74, 155, 123, 69);
    triangles[18] = new Triangle(123, 69, 172, 155, 74, 155);
    triangles[19] = new Triangle(123, 69, 172, 155, 222, 69);
    triangles[20] = new Triangle(222, 69, 271, 155, 172, 155);
    triangles[21] = new Triangle(222, 69, 271, 155, 320, 69);
    triangles[22] = new Triangle(320, 69, 369, 155, 271, 155);
    triangles[23] = new Triangle(320, 69, 369, 155, 418, 69);
    triangles[24] = new Triangle(418, 69, 468, 155, 369, 155);
    triangles[25] = new Triangle(418, 69, 468, 155, 517, 69);
    triangles[26] = new Triangle(517, 69, 566, 155, 468, 155);
    triangles[27] = new Triangle(517, 69, 566, 155, 618, 69);
    triangles[28] = new Triangle(615, 69, 665, 155, 566, 155);
    triangles[29] = new Triangle(665, 155, 714, 69, 615, 69);
    
    triangles[30] = new Triangle(-25, 155, -74, 240, 25, 240);
    triangles[31] = new Triangle(-25, 155, 25, 240, 74, 155);
    triangles[32] = new Triangle(74, 155, 123, 240, 25, 240);
    triangles[33] = new Triangle(74, 155, 123, 240, 172, 155);
    triangles[34] = new Triangle(172, 155, 222, 240, 123, 240);
    triangles[35] = new Triangle(172, 155, 222, 240, 271, 155);
    triangles[36] = new Triangle(271, 155, 320, 240, 222, 240);
    triangles[37] = new Triangle(271, 155, 320, 240, 369, 155);
    triangles[38] = new Triangle(369, 155, 418, 240, 320, 240);
    triangles[39] = new Triangle(369, 155, 418, 240, 468, 155);
    triangles[40] = new Triangle(468, 155, 517, 240, 418, 240);
    triangles[41] = new Triangle(468, 155, 517, 240, 566, 155);
    triangles[42] = new Triangle(566, 155, 615, 240, 517, 241);
    triangles[43] = new Triangle(566, 155, 665, 155, 616, 240);
    triangles[44] = new Triangle(665, 155, 714, 240, 615, 241);
    
    triangles[45] = new Triangle(-74, 240, -25, 325, 25, 240);
    triangles[46] = new Triangle(25, 240, -25, 325, 74, 325);
    triangles[47] = new Triangle(25, 240, 74, 325, 123, 240);
    triangles[48] = new Triangle(123, 240, 172, 325, 74, 325);
    triangles[49] = new Triangle(123, 240, 172, 325, 222, 240);
    triangles[50] = new Triangle(222, 240, 271, 325, 172, 325);
    triangles[51] = new Triangle(222, 240, 271, 325, 320, 240);
    triangles[52] = new Triangle(320, 240, 369, 325, 271, 325);
    triangles[53] = new Triangle(320, 240, 369, 325, 418, 240);
    triangles[54] = new Triangle(418, 240, 468, 325, 369, 325);
    triangles[55] = new Triangle(418, 240, 468, 325, 517, 240);
    triangles[56] = new Triangle(517, 240, 566, 325, 468, 325);
    triangles[57] = new Triangle(517, 240, 566, 325, 616, 240);
    triangles[58] = new Triangle(615, 240, 665, 325, 566, 325);
    triangles[59] = new Triangle(665, 325, 714, 240, 615, 240);
    
    triangles[60] = new Triangle(-25, 325, -74, 411, 26, 411);
    triangles[61] = new Triangle(-25, 325, 25, 411, 74, 325);
    triangles[62] = new Triangle(74, 325, 123, 411, 25, 412);
    triangles[63] = new Triangle(74, 325, 123, 411, 172, 325);
    triangles[64] = new Triangle(172, 325, 222, 411, 123, 412);
    triangles[65] = new Triangle(172, 325, 222, 411, 271, 325);
    triangles[66] = new Triangle(271, 325, 320, 411, 222, 412);
    triangles[67] = new Triangle(271, 325, 320, 411, 369, 325);
    triangles[68] = new Triangle(369, 325, 418, 411, 320, 412);
    triangles[69] = new Triangle(369, 325, 418, 411, 468, 325);
    triangles[70] = new Triangle(468, 325, 518, 411, 418, 412);
    triangles[71] = new Triangle(468, 325, 518, 411, 566, 325);
    triangles[72] = new Triangle(566, 325, 615, 411, 519, 411);
    triangles[73] = new Triangle(566, 325, 665, 325, 616, 412);
    triangles[74] = new Triangle(665, 325, 714, 411, 615, 412);
    
    triangles[75] = new Triangle(-74, 411, -25, 496, 26, 411);
    triangles[76] = new Triangle(-25, 496, 74, 496, 27, 411);
    triangles[77] = new Triangle(123, 411, 74, 496, 25, 411);
    triangles[78] = new Triangle(74, 496, 172, 496, 124, 411);
    triangles[79] = new Triangle(222, 411, 172, 496, 123, 411);
    triangles[80] = new Triangle(172, 496, 271, 496, 223, 411);
    triangles[81] = new Triangle(320, 411, 271, 496, 222, 411);
    triangles[82] = new Triangle(271, 496, 369, 496, 321, 411);
    triangles[83] = new Triangle(418, 411, 369, 496, 320, 411);
    triangles[84] = new Triangle(369, 496, 468, 496, 419, 411);
    triangles[85] = new Triangle(517, 411, 468, 496, 418, 411);
    triangles[86] = new Triangle(468, 496, 566, 496, 518, 411);
    triangles[87] = new Triangle(615, 411, 566, 496, 517, 411);
    triangles[88] = new Triangle(566, 496, 665, 496, 616, 411);
    triangles[89] = new Triangle(714, 411, 665, 496, 615, 411);

  video = new Capture(this, 640, 480);
  video.start();
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  if (keyPressed && key == 's') {
      saveFrame("frame-######.png");
      saveMe = false;
    }
    
  for (int i = 0; i < 90; i++) {
    triangles[i].display();  
  }  
}

