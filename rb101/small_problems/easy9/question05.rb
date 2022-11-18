=begin
Input: String
Output: Boolean

Requirements:
-Write a method that takes a string argument.
-Return true if all of the alphabetic characters inside the string are uppercase,
false otherwise.
-Characters that are not alphabetic should be ignored.

Algorithm:
-Check if each string character is equal to itself upcased.
=end

def uppercase?(string)
  string.chars.all? { |char| char == char.upcase }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

=begin
Further exploration:
It could make more sense to return false if the string is empty because no characters
exist, therefore they cant be uppercase. An explicit false (or nil, meaning nothing)
return could be added for empty strings.
=end
