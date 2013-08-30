#! /usr/bin/env ruby
require './lib/node'
Dir[File.join(File.dirname(__FILE__), "lib", "*.rb")].each { |file| require file }

at_exit {p NODESTACK; `./term.sh`}

START_NODE  = (ARGV[0] || :n0).to_sym
TOC_NODE    = :toc
NODESTACK   = [] # so we can rescue if the program blows up
PLACEHOLDER = "not finished yet"
Env         = {}

Env[:n5]  = MarkdownNode.new "without_rails.markdown", 
            background: "", next_text: "Ruby, without the rails", next_nodes: []

Env[:n4]  = MarkdownNode.new "hardware_toys.markdown", 
            background: "", next_text: "Hardware hacking", next_nodes: []


Env[:n3a] = VimNode.new "facedetect-1.rb", 
            background: "", next_text: "A program to detect faces", next_nodes: []

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

Env[START_NODE].show
