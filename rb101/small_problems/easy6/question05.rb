=begin
Input: Array
Output: Array

Requirements:
-Write a method that takes an array, and returns a new array with the elements
of the original list in reverse order.  Do not modify the original list.
-Dont use .reverse methods

Algorithm:
-Initialize a reversed array variable
-Iterate over the input array.
-On each iteration, move the current element to the beginning of the new array
-Return the reversed array
=end

def reverse(array)
  reversed_array = Array.new

  array.each do |element|
    reversed_array.unshift(element)
  end

  reversed_array
end

# Further exploration using each_with_object

# def reverse(array)
#   array.each_with_object(Array.new) { |element, new_array| new_array.unshift(element) }
# end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true