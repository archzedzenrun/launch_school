def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end

=begin

Bonus 1: The purpose of number % divisor == 0 is to make sure there is no remainder
during division before pushing the number into the factors array.

Bonus 2: Methods return the last statement executed, which in this case would be
the 'while loop' which will return nil.  We want the method to return the factors 
array so we need to explicitly state that at the end of the method.

=end