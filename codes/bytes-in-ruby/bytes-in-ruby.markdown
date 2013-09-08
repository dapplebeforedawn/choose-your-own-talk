# Working with raw bytes in Ruby

Like highschool math, "I'm never going to need this"  (hint: yes, you will)
  - Interfacing with c-language libraries 
  - Working with hardware
  - Working with non-ascii file formats (e.g. jpeg images)

It comes down to two methods!
  - `String#hex`    Take a string that looks like a hex number and make it a number
  - `String#unpack` If you have a string that's representing binary data ("This looks like giberish")
  - `Array#pack`    Turn an array of byte values (numbers) in a string equivalent suitable for stdout

## Examples:
  - `String#hex`
    ```ruby
    "FF".hex   #=> 255
    ```

  - `String#unpack`
    Needs an argument to know how many bits make up each array element.
    I got this string by opening a .gif file with VIM. "C*" is probably the directive
    you want for uncode strings. `C` is " 8-bit unsigned".  Hence the "8" in "UTF8".
    ```ruby
    "û±]".unpack('C*') #=> [195, 187, 16, 194, 149, 28, 194, 135, 194, 177, 93]
    ```

  - `Array#pack`
    Take a jpg encoded image, and turn it into UTF8 for streaming to stdout
    ```ruby
    $stdout.write cv_image.encode_image('.jpg').pack('C*')  #=> t1'b°L
    
    # or
   
    [195, 187, 16, 194, 149, 28, 194, 135, 194, 177, 93].pack('C*')  #=> û±]
    ```
