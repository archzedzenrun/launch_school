=begin
*PROBLEM*
Explicit Rules:
-When given a number and a set of one or more other numbers:
-Find the sum of all multiples of any of the numbers in the set that are
 less than the first given number.
-Use a set of 3 and 5 if a set is not given.

Implicit Rules:
SumOfMultiples class
 -constructor method takes varying number of arguments
`to` instance method
 -takes 1 argument

*EXAMPLES*
Input: 10
Set: [3, 5] -> find nums that are multiples of either 3 or 5 up to 10
3, 5, 6, 9 are all multiples of 3 or 5
sum = 23

*DATA STRUCTURE*
Array to hold number set

*ALGORITHM*
constructor method
input: varying number of integers
store input as a set of numbers

`to` instance method
input: integer
-select all the numbers in the saved number set that are less than the input
-iterate from 1 up to but not including the input num
  -check if current num is divisible by any of the numbers in the set
  -if it is, save the number
-return the sum of saved numbers
=end

class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def self.to(num)
    new.to(num)
  end

  def to(num)
    (1...num).select { |n| any_multiple?(n) }.sum
  end

  private

  def any_multiple?(num)
    @set.any? { |set_num| num % set_num == 0 }
  end
end
