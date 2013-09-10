# Notes
=======
**Warning, poor naming choices ahead**

 - A hash of nodes is constructed (each node is a "slide")
 - Each node has a list of out going nodes (`next_nodes`)
 - Different node-types do different things:
   - TextNode:      Displays some text (with animation)
   - MarkdownNode:  Loads a markdown file a shows it's text
   - VimNode:       Loads a VIM session, complete with splits and tabs
   - WebNode:       You get the idea.

 - Topic modules can be used to keep this thing from becomming one huge file.
