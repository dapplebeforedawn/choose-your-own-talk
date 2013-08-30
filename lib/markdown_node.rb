require 'pathname'
class MarkdownNode < Node

  def initialize filename, options={}
    super options
    @filename = Pathname.new("texts").join filename
  end

  def show
    @background.display
    data = File.readlines @filename
    data.extend GhostWriterCollection
    data.ghost

    show_next_options
    go next_choice
  end

end
