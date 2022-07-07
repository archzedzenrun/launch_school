=begin
# Problem 
- Input: Integer
- Output: Boolean
- Requirements: 
    - Write a method that takes one integer argument
    - Integer may be positive, negative, or zero
    - This method returns true if the numbers absolute value is odd
    - Assume the argument is a valid integer value
    - Dont use #odd? or #even? methods
- Implicit Requirements:
    - This method returns false if the numbers absolute value is even
- Questions: 
    - What is absolute value?

# Examples 
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Data Structure
N/A

# Algorithm
Given an integer
Calculate the absolute zero value of the integer
=end

def is_odd?(integer)
  integer.remainder(2) != 0
end 

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
