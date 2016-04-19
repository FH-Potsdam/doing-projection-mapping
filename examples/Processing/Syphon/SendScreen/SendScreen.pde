import codeanticode.syphon.*;

SyphonServer server;

void settings() {
  size(400,400, P3D);
  PJOGL.profile=1;
}

void setup() {
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  noFill();
  background(255);
  lights();
  translate(width/2, height/2, 0);
  
  box(150);
  server.sendScreen();
}