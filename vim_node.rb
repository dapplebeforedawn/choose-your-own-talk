class VimNode < Node

  def initialize filename, background=nil, next_text="", next_nodes=[]
    super
    @filename = filename
  end

  def show
    @background.display
    Process.wait spawn("vim", @filename)
    show_next_options
  end
end
