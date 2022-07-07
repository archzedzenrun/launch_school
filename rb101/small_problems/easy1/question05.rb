=begin
# PROBLEM
  Input: String
  Output: String
  Explicit requirements:
  - Write a method that takes one argument, a string.
  - Returns a new string with the words in reverse order.
  Implicit requirements:
  Questions:

# EXAMPLES 
  puts reverse_sentence('Hello World') == 'World Hello'
  puts reverse_sentence('Reverse these words') == 'words these Reverse'
  puts reverse_sentence('') == ''
  puts reverse_sentence('    ') == '' # Any number of spaces results in ''
  
# DATA STRUCTURE
  - Values will be temporarily held in an array
  
# ALGORITHM
  - Separate the words from the input string into an array
  - Remove the last element of the array
  - Move that element to the beginning of a new array
  - After each element has been moved, convert the array back to a string
  - Return the string
  
# CODE
=end 

def reverse_sentence(string)
  array = string.split
  new_array = []
  new_array << array.pop until array.empty?
  new_array.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''