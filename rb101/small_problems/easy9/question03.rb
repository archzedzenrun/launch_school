=begin
Input: Integer
Output: Integer

Requirements:
-Write a method that takes a number as an argument.
-If the argument is a positive number, return the negative of that number.
-If the numbe ris 0 or negative, return the original number.

Algorithm:
-Check if the input integer is less than or equal to 0.
-If it is, return the original integer.
-If not, multiply the integer by -1 and return it
=end

def negative(integer)
  integer <= 0 ? integer : integer * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
