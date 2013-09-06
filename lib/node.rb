class Node
  #GHOST_SPEED = 0.002
  GHOST_SPEED = 0.02
  require 'stringio'

  attr_accessor :next_text
  def initialize options={}
    @parting_words = options[:parting_words] || "" 
    @background    = options[:background]    || nil
    @next_nodes    = options[:next_nodes]    || [] 
    @next_text     = options[:next_text]     || "" 

    @next_text.extend     GhostWriter
    @parting_words.extend GhostWriter
    @background.extend    Background
  end

  module Transitions
    TOC  = 'toc'
    BACK = 'back'

    def letters
      ('a'..'z').to_a
    end

    def back
      NODESTACK.pop(2)[0]
    end

    def next_choice
      print "Where do you want to go?: "
      input = $stdin.gets.chomp #bare `gets` will try to consume ARGV too
      return TOC_NODE   if input == TOC
      return back       if input == BACK
      
      unless next_node_ind = letters.index(input)
        puts "Let's try that again"
        show_next_options
      end
      @next_nodes[next_node_ind]
    end

    def show_next_options
      @parting_words.ghost
      print "\n"
      puts "=========================="
      @next_nodes.each_with_index do |node_sym, i| 
        Env[node_sym].next_text.ghost
        print " (#{letters[i]})"
        print "\n"
      end
    end

    def go next_node_sym
      NODESTACK << next_node_sym # incase of problems
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
