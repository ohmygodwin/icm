import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

// Reference to physics world
VerletPhysics2D physics;

// A list of cluster objects
ArrayList clusters;

// Boolean that indicates whether we draw connections or not
boolean showPhysics = true;
boolean showParticles = true;

//SquareSpin[][] square = new SquareSpin[13][13];
//CircleSpin[][] circle = new CircleSpin[13][13];
int distance = 60;

void setup() { 
 size(662, 662);
 
 smooth();
 frameRate(30);
 
   // Initialize the physics
  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(10,10,width-20,height-20));

  // Spawn a new random graph
  newGraph();
 /*
 for (int a = 0; a <= width + distance; a = a + distance) {
  for (int b = 0; b <= height + distance; b = b + distance) {
    square[a/distance][b/distance] = new SquareSpin(a-320, b-320);
    circle[a/distance][b/distance] = new CircleSpin(a-320, b-320);
  }
 }
 */
}

// Spawn a new random graph
void newGraph() {

  // Clear physics
  physics.clear();

  // Create new ArrayList (clears old one)
  clusters = new ArrayList();

  // Create 8 random clusters
  for (int i = 0; i < 8; i++) {
    Vec2D center = new Vec2D(width/2,height/2);
    clusters.add(new Cluster((int) random(3,8),random(20,100),center));
  }

  //  All clusters connect to all clusters  
  for (int i = 0; i < clusters.size(); i++) {
    for (int j = i+1; j < clusters.size(); j++) {
      Cluster ci = (Cluster) clusters.get(i);
      Cluster cj = (Cluster) clusters.get(j);
      ci.connect(cj);
    }
  }

}

void draw() {
 background(54, 161, 104);
 //frameRate(1);
 
 // Update the physics world
  physics.update();

  // Display all points
  if (showParticles) {
    for (int i = 0; i < clusters.size(); i++) {
      Cluster c = (Cluster) clusters.get(i);
      c.display();
    }
  }

  // If we want to see the physics
  if (showPhysics) {
    for (int i = 0; i < clusters.size(); i++) {
      // Cluster internal connections
      Cluster ci = (Cluster) clusters.get(i);
      ci.showConnections();

      // Cluster connections to other clusters
      for (int j = i+1; j < clusters.size(); j++) {
        Cluster cj = (Cluster) clusters.get(j);
        ci.showConnections(cj);
      }
    }
  }
}
