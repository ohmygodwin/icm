import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;

Particle p1 = new Particle(new Vec2D(100,20));
Particle p2 = new Particle(new Vec2D(100,180));
 
void setup() {
  size(662, 662);
  physics = new VerletPhysics2D();
}

void draw() {
  background(255);
  physics.update();
  physics.addParticle(p1);
  physics.addParticle(p2);
}
