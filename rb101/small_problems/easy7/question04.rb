=begin
Input: String
Output: String

Requirements:
-Write a method that takes a string as an argument
-Returns a new string in which every uppercase letter is replaced by its lowercaser version
-Every lowercase letter is replaced by its uppercase version
-All other characters should be unchanged
-You may not use the swapcase method, write your own version

Data Structure:
String -> Array -> String

Algorithm:
-Split the string into characters
-Iterate over the array of characters
-On each iteration, check if the current character is equal to the uppercase version
of itself.
-If it is, downcase it
-If its not, upcase it
-Join the characters back into a string and return it
=end

def swapcase(string)
  string.chars.map do |char|
    if char == char.upcase
      char.downcase
    else
      char.upcase
    end
  end.join
end

# Refactored

def swapcase(string)
  string.chars.map { |char| char == char.upcase ? char.downcase : char.upcase }.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'