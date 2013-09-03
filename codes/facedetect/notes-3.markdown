# Notes
=======

Having the camera program output its image to stdout we can capture the image without a temp file!

stdout comes in as a text stream, so we use ruby's String#bytes to get the bytes that the string represents.

run it: `./facedetect-3.rb; open fd1-output.png`, or `<leader>r`
