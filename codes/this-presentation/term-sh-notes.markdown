# Notes
=======
term.sh is a little command line script that talks to iTerm.  No you can not render raster graphics the terminal.

```ruby
class Node
  module Background
    def display
      system("clear")  # Not sure why backticks don't work
      `./term.sh images/#{self}`
    end
  end
end
```
