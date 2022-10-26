=begin
Input: String
Output: String

Requirements:
-Write a method that takes a string argument and returns a new string that contains
the value of the original string with all consecutive duplicate characters collapsed
into a single character.

Data Structure:
String -> Array

Algorithm:
-Initialize a new string variable to an empty array
-Split the input string and iterate through each character
-Add each character to the new string array
-If the current character is equal to the last character in the new string
-Dont add it to the new string array
-Join and return the new string
=end

def crunch(string)
  new_string = []
  string.chars.each do |char|
    new_string << char unless char == new_string.last
  end
  new_string.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''