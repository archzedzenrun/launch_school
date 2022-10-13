=begin
# PROBLEM
  Input: String
  Output: Integer
  Requirements: Write a method that takes a string of digits and returns
  the appropriate number as an integer without using to_i.

# EXAMPLES
  string_to_integer('4321') == 4321
  string_to_integer('570') == 570

# DATA STRUCTURE
  Array of integers

# ALGORITHM
# CODE
=end

def string_to_integer(input_string)
  hash = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
           '7' => 7, '8' => 8, '9' => 9 }
  digits = input_string.chars.map { |char| hash[char] }
  integer = 0
  digits.each do |digit|
    integer = integer * 10 + digit
  end
  integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570