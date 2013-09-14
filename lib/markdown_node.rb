require 'pathname'
require 'redcarpet'
require 'tty_markdown'
class MarkdownNode < Node

  def initialize filename, options={}
    super options
    @filename = Pathname.new("texts").join filename
  end

  def show
    @background.display
    markdown = ::Redcarpet::Markdown.new(::Redcarpet::Render::ColorDown, fenced_code_blocks: true)
    markeddown = markdown.render File.read(@filename)
    data = markeddown.lines
    #data = File.readlines @filename

    data.extend GhostWriterCollection
    data.ghost

    show_next_options
    go next_choice
  end

end
