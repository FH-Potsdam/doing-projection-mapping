Syphon is a framework, written by [Tom Butterworth](http://kriss.cx/tom/) and [Anton Marini](http://vade.info/), that allows applications to share frames (full frame rate video or stills) with one another in realtime. In our example we will use Processing to send simple animations to HeavyM. You always will have a "Syphon Server" and a "Syphon Client". In our case the server is our Processing applet and the client is HeavyM.  

### Processing Setup  

Download and install Processing 3 and go to "Sketch > Import Library… > Add Library". Search in the Library Manager for "Syphon". Hit install and restart Processing.  

[![](images/add-lib-syphon-processing.png)](images/add-lib-syphon-processing.png)  

####SendScreen

This example is the same as provided by the library's author. It sends the whole screen to the client. This example is fairly simple. Just read the [source code](https://github.com/FH-Potsdam/doing-projection-mapping/blob/master/examples/Processing/Syphon/SendScreen/SendScreen.pde).  

[![](images/processing-syphon-sendscreen.png)](images/processing-syphon-sendscreen.png)  

!!!note
    There are currently some OpenGL problems with this sketch und Processing 3. When trying to send video images and textured 3D PShapes to the client it does not generate any output on the client side. If you want video or textured PShapes take a look at the SyphonMoviePlayer example.  

#### SyphonMoviePlayer

To be able to control videos from key inputs we can use Processing to play the video. Then we send the single frames to the client(s). In this case we are going to draw the video frame by frame into an offscreen buffer (a PGraphics object) and then send these buffered images to the client(s). The process is pretty similar to what is done with the [Keystone library](processing-keystone/).  

| Key    | Action           |
| :---   | :---             |
| p or P | Play/Pause Video |

[![](images/syphon-processing-player.gif)](images/syphon-processing-player.gif)  

Read the [source code here](https://github.com/FH-Potsdam/doing-projection-mapping/blob/master/examples/Processing/Syphon/SyphonMoviePlayer/SyphonMoviePlayer.pde).  

#### SyphonTexturedShape

This sketch shows how to load an image as a texture for a distorted PShape. The frames also get written into an offscreen buffer. Then they are passed on to the client(s). This allows us to distort an image or shape in Processing before sending it to HeavyM.  

[![](images/heavym-projection-SyphonTexturedShape.png)](images/heavym-projection-SyphonTexturedShape.png)  

[![](images/processing-window-SyphonTexturedShape.png)](images/processing-window-SyphonTexturedShape.png)  

Read the [source code here](https://github.com/FH-Potsdam/doing-projection-mapping/blob/master/examples/Processing/Syphon/SyphonTexturedShape/SyphonTexturedShape.pde).  
