/**
 * <p>A soft pendulum (series of connected springs)<br/>
 * <a href="http://www.shiffman.net/teaching/nature/toxiclibs/">The Nature of Code</a><br/>
 * Spring 2010</p>
 */

/* 
 * Copyright (c) 2010 Daniel Schiffmann
 * 
 * This demo & library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
 
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

// Reference to physics "world" (2D)
VerletPhysics2D physics;

// Our "Chain" object
Chain chain, chain2, chain3;

void setup() {
  size(662, 331);
  smooth();

  // Initialize the physics world
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0,0.1)));
  physics.setWorldBounds(new Rect(0,0,width,height));

  // Initialize the chain
  chain = new Chain(300,20,30,0.2, width/2);
  //chain2 = new Chain(200,20,20,0.2, 120);
  //chain3 = new Chain(300,20,10,0.2, 300);

}

void draw() {
  background(0);
 
  // Update physics
  physics.update();
  // Update chain's tail according to mouse location 
  chain.updateTail(mouseX,mouseY);
  //chain2.updateTail(mouseX,mouseY);
  //chain3.updateTail(mouseX,mouseY);
  // Display chain
  chain.display();
  //chain2.display();
  //chain3.display();
}

void mousePressed() {
  // Check to see if we're grabbing the chain
  chain.contains(mouseX,mouseY);
  //chain2.contains(mouseX,mouseY);
  //chain3.contains(mouseX,mouseY);
}

void mouseReleased() {
  // Release the chain
  chain.release();
  //chain2.release();
  //chain3.release();
}

