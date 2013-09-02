class WebNode < Node

  # If session is a string then load that session
  # otherwise, use the vim default (so you can do `session: true`)
  def initialize href, options={}
    super options
    @href = href
  end

  def show
    @background.display
    pid = spawn "open", @href
    Process.wait pid
    show_next_options
    go next_choice
  end

end
