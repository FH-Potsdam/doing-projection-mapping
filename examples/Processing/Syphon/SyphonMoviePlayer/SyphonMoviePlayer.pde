import codeanticode.syphon.*;
import processing.video.*;

PGraphics canvas;
SyphonServer server;
Movie mov;
boolean isPlaying = false;

void settings() {
  size(500, 500, P3D);
  PJOGL.profile=1;
}

void setup() { 
  canvas = createGraphics(500, 500, P3D);
  mov = new Movie(this, "cube-inset-h264.mov");
  mov.frameRate(25);
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  mov.play();// we need to start the movie once
  mov.jump(0);// go to the first frame
  mov.pause(); // and hold it until we hit p
}

void draw() {
  canvas.beginDraw();
  canvas.background(0);
  canvas.image(mov, 0, 0);
  canvas.endDraw();
  image(canvas, 0, 0);
  if (mov.time() == mov.duration()) {
    mov.jump(0);
  }
  server.sendImage(canvas);
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    // play/pause the movie on keypress
    if (isPlaying == false) {
      mov.play();
      isPlaying = true;
    } else {
      mov.pause();
      isPlaying = false;
    }
  }
}