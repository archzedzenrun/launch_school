# =begin
# # PROBLEM
#   Input: Array
#   Output: Rotated array
#   Explicit requirements:
#   - Write a method that rotates an array by moving the first element to the end of the array
#   - THe original array should not be modified
#   - Do not use the method Array#rotate or Array#rotate!
#   Implicit requirements:
#   Questions:

# # EXAMPLES
#   rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
#   rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
#   rotate_array(['a']) == ['a']

#   x = [1, 2, 3, 4]
#   rotate_array(x) == [2, 3, 4, 1]   # => true
#   x == [1, 2, 3, 4]                 # => true

# # DATA STRUCTURE
#   - Array
# # ALGORITHM
#   - Initialize a new method named rotate_array
#   - Create a duplicate of the array being passed into the method
#   - Assign this duplicate to a new local variable new_array
#   - Remove the first element of new_array
#   - Append that element to the end of new_array
#   - Return new_array
# # CODE
# =end


# def rotate_array(array)
#   new_array = array.dup
#   new_array.push(new_array.shift)
# end

# def rotate_string(string)
#   rotate_array(string.split).join(' ')
# end

# def rotate_integer(integer)
#   rotate_array(integer.digits.reverse).join('').to_i
# end

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# Second pass

=begin
Input: Array
Output: New array (do not modify the original array)

Requirements:
-Write a method that rotates an array by moving the first element ot the end of the array.
-The original array should not be modified.
-Do not use array rotate method.

Algorithm:
-Initialize a new_array variable and set it to a duplicate of the original array
-Move the element at the first index of the new array to the last index
-Remove the first element
-Return the new array
=end

def rotate_array(array)
  new_array = array.dup
  new_array.push(new_array.shift)
end

def rotate_string(string)
  rotate_array(string.split).join(' ')
end

def rotate_integer(integer)
  rotate_array(integer.to_s.split('')).join.to_i
end

p rotate_integer(34532) == 45323

p rotate_string("hello world its me") == "world its me hello"

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]