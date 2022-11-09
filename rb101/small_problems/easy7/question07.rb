=begin
Input: Array of integers
Output: String + float

Requirements:
-Write a method that takes an array of integers as input
-Multiply all the numbers together
-Divide the result by the number of entries in the array
-Print the result rounded to 3 decimal places
-Assume the array is non-empty

Algorithm:
-Initialize a product variable set to 1.0
-Iterate through the array of integers
-On each iteration, multiply the current integer by the product variable
-Reassign the product variable to the result
-Divide the product variable by the size of the input array
-Return the result rounded to 3 decimals
=end

def show_multiplicative_average(array)
  product = 1.0
  array.each { |num| product *= num }
  "The Result is #{format("%.3f", product / array.size)}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
