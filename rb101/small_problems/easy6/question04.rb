=begin
Input: Array
Output: Array (mutated input array)

Requirements:
-Write a method that takes an array as an argument.
-Reverse its elements in place (mutate the array passed into this method).
-Return value should be the same array object.
-Dont use .reverse or .reverse! methods.

Algorithm:
-Initialize a counter for the first element of the array
-Initialize a counter for the last element of the array
-Until the first counter is equal to half the size of the array
-Swap the positions of the first and last elements
-After each iteration, increment the first element counter and decrement the
last element counter
-Return the mutated array
=end

def reverse!(array)
  first = 0
  last = -1

  until first == array.size / 2
    array[first], array[last] = array[last], array[first]
    first += 1
    last -= 1
  end

  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true