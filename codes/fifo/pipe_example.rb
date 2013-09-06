#!/usr/bin/env ruby 

rd, wr= IO.pipe
fork do
  rd.lines do |line|
    $stdout.write(line) if line.match /mark/
  end
end

# A really, really  big text file
pid = spawn "curl", "-s", "http://norvig.com/big.txt", out: wr
Process.wait pid
