=begin
# PROBLEM
  Input: Integer
  Output: Integer, sum of the input digits
  Explicit requirements:
  - Write a method that takes one argument, a positive integer.
  - Return the sum of its digits.
  Implicit requirements:
  Questions:

# EXAMPLES
  puts sum(23) == 5
  puts sum(496) == 19
  puts sum(123_456_789) == 45
  
# DATA STRUCTURE
  - Array
  
# ALGORITHM
  - Initialize a new variable to store the sum.
  - Split each digit of the integer argument into an array.
  - Add each digit of the array to the sum variable.
  - Return the value of the sum variable.
# CODE
=end 

def sum(integer)
  array = integer.to_s.split('')
  sum = 0
  array.each { |element| sum += element.to_i }
  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Refactored code

def sum(integer)
  integer.digits.sum
end
