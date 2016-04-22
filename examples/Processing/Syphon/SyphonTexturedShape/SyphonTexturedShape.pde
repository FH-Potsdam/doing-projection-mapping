/**
 * This sketch shows how to use an image as a texture
 * on a distorted shape
 * we will write the whole screen to an offscreen buffer
 * and then send the frames to the syphon client
 * author: Fabian "fabiantheblind" Morón Zirfas
 * see https://processing.org/reference/texture_.html
 */
import codeanticode.syphon.*; // import the syphon lib
PGraphics offScreenBuffer; // the canvas we will draw onto
SyphonServer server; // the server object
PImage img;
void settings() {
  size(500, 500, P3D);  // set the size and the renderer. Fits the video size
  // some wired advanced Processing 3 OpenGL setting
  // https://github.com/processing/processing/wiki/Advanced-OpenGL
  PJOGL.profile=1;
}
// the setup runs once
void setup() {
  offScreenBuffer = createGraphics(500, 500, P3D); // create the offscreen canvas
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Grumpy Processing Syphon");
  img = loadImage("grumpy-cat.png");
}
// the draw runs all the time
void draw() {
  offScreenBuffer.beginDraw(); // now start drawing offscreen
  // everything we want to send over as to be called as a child
  // of the offScreenBuffer object
  offScreenBuffer.background(0); // black bg to prevent bleeding
  offScreenBuffer.beginShape();
  offScreenBuffer.texture(img);
  offScreenBuffer.vertex(10, 23, 0, 0); // Upper left 
  offScreenBuffer.vertex(450, 0, 500, 0); // upper right
  offScreenBuffer.vertex(400, 400, 500, 500);// lower right
  offScreenBuffer.vertex(20, 450, 0, 500); // lower left
  offScreenBuffer.endShape();
  offScreenBuffer.endDraw();// thats it.
  image(offScreenBuffer, 0, 0); // this is just for seeing whats going on

  server.sendImage(offScreenBuffer); // now send the current bufferd image to the client(s)
}

// we want a bit of control so we listen to key presses
void keyPressed() {
}