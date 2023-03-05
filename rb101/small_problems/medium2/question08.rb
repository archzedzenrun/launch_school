=begin
Input: Integer
Output: Integer

Requirements:
-Write a method that takes a single integer as an argument.
-Return the next featured number that is greater than the argument.
-Return an error message if there is no next featured number.

-A featured number is an odd number that is a multiple of 7, and whose
digits occur exactly once each.

Examples:
-49 is a featured number but 98 is not(it is not odd) 97 is not (it is not a multiple
of 7) and 133 is not (the digit 3 appears twice)

Algorithm:
-Increment the integer argument by 1 until the number is divisible by 7 and odd.
=end

def featured(integer) # DOESNT WORK
  integer += 1 until integer % 7 == 0 && integer.odd?
  if integer.to_s.size != integer.digits.uniq.size
    "error"
  else
    integer
  end
end


p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999)# == 1_023_547
p featured(999_999_987)# == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Revisit ===================================

=begin
*PROBLEM*
Explicit Rules:
-INPUT: Integer
-Return the next featured number greater than the input.
-A featured number is:
  -An odd number
  -Multiple of 7
  -Digits occur only once each
-Return an error if there is no featured number.
-OUTPUT: Integer / String

Implicit Rules:
-No featured numbers over 10 digits (digits wouldnt be unique)

*EXAMPLES*
featured(12) == 21
21 is the next num that is a multiple of 7
it is odd
digits 2 and 1 occur once each

featured(20) == 21
same as previous

featured(21) == 35
same as above

*DATA STRUCTURE*
Array

*ALGORITHM*
1. Increment the input number until it is a multiple of 7.
2. Check if that number is odd.
3. Check if the digits of that number are unique. (only occur once each)
   -Return that number if the above are true.
   -Return error message if there is no next featured number.

=end

def featured(num)
  loop do
    num += 1
    return num if num % 7 == 0 && num.odd? && num.digits == num.digits.uniq
    break if num.to_s.size > 10
  end
  "There is no possible number that fulfills those requirements"
end