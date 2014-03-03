// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Toxiclibs example: http://toxiclibs.org/

// Force directed graph
// Heavily based on: http://code.google.com/p/fidgen/

// Notice how we are using inheritance here!
// We could have just stored a reference to a VerletParticle object
// inside the Node class, but inheritance is a nice alternative

class Node extends VerletParticle2D {

  Node(Vec2D pos) {
    super(pos);
  }
  ArrayList<CircleSpin> circles;
  
  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
    //fill(0,150);
    //stroke(0);
    //ellipse(x,y,16,16);
    
    circles = new ArrayList<CircleSpin>();
    circles.add(new CircleSpin(x, y));
    
    for (int i = 0; i < circles.size(); i++) {
      CircleSpin cir = circles.get(i);
      cir.go();
      cir.show();
    }
  }
  
  ArrayList getCircles() {
    return circles;
  }
}

