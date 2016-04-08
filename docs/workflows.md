There are several different workflows to map video, images or even effects onto objects. Unfortunately the top notch applications are pretty expensive and the open source applications are not that user friendly to use them in a workshop like this. Fortunatly we found an application called HeavyM which was baked by a Kickstarter campaign. They released a beta version of their application for free and will soon provide an extended verison for a reasonable price. For the hackers among us there are also other possibilites like Processing or openFrameworks or a combination of both with Syphon or Spout input output and what not.  

Keep in mind that there are limitations we can't overcome.

The depth of an object. A projector has only a limited range where the image is crisp. If you try to distort the projection to much it wont look good.  

The computing power of your machine. To many inputs will spin up your CPU and GPU and everything will be slow.  

The state of the HeavyM software. Even though HeavyM (Live) is good, it is still pretty young. There might be crashes from improper usage or bugs.  

Triangles versus rectangles. 3D objects consist of a lot of triangles. Video or images are rectangular. That means you will have to plan accordingly to create quality distortions. Often it is usefull to distort or mask your image before mapping it onto an real object.  

### Workflow HeavyM Beta  

This is the most straight forward way. You can construct from within the interface of HeavyM triangles and rectangles that match your object. There are 20 build in effects and you can have up to 3 different videos that you can load and play on your object. This means you have to plan accordingly and prepare your video footage to match that criteria.  

- Video Editor ⇒ Video (H264 compression works fine) 
- HeavyM Beta ⇒ Object  

### Workflow HeavyM Live  

Using the Live version is a bit more sophistivated. You also can construct your mapping from within the interface but with a lot more options and enhanced editing capabilities. There are 50 build in effects and you can have a unlimited number of videos. You still need to plan your output but you can have more control over what you are projecting.  

- Video Editor ⇒ Video (H264 compression works fine) 
- HeavyM Live ⇒ Object  

### Workflow Processing  

If you know how to program you have the possibility to use the Processing environment to create your scene. There is robust library called Keystone that allows you distort and map your output. There are some limitations to that. For example there is no triangular surface. All surfaces are rectangular. This way is not that simple as having a tool like HeavyM but opens up more possibilites. You could for example trigger animations from key strokes or even hack a keyboard to create step or touch triggers. Also using microcontrollers is a possibility. The sky is the limit for this.  

- Video Editor ⇒ Video (H264 compression works fine)  
- Video + Graphics ⇒ Processing  
- Processing ⇒ Object  

### Workflow HeavyM Live + Syphon/Spout  

This approach is also not that straight forward as using just one software tool but gives you endless possibilites of of combinations. Syphon and Spout are both technologies that allow applications to share live video or images directly via the GPU. There are a lot of Syphon/Spout enabled applications. For example Resolume, MadMapper, Millumin, After Effects and even libraries for Processing and openFrameworks.  

Feel free to contribute any additional information about your workflow on the [issues of this repo](https://github.com/FH-Potsdam/doing-projection-mapping/issues).  
