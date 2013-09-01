# Notes:
========
Loads the source and overlay images
  - Let OpenCV do the overlay for us
  - Transparency overlay requires same-size images
    - Use the "region of interest" to get same sized images
    - Copy the now alpha-free region over top of the source

Run it with `./facedetect-2.rb; open fd2-output.jpg`, or `<leader>r`
