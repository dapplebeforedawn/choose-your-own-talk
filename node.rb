class Node
  GHOST_SPEED = 0.02
  require 'stringio'

  attr_accessor :next_text
  def initialize texts, background=nil, next_text="", next_nodes=[]
    @texts      = [texts].flatten #force an array
    @background = background
    @next_nodes = next_nodes
    @next_text  = next_text

    @texts.extend       GhostWriterCollection
    @next_text.extend   GhostWriter
    @background.extend  Background
  end

  def show
    @background.display
    @texts.ghost
    show_next_options
    go next_choice
  end

  module Transitions
    def letters
      %w(a b c d e f g h i j k)
    end

    def next_choice
      print "Where do you want to go?: "
      unless next_node_ind = letters.index($stdin.gets.chomp) #bare `gets` will try to consume ARGV too
        puts "Let's try that again"
        show_next_options
      end
      @next_nodes[next_node_ind]
    end

    def show_next_options
      puts "=========================="
      @next_nodes.each_with_index do |node_sym, i| 
        Env[node_sym].next_text.ghost
        print " (#{letters[i]})"
        print "\n"
      end
    end

    def go next_node_sym
      Env[next_node_sym].show
    end
  end
  include Transitions

  module Background
    def display
      system("clear")  # Not sure why backticks don't work
      `./term.sh images/#{self}`
    end
  end

  module GhostWriterCollection
    def self.extended(obj)
      obj.each {|o| o.extend(GhostWriter)}
    end

    def ghost
      each &:ghost
      print "\n"
    end
  end

  module GhostWriter
    def ghost
      StringIO.new(self).each_char do |chr|
        print chr
        sleep GHOST_SPEED
      end
    end
  end

end
