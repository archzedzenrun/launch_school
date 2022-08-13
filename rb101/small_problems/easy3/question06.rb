=begin
# PROBLEM
  Input: Integers
  Output: Boolean
  Explicit requirements:
  - Write a method named xor that takes two arguments
  - Returns true if exactly one of its arguments is truthy, false otherwise
  - 
  Implicit requirements:
  Questions:

# EXAMPLES
  xor?(5.even?, 4.even?) == true
  xor?(5.odd?, 4.odd?) == true
  xor?(5.odd?, 4.even?) == false
  xor?(5.even?, 4.odd?) == false
  
# DATA STRUCTURE

# ALGORITHM

# CODE
=end

def xor?(num1, num2)
  !(num1 == num2)
end
  
puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false