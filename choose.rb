#! /usr/bin/env ruby

require 'stringio'

def slow_print str
  StringIO.new(str).each_char do |chr|
    print chr
    sleep 0.05
  end
end

`./term.sh hugemistake.png`
slow_print "hi, what's your name? "
`./term.sh IMG_1394.JPG`

mark = gets
slow_print "nice to meet you, #{mark}"

# Exciting motivation!?
# this is the universal talk
