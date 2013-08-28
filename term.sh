#!/bin/bash

function set_bg {
  local tty=$(tty)
  osascript -e "
    tell application \"iTerm\"
      repeat with theTerminal in terminals
        tell theTerminal
          try
            tell session id \"$tty\"
              set background image path to \"$1\"
            end tell
          on error errmesg number errn
          end try
        end tell
      end repeat
    end tell"
}

if [ $1 ]
then
  set_bg "`pwd`/$1"
else
  set_bg ""
fi
