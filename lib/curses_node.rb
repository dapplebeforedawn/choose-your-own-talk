# Subclasses need to implement a "cursing" method that returns an array of callable objects.
# these callables are where the thing that need to be cursed should live.

require 'curses'
class CursesNode < Node

  def initialize options={}
    super options
  end

  def ghost(text)
    StringIO.new(text).each_char do |chr|
      Curses.addch chr
      Curses.refresh
      sleep GHOST_SPEED
    end
  end

  def show
    @background.display

    init_screen do
      cursing.each &:call
    end

    show_next_options
    go next_choice
  end

  def init_screen
    Curses.init_screen
    Curses.noecho
    Curses.stdscr.keypad(true) # enable arrow keys
    begin
      yield
      loop { break if Curses.getch == ' ' }
    ensure
      Curses.close_screen
    end
  end
end
