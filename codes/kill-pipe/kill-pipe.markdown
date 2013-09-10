# Kill Pipes
============
> I know what you're thinking.

Sometimes you start a process that you want to kill, but you don't want to send it a signal (^C, ^D).
 - A parent process what's to kill it's children
 - You want to pipeline a process, but `SIGINT` kills the entire pipeline

## In Ruby:
  ```ruby
  module ExitByPipe
    def self.join kill_pipe = 'kill_pipe'
      `mkfifo #{kill_pipe}` unless File.exists?(kill_pipe)
      at_exit do
        File.unlink kill_pipe
        yield
      end
      File.open(kill_pipe) { exit }
    end
  end

  # Kill the program by writing to kill pipe
  # Writes a CSV of IPs, configurations and scores to stdout
  ExitByPipe.join do
    STATES.last.each do |k, v|
      puts [k, v.conf, v.score].join(',')
    end
  end
  ```

## From the Command line:
  ```bash
  ./server.rb | column -t  -s, | cat  \
    <(echo "Game Results:")           \
    <(echo "========================")\ 
    -
  ````
 - Start server that will write to stdout on termination
 - Pretty print the output
 - Add a heading

## Killing the server
  ```bash
  echo "" > kill_pipe
  ```
