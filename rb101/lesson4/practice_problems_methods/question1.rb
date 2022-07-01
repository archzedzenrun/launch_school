[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# The return value is [1, 2, 3] because select returns each element of the 
# original array if the last expression in the block is truthy.