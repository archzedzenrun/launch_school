=begin
# PROBLEM
  Input: Integer
  Output: Integers
  Explicit requirements:
  - Write a method that takes one argument, a positive integer.
  - This method returns a list of the digits in the number.
  Implicit requirements:
  Questions:
  - What is a list?

# EXAMPLES
  puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
  puts digit_list(7) == [7]                     # => true
  puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
  puts digit_list(444) == [4, 4, 4]             # => true

# DATA STRUCTURE
  - Digits will be stored in an array.

# ALGORITHM
  - Given an integer,
  - Split each digit of the integer into a list.
  - Return the list
# CODE
=end

def digit_list(integer)
  integer_list = []
  integer.to_s.split('').each { |integer| integer_list << integer.to_i }
  integer_list
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

#Revisit
def digit_list(integer)
  integer.to_s.chars.map(&:to_i)
end

def digit_list(integer)
  integer.digits.reverse
end