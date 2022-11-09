=begin
Input:  2 arrays
Output: 1 array

Requirements:
-Write a method that combines two arrays passed in as arguments.
-Return a new array that contains all elements from both array arguments,
with the elements taken in alternation.
-Assume both input arrays are not empty and that they have the same number of
elements.

Examples:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


Algorithm:
-Initialize a combined array variable to a new array
-Initialize a counter to 0
-Until the counter equals the size of the input arrays (they will always be the same size):
-Add the element at the current counter index from array1 to the combined array
-Add the element at the current counter index from array2 to the combined array
-Increment the counter by 1
-Return the combined array
=end

def interleave(array1, array2)
  combined_array = []
  counter = 0
  until counter == array1.size
    combined_array << array1[counter]
    combined_array << array2[counter]
    counter += 1
  end
  combined_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Further exploration using .zip

def interleave(array1, array2)
  array1.zip(array2).flatten
end
