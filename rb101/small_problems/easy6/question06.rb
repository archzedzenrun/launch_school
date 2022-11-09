=begin
Input: Two arrays
Output: Array

Requirements:
-Write a method that takes two arrays as arguments.
-Return an array that contains all fo the values from the argument arrays.
-There should be no duplication of values in the return array, even if there are
duplicates in the original arrays.

Algorithm:
-Initialize a new array variable
-Iterate over the first input array
-Add each element to the new array
-Iterate over the second input array
-Add the current element to the new array if it doesnt already exist
-Return the new array
=end

def merge(array1, array2)
  new_array = Array.new

  array1.each { |element| new_array << element }
  array2.each { |element| new_array << element unless new_array.include?(element) }

  new_array
end

# Refactored

# def merge(array1, array2)
#   (array1 + array2).uniq
# end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]