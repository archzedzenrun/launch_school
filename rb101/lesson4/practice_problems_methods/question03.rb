[1, 2, 3].reject do |num|
  puts num
end

# Returns a new array containing elements from the original array that the
# block evaluates as falsey.

# In this case the return value is [1, 2, 3].  The puts in the block evaluates
# to nil (falsey) therefore every element of the original array will be returned.