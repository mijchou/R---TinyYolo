# setup

install.packages('rstudioapi')
install.packages('devtools')

devtools::install_github("bnosac/image",
                         subdir = "image.darknet",
                         build_vignettes = TRUE)

library(rstudioapi)
library(devtools)
library(image.darknet)

rstudioapi::getActiveDocumentContext
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# modelling (detect)

yolo_tiny_voc <- image_darknet_model(type = 'detect',
                                     model = 'tiny-yolo-voc.cfg',
                                     weights = system.file(package = 'image.darknet', 'models',
                                                           'tiny-yolo-voc.weights'),
                                     labels = system.file(package = 'image.darknet', 'include',
                                                          'darknet', 'data', 'voc.names'))

airport <- image_darknet_detect(file = "E:/Projects/Tiny-yolo/aucklandairport.jpeg",
                                object = yolo_tiny_voc,
                                threshold = 0.19)

customst <- image_darknet_detect(file = "E:/Projects/Tiny-yolo/customst.jpeg",
                          object = yolo_tiny_voc,
                          threshold = 0.19)

