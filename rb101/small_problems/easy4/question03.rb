=begin
# PROBLEM
  Input: Integer > 0
  Output: Boolean
  Explicit requirements:
  - Write a method that takes any year greater than 0 as input, and returns
    true if the year is a leap year, or false if it is not a leap year.
  Implicit requirements:
  - Leap years occur in every year that is evenly divisble by 4, unless
    the year is also divisble by 100.
  - If the year is evenly divisible by 100, then it is not a leap year unless
    the year is evenly divisible by 400.
  Questions:

# EXAMPLES
  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  leap_year?(240001) == false
  leap_year?(2000) == true
  leap_year?(1900) == false
  leap_year?(1752) == true
  leap_year?(1700) == false
  leap_year?(1) == false
  leap_year?(100) == false
  leap_year?(400) == true

# DATA STRUCTURE

# ALGORITHM
  - Check if input year is evenly divisible by 4
  - It is a leap year unless the year is also divisible by 100.
  - Check if input year is evenly divisible by 100
  - If it is, then it is not a leap year, unless evenly divisible by 400.
  - Check if the input year is evenly divisible by 400.
# CODE
=end

def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 400 == 0
    true
  else
    false
  end
end
