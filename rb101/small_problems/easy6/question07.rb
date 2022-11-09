=begin
Input: Array
Output: Two arrays (nested)

Requirements:
-Write a method that takes an array as an argument that returns two arrays
(as a pair of nested arrays) that contain the first half and second half of the original array
-If the original array contains an odd number of elements, the middle element should be placed
in the first half array.

Algorithm:
-Initialize a nested array variable and set it to an array containing two empty arrays
-Initialize an index variable and set it to 0
-Move elements from the input array into the first nested array until the index variable
is equal to half the size of the input array. (increment the index variable by 1 after moving each element)
-Start iteration again at the index indicated by the index variable
-Move elements from the input array into the second nested array until the index variable
is equal to the size of the input array. (increment the index variable by 1 after moving each element)
-Return the nested array
=end

def halvsies(array)
  nested_array = [[], []]
  index = 0

  until index >= array.size / 2.0
    nested_array[0] << array[index]
    index += 1
  end

  until index == array.size
    nested_array[1] << array[index]
    index += 1
  end

  nested_array
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
