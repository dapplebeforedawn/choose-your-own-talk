module HardwareTopic
  def self.add_to_env(env)
    
    env[:hhc]  = WebNode.new "https://github.com/dapplebeforedawn/xbee-experiments",
                 background: "Bender-futurama.jpg", next_text: "No, really, show us", next_nodes: [:toc]

    env[:hhb]  = XbeeGitHubNode.new(
                 background: "Bender-futurama.jpg", next_text: "Programming the XBee", next_nodes: [:hhc])

    env[:hha]  = VimNode.new "hardware", session: "config-format-ru.session",
                 background: "Bender-futurama.jpg", next_text: "Wrap it up", next_nodes: [:toc, :hhb]

    env[:hh9]  = VimNode.new "hardware", session: "xbee-hex-frmt.session",
                 background: "Bender-futurama.jpg", next_text: "Modifications to xbee-hex.rb", next_nodes: [:hha]

    env[:hh8]  = VimNode.new "hardware", session: "image-formatter.session",
                 background: "Bender-futurama.jpg", next_text: "Pretty it all up", next_nodes: [:hh9]

    env[:hh7]  = TextNode.new "A wiring diagram",
                 parting_workds: "Type 'back'",
                 background: "a-d_coverter.png", next_text: "The one thing you need to know about electronics", next_nodes: [:hh8]

    env[:hh6]  = TextNode.new "The Parts:",
                 background: "xbee-diagram.jpg", next_text: "What about the _actual hardware_", next_nodes: [:hh7, :hh8]

    env[:hh5]  = VimNode.new "hardware", session: 'xbee-hex-formatter.session',
                 background: "Bender-futurama.jpg", next_text: "Formatting the data", next_nodes: [:hh6, :hh7, :g03, :g02, :hh8]

    env[:hh4]  = VimNode.new "hardware", session: 'xbee-hex-prog.session',
                 background: "Bender-futurama.jpg", next_text: "The xbee-hex.rb program", next_nodes: [:hh5, :p04, :hh6]

    env[:hh3]  = VimNode.new "hardware", session: 'config-ru.session',
                 background: "Bender-futurama.jpg", next_text: "The webserver", next_nodes: [:hh4, :p02, :p01]

    env[:hh2]  = MarkdownNode.new "kegmotron-descr.markdown", 
                 background: "Bender-futurama.jpg", next_text: "Description of a hareware project: Kegmotron", next_nodes: [:hh3]

    env[:hh1]  = MarkdownNode.new "hardware_toys.markdown", 
                 background: "Bender-futurama.jpg", next_text: "Hardware hacking: building keg-motron", next_nodes: [:hh2]
  end
end
