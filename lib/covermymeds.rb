require_relative './curses_node'
class CoverMyMeds < CursesNode
  ORANGE          = 20
  RUBINE          = 30
  ORANGE_COLOR    = 20
  RUBINE_COLOR    = 30
  def cursing
    Curses.start_color
    Curses.init_color ORANGE, 255, 250, 0
    Curses.init_color RUBINE, 236, 14,  110
    Curses.init_pair  ORANGE_COLOR, ORANGE, Curses::COLOR_BLACK
    Curses.init_pair  RUBINE_COLOR, RUBINE, Curses::COLOR_BLACK
    [ ->() {
      attrib Curses::color_pair(ORANGE_COLOR) do
        text = "Cover"
        Curses.setpos v_center_text('CoverMyMeds'), h_center_text('CoverMyMeds')
        ghost text
      end
    }, ->() {
      attrib Curses::color_pair(RUBINE_COLOR) do
        text = "My"
        ghost text
      end
    }, ->() {
      attrib Curses::color_pair(ORANGE_COLOR) do
        text = "Meds"
        ghost text
      end
    } ]
  end
end
