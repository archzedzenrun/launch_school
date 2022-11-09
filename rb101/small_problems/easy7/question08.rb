=begin
Input: Two arrays
Output: Array

Requirements:
-Write a method that takes two array arguments
-Each argument contains a list of numbers
-Return a new array that contains the product of each pair of numbers from the
arguments that have the same index.
-Assume the arguments contain the same number of elements

Algorithm:
-Initialize a new empty array
-Iterate over the first input array
-Multiply the current element by the element at the same index from the second array
-Push the product to the new empty array
-Return the new array
=end

def multiply_list(array1, array2)
  new_array = []
  array1.each_with_index do |num, idx|
    new_array << num * array2[idx]
  end
  new_array
end

# Alternate using each with object

def multiply_list(array1, array2)
  array1.each_with_index.with_object([]) { |(num, idx), new_arr| new_arr << num * array2[idx] }
end

# Further exploration using zip

def multiply_list(array1, array2)
  array1.zip(array2).map { |subarr| subarr.inject(&:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
