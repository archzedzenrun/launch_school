=begin
# PROBLEM
  Input: Integer
  Output: Integer
  Explicit requirements:
  - Using the multiply method from the previous problem, write a method that
    computes the square of its argument.
  Implicit requirements:
  - The square is the result of multiplying a number by itself
  Questions:

# EXAMPLES
  square(5) == 25
  square(-8) == 64
  
# DATA STRUCTURE

# ALGORITHM

# CODE
=end

def multiply(num1, num2)
  num1 * num2
end

def exponent(num, power)
  multiply(num, 1) ** power
end
