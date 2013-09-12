# Notes
=======
 - A very small rack application
 - Keg status is read in from an `xbee-hex.rb` program.
 - Then passed through a pipe to the list of values.
 - When a web request is issued the top request is returned.

Start the server with:
 `open "http://localhost:9292"; rackup`, or `<leader>r`
