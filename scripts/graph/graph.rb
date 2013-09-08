#! /usr/bin/env ruby
require 'json'
require_relative '../../network'
Env = Network.graph

def to_json
  root_ident    = :t1
  edge_list     = {} #This is implemented as an object instead of an array for lookup performance reasons
  nodes         = {}

  # Add some data to the JSON object that will be used by the renderer
  fill_object_data = ->(object, ident) do
    edge_list[ident] = [] if !edge_list[ident] #initialize if needed
    return if nodes[ident]
    nodes[ident] = {
        id:   ident,
        name: object.next_text
      }
  end

  # DFS over the model object graph by reflecting on associations
  traverse = ->(object_ident) do
    object = Env[object_ident]
    fill_object_data.call object, object_ident
    object.next_nodes.each do |assoc_ident|
      edge_list[object_ident].push assoc_ident
      next if edge_list[assoc_ident] #if we've already seen it, skip it
      traverse.call(assoc_ident)
    end
  end
  traverse.call(root_ident)

  { rootId: root_ident, edges: edge_list, nodes: nodes }.to_json
end

def to_html
  DATA.read.gsub('__JSON__', to_json)
end

puts(to_html) if ARGV[0].match /html/i
puts(to_json) if ARGV[0].match /json/i

__END__
<head>
  <style type="text/css">
      svg{ overflow:visible !important; } /*easier than trying to size the SVG element right*/
  </style>
</head>
<body>
  <div id="graph"></div>
  <script type="text/javascript" src="http://underscorejs.org/underscore-min.js"></script>
  <script type="text/javascript" src="https://rawgithub.com/anvaka/VivaGraphJS/master/dist/vivagraph.min.js"></script>
  <script type="text/coffeescript">
    window.ObjectGraph = (rootId, nodes, nodeLinks)->
      graph = Viva.Graph.graph()

      _.each nodes, (node, node_id)->
        graph.addNode node_id, node

      _.each nodeLinks, (nodeLinkList, key)->
        _.each nodeLinkList, (nodeLink)->
          graph.addLink(key, nodeLink)

      graphics = Viva.Graph.View.svgGraphics()
      graphics.node (node)-> #build the node element from SVG and HTML components
        fillColor = if node.data.id == rootId then 'red' else 'blue'
        svg = Viva.Graph.svg('svg')
        g = svg.appendChild Viva.Graph.svg('g')
        g.appendChild Viva.Graph.svg('rect').attr('width', 10).attr('height', 10).attr('fill', fillColor)

        #foreign element sizeing could be done a lot better than what I have here
        foreignOject = g.appendChild Viva.Graph.svg('foreignObject').attr('width', '10em').attr('height', '1em').attr('fill', fillColor)
        body = foreignOject.appendChild document.createElementNS('http://www.w3.org/1999/xhtml', 'body')
        div = body.appendChild document.createElement('div')
        div.appendChild(document.createElement 'span' ).textContent = node.data.name
        svg

      layout = Viva.Graph.Layout.forceDirected graph,
        springLength : 10
        springCoeff  : 0.00005
        dragCoeff    : 0.02
        gravity      : -10

      renderer = Viva.Graph.View.renderer graph, 
        graphics  : graphics 
        layout    : layout 
        container : document.getElementById('graph')

      renderer.run()
  </script>
  <script type="text/javascript" src="http://jashkenas.github.io/coffee-script/extras/coffee-script.js"></script>

  <script type="text/javascript">
    setTimeout( function() {
        json = __JSON__
        ObjectGraph(json.rootId, json.nodes, json.edges);
      }, 1000 );
  </script>
</body>
