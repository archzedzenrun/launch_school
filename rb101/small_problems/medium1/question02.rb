=begin
Requirements:
-Write a method that can rotate the last 'n' digits of a number.

Algorithm:
Helper method to rotate an array:
-Define a method that takes an array (or string) as an argument
-Add the elements from the 1 index to the last index plus the element at the 0 index

-Define a method that takes two arguments, integer, and number of digits.
-Intialize a string variable and set it to the integer converted to a string
-Initialize a rotated_digits variable and set it to the result of invoking the helper method on the characters of string starting at
the -"number of digits" index to the last index (-1).
-Combine the characters from the original string variable from the 0 index up to the -"number of digits" index,
with the rotated digits variable.
-Convert the result back to an integer and return it
=end

def rotate_array(array)
  array[1..-1] + array[0]
end

def rotate_rightmost_digits(integer, num_of_digits)
  string = integer.to_s
  rotated_digits = rotate_array(string[-num_of_digits..-1])
  (string[0...-num_of_digits] + rotated_digits).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# def rotate_rightmost_digits(integer, num_of_digits)
#   (integer.to_s[0...-num_of_digits] + rotate_array(integer.to_s[-num_of_digits..-1])).to_i
# end
