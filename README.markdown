# What Am I?
These are my "slides" from the Sept-2013 Columbus Ruby Brigade meeting.

## Installing the "slides"
> Assuming you have RVM or similar already
```bash
bundle install

# Special install outside of bundler, becuase you need to
# tell it where opencv was installed to.  In my case
# this is where `brew install opencv` puts it, YMMV.
gem install ruby-opencv -- --with-opencv-dir=/usr/local/Cellar/opencv/2.4.5/
```

## Running the "slides"
```bash
bundle exec ./choose.rb
```

## More details
 - For more information about the presentation, follow the "about the presentation" track once you've started`choose.rb`
 - I have no idea if this will work on Windows.
 - Some tracks require hardware.

## Bonus!
The markdown-based slides are formatted with a gem I wrote for this presentation called, "tty_markdown".  The gem (not on rubygems.org yet) comes with a binary, so if you:
```bash
# Download the source:
git clone https://github.com/dapplebeforedawn/tty_markdown.git

# Build the gem:
cd tty_markdown 
gem build tty_markdown.gemspec

# Install it (the version my vary)
gem install tty_markdown-0.0.1.gem
```

You now have access to the `tty_md` command in your prompt.  Git it a filename as the one argument, or pipe pipe markdown to it, and you'll see pretty colors.  Pull requests totally accepted.

## Support
Please contact me at: markjlorenz@gmail.com with any questions.  I love talking about this stuff.
