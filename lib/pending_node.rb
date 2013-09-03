require_relative './text_node'
class PendingNode < TextNode
  PLACEHOLDER = "This node hasn't been made yet.  Please fork me and add it!"
 
  def initialize options={}
    super PLACEHOLDER, options
  end
end
