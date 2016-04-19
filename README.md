Doing Projection Mapping
========================

## Introduction  

This document is a write-down for a workshop by [Fabian Morón Zirfas](https://github.com/fabiantheblind) @ [the University of Applied Sciences Potsdam (Germany)](http://www.fh-potsdam.de/) as part of the seminar ["Datenobjekte"](https://incom.org/workspace/6569) (data objects) by [Professor Boris Müller](https://incom.org/profil/99) (a.k.a [@borism](https://twitter.com/borism) on Twitter). We will explore the basics possibilites we have in the field of projection mapping. _This is still work in progress, there might be_ 🐛_,_ 🐉 _and_ 👾_._  



## Prerequisites  

- a computer
- a projector
- Processing  
- HeavyM  

!!!note
    Some of these are optional. Depending on which workflow you are going to use.  

## Source  

These docs are written using [mkdocs](http://www.mkdocs.org/) using the [readthedocs](https://readthedocs.org/) theme by Fabian Morón Zirfas with ♥. See the source on [GitHub.](https://github.com/FH-Potsdam/doing-projection-mapping)  

[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg?style=flat-square)](https://gitter.im/FH-Potsdam/doing-projection-mapping)  

## Creating gifs

The gifs in these docs are created by transfomring a screenrecord with ffmpeg to a sequence. This sequence then gets transformed with ImageMagick to a gif. ffmpeg and ImageMagick can be installde using [homebrew](https://brew.sh).  

Install brew like discribed on their site. Then run:

    brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools
    brew install imagemagick

You should be good to go. 

    ffmpeg -i blender-ui.mp4 -r 20 -vcodec ppm  -s800x600 seq/out%05d.png
    convert -layers Optimize seq/out*.png ../images/blender-ui.gif