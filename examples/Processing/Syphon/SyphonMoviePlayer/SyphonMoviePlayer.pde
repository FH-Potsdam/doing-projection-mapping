import codeanticode.syphon.*; // import the syphon lib
import processing.video.*; // import the video lib

PGraphics offScreenBuffer; // the canvas we will draw onto
SyphonServer server; // the server object
Movie mov; // will hold our movie file
boolean isPlaying = false; // this is for starting stopping the vide

void settings() {
  size(500, 500, P3D);  // set the size and the renderer. Fits the video size
  // some wired advanced Processing 3 OpenGL setting
  // https://github.com/processing/processing/wiki/Advanced-OpenGL
  PJOGL.profile=1;
}
// the setup runs once
void setup() {
  offScreenBuffer = createGraphics(500, 500, P3D); // create the offscreen canvas
  mov = new Movie(this, "cube-inset-h264.mov"); // load the movie from the data folder
  mov.frameRate(25); // set a fixed framerate
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  mov.play();// we need to start the movie once
  mov.jump(0);// go to the first frame
  mov.pause(); // and hold it until we hit p
}
// the draw runs all the time
void draw() {
  offScreenBuffer.beginDraw(); // now start drawing offscreen
  // everything we want to send over as to be called as a child
  // of the offScreenBuffer object
  offScreenBuffer.background(0); // black bg to prevent bleeding
  offScreenBuffer.image(mov, 0, 0); // draw the current frame of the video
  offScreenBuffer.endDraw();// thats it.
  image(offScreenBuffer, 0, 0); // this is just for seeing whats going on
  // if we are at the end of the video
  if (mov.time() == mov.duration()) {
    mov.jump(0); // jump back to frame 0
  }
  server.sendImage(offScreenBuffer); // now send the current bufferd image to the client(s)
}
// this is just to read the movie every frame
void movieEvent(Movie m) {
  m.read();
}
// we want a bit of control so we listen to key presses
void keyPressed() {
  // if key p or P is pressed
  if (key == 'p' || key == 'P') {
    // play/pause the movie on keypress
    if (isPlaying == false) {
      // if the movie is not playing
      mov.play(); // play it
      isPlaying = true; //and toggle the boolean
    } else {
      mov.pause(); // stop it if it is playing
      isPlaying = false; // toggle the boolean
    }
  }
}