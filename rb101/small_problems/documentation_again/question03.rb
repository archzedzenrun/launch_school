def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# This code will print [4, 5, 3, 6]
# Default positional arguments explains that Ruby fills in missing arguments
# from left to right.