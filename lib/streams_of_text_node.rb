class StreamsOfTextNode < CursesNode
  def cursing
    [ ->() {
      text = "This is the Unix philosophy: "
      Curses.setpos v_center_text(text), h_center_text(text)
      ghost text
    }, ->() {
      text = "Write programs that do one thing and do it well. "
      Curses.setpos v_center_text(text) + 1, h_center_text(text)
      ghost text
    }, ->() {
      text = "Write programs to work together. "
      Curses.setpos v_center_text(text) + 2, h_center_text(text)
      ghost text
    }, ->() {
      attrib Curses::A_UNDERLINE do
        text = "Write programs to handle text streams, because that is a universal interface."
        Curses.setpos v_center_text(text) + 3 , h_center_text(text)
        ghost text
      end
    }, ->() {
      attrib Curses::A_BOLD do
        text = "              -- Doug McIlroy, head of the Bell Labs & contrib. to Unix pipes"
        Curses.setpos v_center_text(text) + 5, h_center_text(text)
        ghost text
      end
    } ]
  end

  def show
    @background.display

    init_screen do
      cursing.each &:call
    end

    go back
  end
end
