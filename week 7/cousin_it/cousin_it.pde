import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PImage img;

void setup() {
    size( 662, 500 );
    img = loadImage("hair.png");

    opencv = new OpenCV( this );
    opencv.capture( width, height );                   // open video stream
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
}

public void stop() {
    opencv.stop();
    super.stop();
}

void draw() {
    opencv.read();
    opencv.flip( OpenCV.FLIP_HORIZONTAL );

    // proceed detection
    Rectangle[] faces = opencv.detect( 1.2, 3, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

    // display the image
    image( opencv.image(), 0, 0 );

    // draw hair over face
    for( int i=0; i<faces.length; i++ ) {
       image(img, (faces[i].x)-(faces[i].width/2)+15, (faces[i].y)-(faces[i].height/2), (faces[i].width)*2, (faces[i].height)*2); 
    }
}
