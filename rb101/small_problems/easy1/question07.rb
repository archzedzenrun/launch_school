=begin
# PROBLEM
  Input: Integer
  Output: String
  Explicit requirements:
  - Write a method that takes one argument, a positive integer.
  - Return a string of alternating 1's and 0's, always starting with 1.
  - The length fo the string should match the given integer.
  Implicit requirements:
  Questions:

# EXAMPLES
  puts stringy(6) == '101010'
  puts stringy(9) == '101010101'
  puts stringy(4) == '1010'
  puts stringy(7) == '1010101'
  
# DATA STRUCTURE
  - String will be stored in an array.
  
# ALGORITHM
  - Initialize a variable that contains an empty array.
  - Create a loop that will add the string "1" followed by the string "0" 
    to that variable until it is the size of the input integer.
  - Join the elements of the array into a string with no spaces between 
    the characters. 
  - Return the string.
  
# CODE
=end 

def stringy(integer)
  string = []
  loop do
    break if string.size == integer
    string << '1'
    break if string.size == integer
    string << '0'
  end
  string.join('')
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
