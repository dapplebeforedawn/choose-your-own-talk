class  HugeMistakeNode < CursesNode
  def cursing
    [ ->() {
      attrib Curses::A_BOLD do
        text = "I've made a huge mistake"
        Curses.setpos v_center_text(text), h_center_text(text)
        ghost text
      end
    } ]
  end
end
