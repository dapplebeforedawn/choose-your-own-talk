# Notes
=======
- Fork off and do the face detection, writing character encoded data to stdout
  - The fork will wait for the pipe to fill, and loop until the write end is closed (never)
- Spawn a process for the camera, redirecting stdout to the write pipe
  - The command line options tell the camera to take 5 pictures/second, streaming to stdout

- Run it: `./facedetect-4.rb | ffmpeg -f mjpeg -r 5 -i - fd4.mp4; mplayer fd4.mpg`, or `<leader>r`
- (for fun: `./facedetect-4.rb | ffmpeg -f mjpeg -r 5 -i - -pix_fmt rgb24 fd4.gif; open fd4.gif`)
