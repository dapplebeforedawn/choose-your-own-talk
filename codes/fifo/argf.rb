#!/usr/bin/env ruby 
# Takes to files arguments.  If any of the lines in file1 have 
# partial matches for a line in file2 then that line is returned.
# It's the ignorant mans grep.
#
# Using without pipes:
#   ./argf.rb keys.txt data.txt
# Using with pipes:
#   cat keys.txt | ./argf.rb - data.txt

select_keys = ARGF.file.readlines.map(&:chomp)
ARGF.skip
data = ARGF.file

data.each_line do |line|
  $stdout.write(line) if select_keys.any? { |key| line.match(key) }
end
