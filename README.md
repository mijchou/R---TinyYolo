# R---TinyYolo

You only look once (YOLO) is a system for image detection built on the Pascal VOC 2012 dataset. It detects the 20 [Pascal](http://host.robots.ox.ac.uk:8080/pascal/VOC/) object classes: person, bird, cat, cow, dog, horse, sheep, aeroplane, bicycle, boat, bus, car, motorbike, train, bottle, chair, dining table, potted plant, sofa and tv/monitor. In the following project we will be building a quick image-detector from the YOLO system:

Setup
=====

tiny-yolo needs to be downloaded from https://github.com/bnosac/image using the devtools of R.

``` r
install.packages('devtools')

devtools::install_github("bnosac/image",
                         subdir = "image.darknet",
                         build_vignettes = TRUE)
                     
library(devtools)
library(image.darknet)
```

Model Calling
=============

We will be using 2 random photos I took!

![photo1](/aucklandairport.jpeg) <br>
![photo2](/customst.jpeg)

Detection will be done through the function *image_darknet_model()*. <br>
Two options for the *type* argument--detect and classify. <br>
**Detect**: detect objects recognized in the photo. <br>
**Classify**: classify what the object present in the photo is.

Models Available for selections: <br>
**detection**: YOLO, YOLO tiny trained on VOC and on COCO <br>
**classification**: Alexnet, Darknet, VGG-16, Extraction(GoogleNet), Darknet19, Darknet19_448, Tiny Darknet trained on Imagenet

``` r
yolo_tiny_voc <- image_darknet_model(type = 'detect',
                                     model = 'tiny-yolo-voc.cfg',
                                     weights = system.file(package = 'image.darknet', 'models',
                                                           'tiny-yolo-voc.weights'),
                                     labels = system.file(package = 'image.darknet', 'include',
                                                          'darknet', 'data', 'voc.names'))
```

Detection
=========

Now we can load in the photos. Note that with *image_darknet_detect()* only absolute file paths are accepted.

``` r

airport <- image_darknet_detect(file = "E:/Projects/Tiny-yolo/aucklandairport.jpeg",
                                object = yolo_tiny_voc,
                                threshold = 0.19)

customst <- image_darknet_detect(file = "E:/Projects/Tiny-yolo/customst.jpeg",
                          object = yolo_tiny_voc,
                          threshold = 0.19)
```

Results
=======

![photo1p](/predictions_airp.png) <br>
![photo2p](/predictions_cust.png)


Looking Awesome!!

(to be continued...)
