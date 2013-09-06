class TitleNode < CursesNode
  def cursing
    [ ->() {
      attrib Curses::A_BOLD, Curses::A_UNDERLINE do
        text = "An Amazing Presentation"
        Curses.setpos v_center_text(text), h_center_text(text)
        ghost text
      end
    }, ->() {
      attrib Curses::A_BOLD do
        text = "By, Mark J. Lorenz"
        Curses.setpos v_center_text(text) + 1, h_center_text(text)
        ghost text
      end
    }, ->() {
      attrib Curses::A_DIM do
        text = "Twitter: @soodesune  |  Github: DappleBeforeDawn"
        Curses.setpos v_center_text(text) + 2, h_center_text(text)
        ghost text
      end
    }, ->() {
      Curses.start_color
      Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE);
      attrib Curses::color_pair(1) do
        text = "                          Press <space> to start "
        Curses.setpos v_center_text(text) + 4, h_center_text(text)
        ghost text
      end
    } ]
  end
end
