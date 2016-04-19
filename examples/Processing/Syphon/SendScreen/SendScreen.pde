import codeanticode.syphon.*; // import the library
SyphonServer server; // create a syphon server object

// https://processing.org/reference/settings_.html
// The settings() method runs before the sketch has been set up,
// so other Processing functions cannot be used at that point.
void settings() {
  size(400,400, P3D); // set the size and the renderer
  // some wired advanced Processing 3 OpenGL setting
  // https://github.com/processing/processing/wiki/Advanced-OpenGL
  PJOGL.profile=1;
}

// the setup runs once
void setup() {
  // Create syhpon server to send frames out to other client(s)
  server = new SyphonServer(this, "Processing Syphon");
}
// the draw runs all the time
void draw() {
  noFill();// no fill
  background(255);// white bg
  lights(); // add some light
  translate(width/2, height/2, 0); // move the matrix

  box(150); // draw a box
  server.sendScreen(); // now send all that to client(s)
}