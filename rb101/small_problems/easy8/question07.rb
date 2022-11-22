=begin
Input: String
Output: New String

Requirements:
-Write a method that takes a string.
-Return a new string in which every character is doubled.

Algorithm:
-Iterate through the characters of the input string.
-On each iteration add 2 of the current character to the new string.
-Return the new string
=end

def repeater(string)
  string.each_char.with_object('') { |char, new_str| 2.times { new_str << char} }
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
