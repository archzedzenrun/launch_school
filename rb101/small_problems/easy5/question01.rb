=begin
Input: String
Output: Integer

Requirements:
Write a method that determines and returns the ASCII string value
of a string that is passed in as an argument. The ASCII string
value is the sum  of the ASCII values of every character in the string.

Algorithm:
Intialize a total value variable and set it to 0
Iterate through each character of the input string
Add the value of each character to the value variable
Return the value variable
=end
def ascii_value(string)
  total_value = 0
  string.each_char { |char| total_value += char.ord }
  total_value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Revisit

def ascii_value(str)
  str.chars.map(&:ord).sum
end