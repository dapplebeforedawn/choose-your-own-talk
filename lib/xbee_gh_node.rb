class XbeeGitHubNode < CursesNode
  def cursing
    [ ->() {
      Curses.start_color
      Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE);
      attrib Curses::color_pair(1) do
        text = "https://github.com/dapplebeforedawn/xbee-experiments"
        Curses.setpos v_center_text(text) + 4, h_center_text(text)
        ghost text
      end
    } ]
  end
end
