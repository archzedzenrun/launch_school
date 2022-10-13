=begin
# PROBLEM
  Input: Array
  Output: Array
  Requirements: Write a method that takes an array of numbers and returns
  an array with the same number of elements, and each element has the running
  total from the original array.

# EXAMPLES
  running_total([2, 5, 13]) == [2, 7, 20]
  running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
  running_total([3]) == [3]
  running_total([]) == []

# DATA STRUCTURE
  Array

# ALGORITHM
  Iterate over the input array and add each element to a new array
  Calculate the sum of of the new array after each iteration
  Add the sum value to a new array and return it
# CODE
=end

def running_total(array)
  sum = 0
  new_array = []
  array.each do |num|
    sum += num
    new_array << sum
  end
  new_array
end

# Further Exploration

def running_total(arr)
  sum = 0
  arr.each_with_object([]) do |num, array|
    array << sum += num
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Revisit

def running_total(array)
  sum = 0
  array.map { |num| sum += num }
end