class String; alias :each :each_line; end

VALUES  = [ 'UNINITIALIZED' ]
rd, wr  = IO.pipe

Kegmotron = ->(env) do
  html =<<-HTML
    <style>
      body{
          background: gray;
          text-align: center;
      }
    </style>
    <img src='/images/#{VALUES.last}'/>
  HTML
  [ 200, {'Content-Type'=>'text/html'}, html ] 
end

puts "[Spawning Xbee Process]"
spawn "./xbee-hex-frmt.rb -c -i", out: wr

puts "[Setting up Xbee Read Pipe]"
Thread.new do
  rd.each_line { |line| VALUES << line }
end

use  Rack::Static, urls: ["/images"]
run  Kegmotron
