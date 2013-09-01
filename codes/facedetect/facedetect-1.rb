#!/usr/bin/env ruby

require 'opencv'
include OpenCV

CASCADE       = './data/haarcascades/haarcascade_frontalface_alt.xml'
DETECTOR      = CvHaarClassifierCascade::load(CASCADE)
IMAGE_MASK    = CV_LOAD_IMAGE_ANYCOLOR | CV_LOAD_IMAGE_ANYDEPTH
SOURCE_IMAGE  = '../../images/arrested_development.jpg'
OVERLAY       = 'images/laughing_man.png'
OUTPUT        = 'fd1-output.png'
cv_image      = IplImage.load SOURCE_IMAGE, IMAGE_MASK

DETECTOR.detect_objects(cv_image).inject(SOURCE_IMAGE) do |memo, region|
  origin = region.top_left
  `composite #{OVERLAY} \
    -geometry "#{region.width}x#{region.height}+#{origin.x}+#{origin.y}"\
    #{memo} #{OUTPUT}`
  OUTPUT 
end
