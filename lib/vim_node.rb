class VimNode < Node

  # If session is a string then load that session
  # otherwise, use the vim default (so you can do `session: true`)
  def initialize filename, options={}
    super options
    @session_flag = "-S"              if options[:session]
    @session_file = "Session.vim"     if options[:session]
    @session_file = options[:session] if options[:session].is_a?(String)
    @filename     = Pathname.new("codes").join(*[filename, @session_file].compact)
  end

  def show
    @background.display
    pid = spawn *["vim", @session_flag, @filename.to_s].compact
    Process.wait pid
    show_next_options
    go next_choice
  end

end
