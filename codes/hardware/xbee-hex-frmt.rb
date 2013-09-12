#!/usr/bin/env ruby

require 'socket'
require 'optparse'
require './lib/options'
require './lib/data'
require './lib/image-formatter'

XBEE_PORT       = 3054
i               = 0

def counter i
  return '' if Options.get.hide_count
  "#{i.to_s.rjust(4, '0')}> "
end

def output msg
  frmt = [Img, Eng, Raw].find &:handle?
  raise "That shouldn't happen" unless frmt
  frmt.new(msg)
end

Socket.udp_server_loop(XBEE_PORT) do |msg, msg_src|
  i += 1
  puts "#{counter i}#{output(msg)}\r"
  STDOUT.flush # no buffering.
end
