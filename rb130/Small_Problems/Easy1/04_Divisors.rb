=begin
*PROBLEM*
Input: Integer
Output: Array

Explicit Rules:
-Return all divisors of the input argument
-The return array can be in any sequence

Implicit Rules:
-Input will be a positive integer
-Input wont be empty

*EXAMPLES*
p divisors(12) == [1, 2, 3, 4, 6, 12]
all numbers in output go into input number evenly

*DS*
Array to hold divisors

*ALGORITHM*
-Create a results array
-Iterate from 1 up to the input num
  -If input num is divisible by current num
    -Add current num to results array
-Return results array
=end

def divisors(num)
  (1..num).each_with_object([]) do |n, results|
    results << n if num % n == 0
  end
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute