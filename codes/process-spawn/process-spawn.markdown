# Process#spawn
> When back-ticks don't cover it.

Use back-ticks if you need a quick, synchronous sub-shell E.g
```ruby
  "a.user.#{`uuidgen`}@example.com"  # Quick random email address
```

That's pretty much it.  Everthing else Process.spawn is the way to go
  - IO re-direction, send stdin, stdout, stderr to other file descriptors
  - Non-blocking.  `#spawn` return a PID, call `Process.wait(pid)` to keep your program from exiting.
