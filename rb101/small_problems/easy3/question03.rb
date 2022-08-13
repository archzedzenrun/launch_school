=begin
# PROBLEM
  Input: String
  Output: String
  Explicit requirements:
  - Ask the user for an input of a word or multiple words and give back the number of characters
  - Spaces should not be counted as a character.
  Implicit requirements:
  Questions:

# EXAMPLES
  Please write word or multiple words: walk
  There are 4 characters in "walk".
  
  Please write word or multiple words: walk, don't run
  There are 13 characters in "walk, don't run".
  
# DATA STRUCTURE

# ALGORITHM
  - Ask the user for input
  - Store user input in a words variable
  - Print a string that interpolates the size of the value of the words variable
# CODE
=end

puts "Please write word or multiple words:"
words = gets.chomp
puts "There are #{words.delete(' ').size} characters in: \"#{words}\"."
