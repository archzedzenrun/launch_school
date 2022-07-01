hash = { a: 'ant', b: 'bear' }
hash.shift

# Returns [:a, "ant"] 
# Shift removes (destructively) the first key value pair in the hash and returns a new
# two element array containing those values.
