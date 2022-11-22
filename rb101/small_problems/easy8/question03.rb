=begin
Input: String
Output: Array

Requirements:
-Write a method that returns a list of all substrings of a string that start
at the beginning of the original string
-The return value should be arranged in order from shortest to longest substring

Algorithm:
-Initialize a substrings variable set to an empty array
-Split the input string into an array of characters
-Iterate over the characters
-Combine the elements starting from the first index to the current index
-Join them into a string and add them to the substrings array
-Return the substrings array
=end

# def leading_substrings(input_string)
#   substrings = []
#   characters = input_string.chars
#   characters.each_with_index do |char, index|
#     substrings << characters[0..index].join
#   end
#   substrings
# end

# Refactored

def leading_substrings(string)
  substrings = []
  (0...string.size).each { |index| substrings << string[0..index] }
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
