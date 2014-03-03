// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Toxiclibs example

// A soft pendulum (series of connected springs)

class Chain {

  // Chain properties
  float totalLength;  // How long
  int numPoints;      // How many points
  float strength;     // Strength of springs
  float radius;       // Radius of ball at tail
  float xpos;         // x position of head

  // Let's keep an extra reference to the tail particle
  // This is just the last particle in the ArrayList
  VerletParticle2D tail;

  // Some variables for mouse dragging
  PVector offset = new PVector();
  boolean dragged = false;

  // Chain constructor
  Chain(float l, int n, float r, float s, float x) {

    totalLength = l;
    numPoints = n;
    radius = r;
    strength = s;
    xpos = x;

    float len = totalLength / numPoints;

    // Here is the real work, go through and add particles to the chain itself
    for(int i=0; i < numPoints; i++) {
      // Make a new particle with an initial starting location
      VerletParticle2D particle=new VerletParticle2D(xpos,i*len);

      // Redundancy, we put the particles both in physics and in our own ArrayList
      physics.addParticle(particle);

      // Connect the particles with a Spring (except for the head)
      if (i>0) {
        VerletParticle2D previous = physics.particles.get(i-1);
        VerletSpring2D spring=new VerletSpring2D(particle,previous,len,strength);
        // Add the spring to the physics world
        physics.addSpring(spring);

      }
    }

    // Keep the top fixed
    VerletParticle2D head=physics.particles.get(0);
    head.lock();

    // Store reference to the tail
    tail = physics.particles.get(numPoints-1);
    tail.lock();  
  }

  // Check if a point is within the ball at the end of the chain
  // If so, set dragged = true;
  void contains(int x, int y) {
    for (int i = 5; i < numPoints; i++) {
    VerletParticle2D current = physics.particles.get(i);
    float d = dist(x,y,current.x,current.y);
    
    if (d < radius) {
      offset.x = tail.x - x;
      offset.y = tail.y - y;
      tail.lock();
      dragged = true;
    }
    }
  }

  // Release the ball
  void release() {
    //tail.unlock();
    dragged = false;
  }

  // Update tail location if being dragged
  void updateTail(int x, int y) {
    if (dragged) {
      tail.set(x+offset.x,y+offset.y);
    }
  }

  // Draw the chain
  void display() {
    // Draw line connecting all points
    for(int i=0; i < physics.particles.size()-1; i++) {
      VerletParticle2D p1 = physics.particles.get(i);
      VerletParticle2D p2 = physics.particles.get(i+1);
      stroke(255);
      line(p1.x,p1.y,p2.x,p2.y);
    }
  }
}
