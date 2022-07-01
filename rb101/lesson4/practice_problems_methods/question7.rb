[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The blocks return value is true.  The .any? method is checking to see
# if any of the elements in the array are evaluating as true based on the 
# last line in the block, in this case num.odd?

# This code will return true and output 1
# This is because any? stopped iterating after the first element evaluated as true.