=begin
# PROBLEM
  Input: Array of integers
  Output: Integer, the average of all numbers in the array
  Explicit requirements:
  - Write a method that takes one argument (an array of integers).
  - The method should return the average of all numbers in the array.
  - The array will never be empty.
  - The numbers will always be positive integers.
  - The result should also be an integer.
  Implicit requirements:
  - To find the average, add up each number and divide by the amount of numbers.
  Questions:

# EXAMPLES
  puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40

# DATA STRUCTURE
  - Array

# ALGORITHM
  - Initialize a local variable called sum
  - Iterate over each element of the array, adding each element to the total
    of the sum variable
  - Return the result of dividing the sum by the total number of elements
    in the array
# CODE
=end

def average(array)
  sum = 0
  array.each do |number|
    sum += number
  end
  sum / array.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Refactored code

def average(array)
  array.sum / array.size
end

# Further exploration

def average(array)
  array.sum.to_f / array.size
end
