# What is Arity?

"Arity" is the word we use to describe the number of arguments a function takes

e.x:

```ruby
def divide(numer, denom)
  numer / denom
end

# `divide` has an arity of 2
```

----
*Bounus:* In some languages (like Javascript) all methods are in reality "variadic", meaning that take a variable number of arguments.

e.x.:

```javascript
function divide(numer, denom){
  return numer / (denom || 2)
}

// Is callable as both: `divide(1,2)` and `divide(1)`
// It's also callable as `divide(1,2,3,4)` but that won't do much for you.
```
