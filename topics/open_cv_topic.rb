module OpenCVTopic
  def self.add_to_env(env)
    env[:n3i] = VimNode.new "facedetect", session: "facedetect-4.session",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "I can haz movie?", next_nodes: [:p01, :p02, :p03, :g03, :toc]

    env[:n3e] = VimNode.new "facedetect", session: "facedetect-3.session",
                background: "ghost-in-the-shell-fingers.jpg", next_text: "I can haz live image?", next_nodes: [:p01, :g02, :n3i]

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

  end
end
