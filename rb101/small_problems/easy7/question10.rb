=begin
Input: String
Output: String

Requirements:
-Write a method that returns the next to last word in the string passed to it as an argument
-Words are any sequence of non-blank characters
-Assume the input string will always contain at least two words

Data Structure:
String -> Array

Algorithm:
-Split the input string into an array
-Return the word at the second to last index of the array
=end

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Further exploration:
# returns the middle two words if the string has an even number of words
# returns the middle word if the string has an odd number of words
# returns an empty string if the string has no words

def penultimate(string)
  return string if string.empty?
  array = string.split
  middle = array.size / 2
  array.size.even? ? array[middle - 1, 2].join(' ') : array[middle]
end
