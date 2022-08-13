=begin
# PROBLEM
  Input: Array
  Output: Array
  Explicit requirements:
  - Write a method that returns an array that contains every other element of an array
    that is passed in as an argument.
  - The values in the returned list should be those values that are in the 1st, 3rd, 5th
    and so on elements of the argument array.
  Implicit requirements:
  Questions:

# EXAMPLES
  oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
  oddities(['abc', 'def']) == ['abc']
  oddities([123]) == [123]
  oddities([]) == []
# DATA STRUCTURE
  - Array
# ALGORITHM
  - Define a method
  - Initialize an empty array
  - Iterate over each element of the original array
  - Add the element at each odd index to the empty array
  - Return the new array
# CODE
=end

def oddities(array)
  new_array = []
  index = 1

  loop do
    break if index >= array.size
    new_array << array[index]
    index += 2
  end

  new_array
end

p oddities([2, 3, 4, 5, 6])
