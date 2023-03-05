=begin
Input: String
Output: Boolean

Requirements:
-Write a method that takes a string as an argument.
-Return true if all parentheses in the string are properly balanced, false otherwise.
-To be properly balanced, parentheses must occur in matching ( ) pairs.

Algorithm:
-Initialize a parentheses variable to 0
-Split the input string into an array of characters
-Iterate through the characters
-Add 1 to the parentheses variable if the current char is (
-Minus 1 to the parenthese variable if the current char is )
-Stop iterating if the parentheses variable is less than 0
-Check if the parentheses variable is 0 and return true or false
=end

def balanced?(string)
  parentheses = 0

  string.chars.each do |char|
    parentheses += 1 if char == '('
    parentheses -= 1 if char == ')'
    break if parentheses < 0
  end

  parentheses == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
