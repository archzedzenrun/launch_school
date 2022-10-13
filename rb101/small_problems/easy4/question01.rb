=begin
# PROBLEM
  Input: Strings
  Output: String
  Explicit requirements:
  - Write a method that takes two strings as arguments
  - Determine the longest of the two strings
  - Return the result of concatenating the shorter string, the longer string,
    and the shorter string once again
  - Assume the strings are of different lengths
  Implicit requirements:
  Questions:

# EXAMPLES
  short_long_short('abc', 'defgh') == "abcdefghabc"
  short_long_short('abcde', 'fgh') == "fghabcdefgh"
  short_long_short('', 'xyz') == "xyz"

# DATA STRUCTURE

# ALGORITHM
  - Define a method with 2 parameters
  - Initialize a variable that contains an empty string object that will contain the shorter string
  - Initialize a variable that contains an empty string object that will contain the longer string
  - Compare the size of the two strings being passed as arguments and assign them to these variables
  - Return a string that concatenates the the shorter string + the longer string + the shorter string
# CODE
=end

def short_long_short(string1, string2)
  shorter_string = ''
  longer_string = ''

  if string1.size > string2.size
    longer_string = string1
    shorter_string = string2
  else
    longer_string = string2
    shorter_string = string1
  end

  shorter_string + longer_string + shorter_string
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
p short_long_short('hi', 'hi')

# Revisit

def short_long_short(str1, str2)
  str1.size < str2.size ? str1 + str2 + str1 : str2 + str1 + str2
end