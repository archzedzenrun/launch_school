=begin
Input: String
Output: String

Requirements:
-Write a method that takes a string as an argument
-Return a new string that contains the original value using a staggered capitalization
scheme in which every other character is capitalized, and the remaining charactes are lowercase.
-Characters that are not letters should not be changed, but do count as characters when switching
between upper and lowercase.

Data Structure:
String -> Array

Algorithm:
-Initialize a new string
-Split the string into characters
-Iterate over each character and its index
-If the index is even, swap the case of the current character and add it to the new string
-Return the new string
=end

def staggered_case(string)
  new_string = ''
  string.chars.each_with_index do |char, index|
    if index.even?
      new_string << char.upcase
    else
      new_string << char.downcase
    end
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Refactored

def staggered_case(string)
  string.chars.map.with_index { |char, idx| idx.even? ? char.upcase : char.downcase }.join
end