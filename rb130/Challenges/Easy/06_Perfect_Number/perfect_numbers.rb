=begin
*PROBLEM*
Explicit Rules:
-Determine whether a number is perfect, abundant or deficient.

-Divisors are numbers besides the number itself that can be evenly divided into a number with no remainder.
-Aliquot sum is the sum of positive divisors of a number.

-Perfect numbers have an aliquot sum equal to the orginal number.
-Abundant numbers have an aliquot sum greater than original number.
-Deficient numbers have an aliquot sum smaller than the original number.

Implicit Rules:
class PerfectNumber
class method classify
-Input must be a positive integer
-Raise a StandardError if input is less than 0

*DATA STRUCTURE*
Array to hold divisors

*ALGORITHM*
class method classify
-Input: Integer
-Find all divisors of input integer
-Find the sum of the divisors
-Return the appropriate string based on the sum
-Output: String

divisors helper method
-Input: Integer
-Iterate from 1 up to but not including input integer
  -Select numbers whose remainder is 0 when divided by the input number
-Output: Array
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    aliquot_sum = find_divisors(number).sum
    if aliquot_sum < number
      'deficient'
    elsif aliquot_sum > number
      'abundant'
    else
      'perfect'
    end
  end

  def self.find_divisors(number)
    (1...number).select { |n| number % n == 0 }
  end
end
