=begin
Input: String
Output: String of 1 or 2 characters

Requirements:
-Write a method that takes a non-empty string argument
-Returns the middle character or characters of the argument
-If the argument has an odd length, return exactly one character
-IF the argument has an even length, return exactly two characters

Algorithm:
-Initialize a middle variable set to the size of the input string divided by 2
-Check if the size of the input string is odd
-If it is, return the character at [middle] index of the input string
-If its not odd, return the 2 characters at the [middle] index of the input string minus 1
=end

def center_of(string)
  middle = string.size / 2
  string.size.odd? ? string[middle] : string[middle - 1, 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
