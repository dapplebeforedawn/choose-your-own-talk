# Pipelining

## First, normal pipes
> Standard Out/In (stdout/stdin) 101
```bash
  echo "1+2+3" | bc
  cat apache.log.3 apache.log.2 | grep "\b503\b" | wc -l
```
## What is a named pipe?
> aka, FIFOs
> aka, First in First out

A named pipe is similar to a temp file with a few important exception:
  - They're not writen to disk. (You can't commit them to git)
  - Just like regualar water pipes, both the input and the output need to be open, or information flow will block.
  - Read the information in the pipe once and it's gone.
  - `ls -l` looks a little different

## Making a named pipe:
```bash
  mkfifo marks-pipe
  ls -l
```

## Using a named pipe:
```bash
  echo "a stream of information" > marks-pipe
  ...
  tail marks-pipe
```

## Doing it in Ruby
```ruby
  rd, wr= IO.pipe
  fork do
    rd.lines do |line|
      $stdout.write(line) if line.match /mark/
    end
  end

  # A really, really  big text file
  pid = spawn "curl", "-s", "http://norvig.com/big.txt", out: wr
  Process.wait pid
```
[also in pipe_example.rb]
