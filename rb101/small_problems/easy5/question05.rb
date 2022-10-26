=begin
Input: String
Output: String

Requirements:
-Given a string that consists of some words(all lwoercased) and an assortment of non-alphabetic characters,
-Write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
-If one or more non-alphabetic characters occur in a row, you should only have one space in the result
(the result should never have consecutive spaces).

Data Structure:
-Values will be held in an array.

Algorithm:
-Initialize a new string variable set to an empty array
-Iterate through each character of the input string
-Check if the current character is included in the alphabet
-If it is, add it to the new string array
-If not, add a space to the new string array unless the last element of the array is a space
-Join the new string array and return the result
=end

def cleanup(string)
  alphabet = ('a'..'z')
  new_string = []
  string.each_char do |char|
    if alphabet.include?(char)
      new_string << char
    else
      new_string << ' ' unless new_string.last == ' '
    end
  end
  new_string.join
end

p cleanup("---what's my +*& lines?")

# Alternate

def cleanup(string)
  alphabet = ('a'..'z')
  string.each_char do |char|
    string.gsub!(char, ' ') unless alphabet.include?(char)
  end.squeeze(' ')
end
