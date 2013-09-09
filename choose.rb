#! /usr/bin/env ruby
require_relative 'initializer'

at_exit { p NODESTACK; `./term.sh` }

START_NODE  = (ARGV[0] || :n0).to_sym
TOC_NODE    = :toc
NODESTACK   = [] # so we can rescue if the program blows up
Env         = Network.graph

NODESTACK << START_NODE
Env[START_NODE].show
