class VimNode < Node

  def initialize filename, options={}
    super options
    @filename = filename
  end

  def show
    @background.display
    Process.wait spawn("vim", @filename)
    show_next_options
    go next_choice
  end

end