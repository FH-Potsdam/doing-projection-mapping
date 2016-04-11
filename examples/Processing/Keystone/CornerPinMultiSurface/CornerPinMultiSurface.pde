
/**
 * This is a simple example of how to use the Keystone library.
 *
 * To use this example in the real world, you need a projector
 * and a surface you want to project your Processing sketch onto.
 *
 * Simply drag the corners of the CornerPinSurface so that they
 * match the physical surface's corners. The result will be an
 * undistorted projection, regardless of projector position or 
 * orientation.
 *
 * You can also create more than one Surface object, and project
 * onto multiple flat surfaces using a single projector.
 *
 * This extra flexbility can comes at the sacrifice of more or 
 * less pixel resolution, depending on your projector and how
 * many surfaces you want to map. 
 */

import deadpixel.keystone.*;

Keystone ks; // the Keystone object
CornerPinSurface surfaceOne; // our first surface
CornerPinSurface surfaceTwo; // the second surface

PGraphics offscreenOne; // offscreen buffer one
PGraphics offscreenTwo; // offscreen buffer two

// this is just for having something on the surfaces
int x = 0;
int y = 150;


void setup() {
  // Keystone will only work with P3D or OPENGL renderers, 
  // since it relies on texture mapping to deform
  size(800, 600, P3D);

  ks = new Keystone(this); // init the Keystone library
  surfaceOne = ks.createCornerPinSurface(400, 300, 20); // create the first surface
  surfaceTwo = ks.createCornerPinSurface(400, 300, 20); // and the second
  // We need an offscreen buffer to draw the surface we
  // want projected
  // note that we're matching the resolution of the
  // CornerPinSurface.
  // (The offscreen buffer can be P2D or P3D)
  offscreenOne = createGraphics(400, 300, P3D); 
  offscreenTwo = createGraphics(400, 300, P3D);
}

void draw() {

  // Draw the scene, on offscreen buffer one
  offscreenOne.beginDraw();
  offscreenOne.background(255);
  offscreenOne.fill(0, 255, 0);
  offscreenOne.ellipse(x, y, 20, 20);
  offscreenOne.endDraw();
  // Draw the scene, on offscreen buffer two
  offscreenTwo.beginDraw();
  offscreenTwo.background(255);
  offscreenTwo.fill(0, 255, 0);
  offscreenTwo.ellipse(x - 400, y, 20, 20);
  offscreenTwo.endDraw();
  // most likely, you'll want a black background to minimize
  // bleeding around your projection area
  background(0);

  // render the scene, transformed using the corner pin surface
  surfaceOne.render(offscreenOne);
  surfaceTwo.render(offscreenTwo);
  // this is just for having the ellipse wander over the surfaces
  x++;
  if (x >= 800) {
    x = 0;
  }
}

void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  }
}