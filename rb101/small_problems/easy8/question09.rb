=begin
Input: Integer
Output: Integer

Requirements:
-Write a method that takes a positive integer as an argument
-Returns that number with its digits reversed

Data Structure:
Integer -> Array -> Integer

Algorithm:
-Initialize a reversed_digits variable to an empty array
-Convert the input integer into a string and split it into an array
-Iterate over each string
-Push the current number in the array to the beginning of the reversed_digits variable
-Join the reversed_digits variable and convert it to an integer
-Return the result
=end

def reversed_number(integer)
  reversed_digits = []
  integer.to_s.split('').each do |digit|
    reversed_digits.unshift(digit)
  end
  reversed_digits.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# Refactored

def reversed_number(integer)
  integer.to_s.reverse.to_i
end
