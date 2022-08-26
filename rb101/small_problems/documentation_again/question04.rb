a = [1, 4, 8, 11, 15, 19]

p a.bsearch { |num| num > 8 }

# The bsearch method returns the first element of the array that the block evaluates as true.