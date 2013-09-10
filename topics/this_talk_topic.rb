module ThisTalkTopic
  def self.add_to_env(env)

    env[:tt5]  = VimNode.new "this-presentation", session: "term-sh.session",
                 background: "", next_text: "Ok, but how are you changing the backround", next_nodes: [:p01, :toc]

    env[:tt4]  = WebNode.new "/Users/markjlorenz/choose_your_own/scripts/graph/sample.html",
                 background: "", next_text: "Show me that graph!", next_nodes: [:tt5]

    env[:tt3]  = MarkdownNode.new "stopping-mistakes.markdown",
                 background: "", next_text: "How do you stop mistakes?", next_nodes: [:tt4]
j
    env[:tt2]  = VimNode.new "this-presentation", session: "network.session",
                 background: "", next_text: "How does it work?", next_nodes: [:tt3]

    env[:tt1]  = MarkdownNode.new "about_this_presentation.markdown", 
                 background: "head_asplode.jpg", next_text: "The presentation about this presentation", next_nodes: [:tt2]

  end
end
