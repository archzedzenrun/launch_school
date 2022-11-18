=begin
Input: Integer
Output: Array

Requirements:
-Write a method that takes an integer argument.
-Return an array of all integers, in sequence, between 1 and the argument.
-Assume the argument will always be a valid integer that is greater than 0.

Algorithm:
-Create a range of integers from 1 to the argument.
-Convert the range to an array and return the result.
=end

def sequence(integer)
  (1..integer).to_a
end

# Further exploration with numbers less than 1

def sequence(integer)
  integer > 0 ? (1..integer).to_a : (integer..1).to_a.reverse
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-5)
p sequence(0)
