#! /usr/bin/env ruby
require './lib/node'
Dir[File.join(File.dirname(__FILE__), "lib", "*.rb")].each { |file| require file }

at_exit {p NODESTACK; `./term.sh`}

START_NODE  = (ARGV[0] || :n0).to_sym
TOC_NODE    = :toc
NODESTACK   = [] # so we can rescue if the program blows up
PLACEHOLDER = "This node hasn't been made yet.  Please fork me and add it!"
Env         = {}

Env[:n5]  = MarkdownNode.new "without_rails.markdown", 
            background: "", next_text: "Ruby, without the rails", next_nodes: []

Env[:n4]  = MarkdownNode.new "hardware_toys.markdown", 
            background: "", next_text: "Hardware hacking", next_nodes: []


Env[:n3e] = TextNode.new PLACEHOLDER,
            background: "ghost-in-the-shell-fingers.jpg", next_text: "How about a live image?", next_nodes: []

Env[:n3c] = TextNode.new PLACEHOLDER,
            background: "ghost-in-the-shell-fingers.jpg", next_text: "Better IPC", next_nodes: [:n3e]

Env[:n3f] = WebNode.new "https://github.com/ruby-opencv/ruby-opencv#sample-code",
            parting_words: "The doucments for the ruby-opencv project aren't going to be much help. \nBut that's OK.",
            background: "ghost-in-the-shell-fingers.jpg", next_text: "What documentation is available?", next_nodes: []

Env[:n3d] = TextNode.new PLACEHOLDER,
            background: "ghost-in-the-shell-fingers.jpg", next_text: "Learning How to learn OpenCV in Ruby", next_nodes: [:n3f]

Env[:n3b] = VimNode.new "facedetect", session: "facedetect-2.session",
            background: "ghost-in-the-shell-fingers.jpg", next_text: "Ugh, shelling out.", next_nodes: [:n3d]

Env[:n3a] = VimNode.new "facedetect", session: "facedetect-1.session",
            background: "ghost-in-the-shell-fingers.jpg", next_text: "A simple program to detect faces", next_nodes: [:n3b, :n3c]

Env[:n3]  = TextNode.new PLACEHOLDER, 
            background: "", next_text: "Ruby-c extensions", next_nodes: [:n3a]
#tuatology
Env[:n2]  = MarkdownNode.new "face_detection_in_ruby.markdown", 
            background: "", next_text: "Face detection in ruby", next_nodes: [:n3, :n3a]

Env[:n1]  = MarkdownNode.new "keep_learning.markdown", 
            background: "", next_text: "Keep learning", next_nodes: [:n2, :n4, :n5]

#hugemistake
Env[:n0]  = MarkdownNode.new "about.markdown", 
            background: "", next_text: "The Beginning", next_nodes: [:n1]

Env[:toc] = TextNode.new "Table of Contents: ", 
            background: "", next_text: "Table of contents", next_nodes: Env.keys

NODESTACK << START_NODE
Env[START_NODE].show
