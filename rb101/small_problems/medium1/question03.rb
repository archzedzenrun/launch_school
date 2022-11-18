=begin
Input: Integer
Output: Integer

Requirements:
-Write a method that takes an integer as argument.
-Return the maximum rotation of that argument.

Examples:
max_rotation(735291) == 321579
Rotation 1: 35291 7
Rotation 2: 3 2917 5 - First digit (3) kept in place
Rotation 3: 32 175 9 - First two digits kept in place
Rotation 4: 321 59 7 - First three digits kept in place
Rotation 5: 3215 7 9 - First four digits kept in place

Algorithm:
-Initialize a digits variable and set it to the input integer as an array of digits
-Iterate through the digits array
-Move the digit at the 0 index to the end of the array
-Now move the digit at the 1 index to the end of the array
-And so on
=end

def max_rotation(integer)
  digits = integer.to_s.chars
  digits.each { |num| digits.push(digits.delete(num)) }.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Using methods from previous 2 exercises

def rotate_array(array)
  array[1..-1] + array[0]
end

def rotate_rightmost_digits(integer, num_of_digits)
  string = integer.to_s
  rotated_digits = rotate_array(string[-num_of_digits..-1])
  (string[0...-num_of_digits] + rotated_digits)
end

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number.to_i
end
