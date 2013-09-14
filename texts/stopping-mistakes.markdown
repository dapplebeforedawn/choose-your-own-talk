# Stopping Mistakes

The node hash (`env`) has been modified to raise an expection if a key is mutated

```ruby
module Network
  class NodeMutation < StandardError; end

  env = {}
  env.instance_eval do
    alias :square_brace :[]=
    def []=(k, v)
       raise NodeMutation if has_key?(k)
       square_brace k, v
    end
  end
end
```

Also, it ships with a utility so you can view the entire presentation graphically
