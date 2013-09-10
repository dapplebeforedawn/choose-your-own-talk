module Network
  def self.graph

    env       = {}

    env[:g01] = MarkdownNode.new "what-is-arity.markdown",
                parting_words: "Type 'back'",
                background: "jim.png", next_text: "What's 'arity'?", next_nodes: []

    env[:g04] = VimNode.new "kill-pipe", session: true,
                background: "kill_pipe.png", next_text: "kill pipe, wat?!", next_nodes: [:p02, :mga]

    ATopicSpecificModule.add_to_env    env

    env
  end
end
