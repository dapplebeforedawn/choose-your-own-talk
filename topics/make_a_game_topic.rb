module MakeAGameTopic
  def self.add_to_env(env)
    env[:mg9]  = VimNode.new "a-game", session: "game-client-1.session",
                 background: "john_e.png", next_text: "The Client - Cacluation Loop", next_nodes: [:mga]

    env[:mg8]  = VimNode.new "a-game", session: "game-server-2.session",
                 background: "rose.png", next_text: "The Server - Cacluation Loop", next_nodes: [:mg9]

    env[:mg7]  = VimNode.new "a-game", session: "game-server-1.session",
                 background: "rose.png", next_text: "The Server - Listen Loop", next_nodes: [:mg8]

    env[:mg6]  = MarkdownNode.new "game-spec-2.markdown", 
                 background: "space_invaders.jpg", next_text: "An Outline, how it do it", next_nodes: [:mg7]

    env[:mg5]  = MarkdownNode.new "game-spec.markdown", 
                 background: "space_invaders.jpg", next_text: "The Spec, what it do", next_nodes: [:mg6]

    env[:mg4]  = TextNode.new "Go ahead an clone this repository:\n\nhttps://github.com/dapplebeforedawn/crb-game-client", 
                 background: "space_invaders.jpg", next_text: "But first", next_nodes: [:mg5]

    env[:mg3]  = TextNode.new "No, wait.  I was serious.  Let's stop screwing around and make that game!", 
                 parting_words: "Sorry about that.",
                 background: "troll2.png", next_text: "Back to Menu", next_nodes: [:mg4]

    env[:mg2]  = TextNode.new "", 
                 parting_words: "You thought I was serious. :-)",
                 background: "troll1.jpg", next_text: "Let's get started", next_nodes: [:mg3]

    env[:mg1]  = MarkdownNode.new "game-intro.markdown", 
                 background: "awesomekid.jpg", next_text: "Build a multiplayer, realtime game", next_nodes: [:mg2]
  end
end
