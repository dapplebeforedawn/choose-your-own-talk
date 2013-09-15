require_relative './curses_node'
class CoverMySlide < CursesNode
  ORANGE          = 20
  RUBINE          = 30
  ORANGE_COLOR    = 20
  RUBINE_COLOR    = 30

  def initialize options={}
    super options
  end

  def show
    @background.display
    init_screen do
      cmm_size = " CoverMyMeds ".length
      chars    = Curses::lines * Curses::cols
      cmms = chars/cmm_size
      cmms.times do

        Curses.attron Curses::color_pair(ORANGE_COLOR)
        Curses.addstr " Cover"
        Curses.attroff Curses::color_pair(ORANGE_COLOR)
        Curses.attron Curses::color_pair(RUBINE_COLOR)
        Curses.addstr "My"
        Curses.attroff Curses::color_pair(RUBINE_COLOR)
        Curses.attron Curses::color_pair(ORANGE_COLOR)
        Curses.addstr "Meds "
        Curses.attroff Curses::color_pair(ORANGE_COLOR)
      end
    end

    go @next_nodes.first #ncurses node only accepts one next node
  end

  def init_screen
    Curses.init_screen
    Curses.start_color
    Curses.noecho
    Curses.init_color ORANGE, 255, 250, 0
    Curses.init_color RUBINE, 236, 14,  110
    Curses.init_pair  ORANGE_COLOR, ORANGE, Curses::COLOR_BLACK
    Curses.init_pair  RUBINE_COLOR, RUBINE, Curses::COLOR_BLACK
    begin
      yield
      loop { break if Curses.getch == ' ' }
    ensure
      Curses.close_screen
    end
  end

end
