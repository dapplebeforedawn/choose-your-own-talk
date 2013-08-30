class TextNode < Node

  def initialize texts, options={}
    super options
    @texts = [texts].flatten #force an array
    @texts.extend GhostWriterCollection
  end
  
  def show
    @background.display
    @texts.ghost
    show_next_options
    go next_choice
  end

end
