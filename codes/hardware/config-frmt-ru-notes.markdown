# Notes
=======
 - Put the response from `xbee-hex-frmt.rb` in an `<img>`
 - Spawn `xbee-hex-frmt.rb` with the:
  - the `-i` flag to use the image formatter
  - the `-c` flag to supress the counter
 - Tell rack to server static assets from `/imags`

Run it with: `open "http://localhost:9292"; rackup config-frmt.ru` or `<leader>r`

