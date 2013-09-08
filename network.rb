require_relative './lib/node'
Dir[File.join(File.dirname(__FILE__), "lib", "*.rb")].each { |file| require file }

module Network
  def self.graph
    env         = {}

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

    #TO BE IMPLEMENTED
    env[:p01] = VimNode.new "Process-spawn",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "Process.spawn", next_nodes: []

    env[:n3i] = VimNode.new "facedetect", session: "facedetect-4.session",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "I can haz movie?", next_nodes: [:p01, :p02, :p03, :g03]
    #next, pipeline, process span, io pipes, redirection, array pack--|
    #                                                                 |-bits/bytes/chars

    env[:n3e] = VimNode.new "facedetect", session: "facedetect-3.session",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "I can haz live image?", next_nodes: [:p01, :g02, :n3i]

    env[:n3h] = PendingNode.new(
                background: "", next_text: "Writing Ruby-c extensions", next_nodes: [])

    env[:n3g] = WebNode.new "https://github.com/ruby-opencv/ruby-opencv/search?q=add_weighted&ref=cmdform",
                parting_words: "Use the general OpenCV documentation available for the C library (there's tons).\nGrep the ruby-opencv library for how it's implemented in Ruby.\nBe careful for differences in arity.",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "Grep the source like a boss", next_nodes: [:g01, :n3h, :n3e]

    env[:n3f] = WebNode.new "https://github.com/ruby-opencv/ruby-opencv#sample-code",
                parting_words: "The doucments for the ruby-opencv project aren't going to be much help. \nBut that's OK.",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "What documentation is available?", next_nodes: [:n3g]

    env[:n3d] = MarkdownNode.new "open-cv-docs.markdown",
                background: "leongersing.png", next_text: "Learning How to learn OpenCV in Ruby", next_nodes: [:n3f]

    env[:n3b] = VimNode.new "facedetect", session: "facedetect-2.session",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "Have OpenCV do the composition", next_nodes: [:n3d]

    env[:n3a] = VimNode.new "facedetect", session: "facedetect-1.session",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "A simple program to detect faces", next_nodes: [:n3b, :n3e]

    #tuatology
    env[:n2]  = MarkdownNode.new "face_detection_in_ruby.markdown", 
                background: "", next_text: "Face detection in ruby", next_nodes: [:n3a]

    env[:n1]  = MarkdownNode.new "keep_learning.markdown", 
                background: "", next_text: "Keep learning", next_nodes: [:n2, :n4, :n5]

    env[:n0]  = MarkdownNode.new "about.markdown", 
                background: "huge_mistake.jpg", next_text: "The Beginning", next_nodes: [:n1]

    env[:t1]  = TitleNode.new(
                background: "", next_text: "The Title Screen", next_nodes: [:n0])


    #env[:toc] = TextNode.new "Table of Contents: ", 
                #background: "", next_text: "Table of contents", next_nodes: env.keys

    env
  end
end
