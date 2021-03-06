require_relative 'initializer'
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

    OpenCVTopic.add_to_env    env
    MakeAGameTopic.add_to_env env
    HardwareTopic.add_to_env  env
    ThisTalkTopic.add_to_env  env

    env[:g01] = MarkdownNode.new "what-is-arity.markdown",
                parting_words: "Type 'back'",
                background: "jim.png", next_text: "What's 'arity'?", next_nodes: []

    env[:g02] = VimNode.new "working-with-bytes/working-with-bytes.markdown",
                parting_words: "Type 'back'",
                background: "jim.png", next_text: "Working with Bytes", next_nodes: [:g03]

    env[:g03] = VimNode.new "bytes-in-ruby/bytes-in-ruby.markdown",
                parting_words: "Learn more about working with bytes or 'back'",
                background: "jim.png", next_text: "Access the Bytes in Ruby", next_nodes: [:g02]

    env[:g04] = VimNode.new "kill-pipe", session: true,
                background: "kill_pipe.png", next_text: "kill pipe, wat?!", next_nodes: [:p02, :mga]

    env[:p04] = PendingNode.new(
                background: "", next_text: "What's UDP?", next_nodes: [])

    env[:p03] = StreamsOfTextNode.new(
                background: "stream_quote.jpg", next_text: "Streams of Text", next_nodes: [])

    env[:p02] = VimNode.new "fifo", session: true,
                background: "kill_pipe.png", next_text: "| Pipelining |", next_nodes: []

    env[:p01] = VimNode.new "process-spawn", session: true,
                background: "spawn.jpg", next_text: "When to Spawn, when to back-whack", next_nodes: [:p03, :p02]

    env[:n3h] = PendingNode.new(
                background: "", next_text: "Writing Ruby-c extensions", next_nodes: [])

    env[:toc]  = MarkdownNode.new "keep_learning.markdown", 
                background: "", next_text: "Keep learning", next_nodes: [:n2, :hh1, :tt1, :mg1]

    env[:t2]  = HugeMistakeNode.new(
                background: "huge_mistake.jpg", next_text: "Get Started", next_nodes: [:toc])

    env[:n0]  = MarkdownNode.new "about.markdown", 
                background: "", next_text: "The Beginning", next_nodes: [:t2]

    env[:cm]  = CoverMySlide.new(
                background: "", next_text: "CoverMySlide", next_nodes: [:n0])

    env[:cl]  = CoverMyMeds.new(
                background: "", next_text: "CoverMySlide", next_nodes: [:cm])

    env[:t1]  = TitleNode.new(
                background: "", next_text: "The Title Screen", next_nodes: [:cl])

    #env[:idx] = TextNode.new "Index, all the things: ", 
                #background: "", next_text: "Table of contents", next_nodes: env.keys

    env
  end
end
