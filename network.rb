require

module Network
  class NodeMutation < StandardError; end
  def self.graph

    # Don't allow node re-def, this will help me avoid stupid
    # mistakes
    env = {}
    env.instance_eval do
      alias :square_brace :[]=
      def []=(k, v)
         raise NodeMutation if has_key?(k)
         square_brace k, v
      end
    end

    OpenCVTopic.add_to_env(env)
    MakeAGameTopic.add_to_env(env)
    HardwareTopic.add_to_env(env)
    ThisTalkTopic.add_to_env(env)

    env[:n5]  = MarkdownNode.new "without_rails.markdown", 
                background: "", next_text: "Ruby, without the rails", next_nodes: []

    env[:n4]  = MarkdownNode.new "hardware_toys.markdown", 
                background: "", next_text: "Hardware hacking", next_nodes: []

    env[:g01] = MarkdownNode.new "what-is-arity.markdown",
                parting_words: "Type 'back'",
                background: "jim.png", next_text: "What's 'arity'?", next_nodes: []

    env[:g02] = VimNode.new "working-with-bytes/working-with-bytes.markdown",
                parting_words: "Type 'back'",
                background: "jim.png", next_text: "Working with Bytes", next_nodes: [:g03]

    env[:g03] = VimNode.new "bytes-in-ruby/bytes-in-ruby.markdown",
                parting_words: "Learn more about working with bytes or 'back'",
                background: "jim.png", next_text: "Access the Bytes in Ruby", next_nodes: [:g02]

    env[:p03] = StreamsOfTextNode.new(
                background: "stream_quote.jpg", next_text: "Streams of Text", next_nodes: [])

    env[:p02] = VimNode.new "fifo",
                background: "fifo.jpg", next_text: "| Pipelining |", next_nodes: []

    env[:p01] = VimNode.new "process-spawn",
                background: "spawn.jpg", next_text: "When to Spawn, when to back-whack", next_nodes: [:p03, :p02]

    env[:n3h] = PendingNode.new(
                background: "", next_text: "Writing Ruby-c extensions", next_nodes: [])

    env[:toc]  = MarkdownNode.new "keep_learning.markdown", 
                background: "", next_text: "Keep learning", next_nodes: [:n2, :n4, :n5]

    env[:n0]  = MarkdownNode.new "about.markdown", 
                background: "huge_mistake.jpg", next_text: "The Beginning", next_nodes: [:toc]

    env[:t1]  = TitleNode.new(
                background: "", next_text: "The Title Screen", next_nodes: [:n0])

    #env[:idx] = TextNode.new "Index, all the things: ", 
                #background: "", next_text: "Table of contents", next_nodes: env.keys

    env
  end
end
