#! /usr/bin/env ruby
require './network'

at_exit { p NODESTACK; `./term.sh` }

START_NODE  = (ARGV[0] || :n0).to_sym
TOC_NODE    = :toc
NODESTACK   = [] # so we can rescue if the program blows up
Env         = Network.graph

NODESTACK << START_NODE
Env[START_NODE].show

# update the graph file for the "About this Presentation" topic
`scripts/graph/graph.rb html > scripts/graph/sample.html`
# scripts/graph/graph.rb html > tempfile.html; open tempfile.html; sleep 5; rm tempfile.html
