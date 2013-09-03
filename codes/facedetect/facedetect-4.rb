#!/usr/bin/env ruby

require 'opencv'
include OpenCV
require './lib/cover'

IMAGE_MASK      = CV_LOAD_IMAGE_ANYCOLOR | CV_LOAD_IMAGE_ANYDEPTH
IMAGE_SEP       = "vvvvv"
CAMERA          = 'vendor/imagesnap/imagesnap_lorenz_stream'
OVER_IMAGE      = 'images/laughing_man.png'
cv_over_image   = IplImage.load OVER_IMAGE, IMAGE_MASK
rd, wr          = IO.pipe

fork do
  rd.lines(IMAGE_SEP) do |image_string|
    cv_image = IplImage.decode(image_string.bytes.to_a)
    
    Cover.faces!(cv_image, cv_over_image)

    $stdout.write cv_image.encode_image('.jpg').pack('C*')
  end
end

pid = spawn "#{CAMERA} - -t 0.2",  out: wr
Process.wait pid
