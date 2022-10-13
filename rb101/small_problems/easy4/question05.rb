=begin
# PROBLEM
  Input: Integer
  Output: Integer
  Requirements: Write a method that searches for all multiples of 3 or 5
  that lie between 1 and some otehr number and then computes the sum
  of those multiples.

# EXAMPLES
  multisum(3) == 3
  multisum(5) == 8
  multisum(10) == 33
  multisum(1000) == 234168

# DATA STRUCTURE
  Integer -> Integer

# ALGORITHM
  Intialize a sum variable
  Iterate over a range of numbers between 1 and the input
  Check if each number is a multiple of 3 or 5
  If it is, add it to the sum variable
  Return the sum

# CODE
=end

def multisum(integer)
  sum = 0
  (1..integer).each do |num|
    if num % 3 == 0 || num % 5 == 0
      sum += num
    end
  end
  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168