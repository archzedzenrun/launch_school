=begin
Input: String
Output: Array of strings

Requirements:
-Write a method that returns a list of all substrings of a string.
-The returned list should be ordered by where in the string the substring begins.
-This means that substrings that start at position 0 should come first, then all substrings
that start at position 1, and so on.
-The substrings at a given position should be returned in order from shortest to longest.

Data Structure:
Array to hold substrings

Algorithm (without using leading_substrings method):
-Initialize a substrings variable set to an empty array
-Initialize a characters variable set to the characters of the input string
-Iterate through the array of characters
-On each iteration, combine the current character with all previous characters
-Add each result to the substrings variable
--------------------------------------------------------------------------------
Second pass algorithm (without using leading_substrings method):
-Initialize a substrings variable set to an empty array.
-Iterate over a range of 0 up to but not including the size of the string argument
 which will act as the starting index.
-Iterate over a range of 0 up to but not including the size of the string argument
 which will act as the ending index.
-On each iteration, add the string argument at the index range of starting index
 to the ending index to teh substrings variable.
-Return the substrings variable.
=end

def substrings(input_string)
  substrings = []

  (0...input_string.size).each do |start_index|
    (start_index...input_string.size).each do |end_index|
      substrings << input_string[start_index..end_index]
    end
  end

  substrings
end

=begin
Algorithm using the leading_substrings method:
-Initialize a all_substrings variable set to an empty array.
-Iterate over a range of 0 up to but not including the size of the string
 argument. This will act as the current index.
-On each iteration, invoke the leading_substrings method and pass the string
 at the index range of the current index up to the last index as an argument.
-Add the result to the all_substrings variable.
-Return the all_substrings variable.
=end

def leading_substrings(string)
  substrings = []
  (0...string.size).each { |index| substrings << string[0..index] }
  substrings
end

def substrings(string)
  all_substrings = []

  (0...string.size).each do |index|
    all_substrings += leading_substrings(string[index..-1]) # Or use << and flatten all_substrings.
  end

  all_substrings
end

p substrings('abcde') == [
   'a', 'ab', 'abc', 'abcd', 'abcde',
   'b', 'bc', 'bcd', 'bcde',
   'c', 'cd', 'cde',
   'd', 'de',
   'e'
 ]
