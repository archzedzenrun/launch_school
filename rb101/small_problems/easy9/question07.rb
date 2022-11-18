=begin
Input: String
Output: String

Requirements:
-Write a method that takes a first name, a space, and a last name passed
as a single string argument
-Return a string that contains the last name, a comma, a space, and the first name.

Algorithm:
-Split the input string
-Return the string at index 1 plus ', ' plus the string at index 0
=end

def swap_name(string)
  split_string = string.split
  split_string[1] + ', ' + split_string[0]
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
