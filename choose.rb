#! /usr/bin/env ruby
require './node'
require './vim_node'

at_exit {`./term.sh`}

START_NODE = ARGV[0] || :n1

Env      = {}
Env[:n4] = VimNode.new("vimfile.txt", "118-pr1.jpg", "goto node VIM node", [:n1])
Env[:n2] = Node.new("I'm node 2", "118-pr1.jpg", "goto node 2", [:n1])
Env[:n3] = Node.new("I'm node 3", "arrested_development.jpg", "goto node 3", [:n2])
Env[:n1] = Node.new("hi, what's your name? ", "hugemistake.png", "goto node 1", [:n2, :n3, :n4])

Env[START_NODE].show
