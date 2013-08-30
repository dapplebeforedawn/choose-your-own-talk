#! /usr/bin/env ruby
require './lib/node'
Dir[File.join(File.dirname(__FILE__), "lib", "*.rb")].each { |file| require file }

at_exit {`./term.sh`}

START_NODE = (ARGV[0] || :n1).to_sym

Env      = {}
Env[:n5] = MarkdownNode.new "sample.markdown", 
            background: "Buster_bluth.jpg", next_text: "Show me a markdown file", next_nodes: [:n1]
Env[:n4] = VimNode.new "vimfile.txt", 
            background: "118-pr1.jpg", next_text: "goto node VIM node", next_nodes: [:n1]
Env[:n2] = TextNode.new "I'm node 2", 
            background: "118-pr1.jpg", next_text: "goto node 2", next_nodes: [:n1]
Env[:n3] = TextNode.new "I'm node 3", 
            background: "arrested_development.jpg", next_text: "goto node 3", next_nodes: [:n2]
Env[:n1] = TextNode.new "hi, what's your name? ", 
            background: "hugemistake.png", next_text: "goto node 1", next_nodes: [:n2, :n3, :n4, :n5]

Env[START_NODE].show
