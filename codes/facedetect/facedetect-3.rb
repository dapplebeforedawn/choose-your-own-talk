#!/usr/bin/env ruby

require 'opencv'
include OpenCV
require './lib/cover'

IMAGE_MASK      = CV_LOAD_IMAGE_ANYCOLOR | CV_LOAD_IMAGE_ANYDEPTH
CAMERA          = 'vendor/imagesnap/imagesnap'
OVER_IMAGE      = 'images/laughing_man.png'
OUTPUT          = 'fd3-output.jpg'
cv_over_image   = IplImage.load OVER_IMAGE, IMAGE_MASK

image_data = `#{CAMERA} -`
cv_image   = IplImage.decode(image_data.bytes.to_a)

# Block of code for face detection and overlay moved to
# lib/cover.rb
Cover.faces!(cv_image, cv_over_image)

cv_image.save_image(OUTPUT)
