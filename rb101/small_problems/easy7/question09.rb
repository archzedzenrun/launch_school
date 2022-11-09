=begin
Input: Two arrays
Output: Array

Requirements:
-Write a method that takes two array arguments
-Each array contains a list of numbers
-Return a new array that contains the product of every pair of numbers that
can be formed between the elements of the two arrays
-The result should be sorted by increasing value
-Assume that neither argument is an empty array

Examples:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

Algorithm:
-Initialize a products variable set to an empty array
-Iterate through the elements of the first input array
-On each iteration, iterate through the elements of the second input array
-Multiply the current element of array1 by each element in the second array
-Push the result to the products variable
-Return the products variable
=end

def multiply_all_pairs(array1, array2)
  new_array = []
  array1.each do |array1_num|
    array2.each do |array2_num|
      new_array << array1_num * array2_num
    end
  end
  new_array.sort
end

# Alternate one line using nested mapping

def multiply_all_pairs(arr1, arr2)
  arr1.map { |arr1_num| arr2.map { |arr2_num| arr1_num * arr2_num } }.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
