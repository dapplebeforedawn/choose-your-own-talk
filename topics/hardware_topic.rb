module HardwareTopic
  def self.add_to_env(env)
    env[:hh1]  = MarkdownNode.new "hardware_toys.markdown", 
                 background: "", next_text: "Hardware hacking: building keg-motron", next_nodes: []
  end
end
