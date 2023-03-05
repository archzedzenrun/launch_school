=begin
Requirements:
-Compute the difference between the square of the sum of the first n positive
integers and the sum of the squares of the first n positive integers.

Examples:
sum_square_difference(3)
1 + 2 + 3 = 6, 6**2 is 36
1**2 is 1
2**2 is 4
3**2 is 9

36 - 14 = 22

DS:
Input: Integer
Intermediate: Array
Output: Integer

Algorithm:
-Initialize a digits variable set to:
-Find the digits from 1 up to the input integer.
-Calculate the sum of those digits and square the sum.
-Iterate over the digits variable and square each number, then find the sum.
-Find the difference between the two sums and return it.
=end

def sum_square_difference(num)
  digits = (1..num).to_a
  square_of_sum = digits.sum**2
  sum_of_squares = digits.map { |digit| digit**2 }.sum
  (sum_of_squares - square_of_sum).abs
end

p sum_square_difference(3)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
