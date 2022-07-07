=begin
# PROBLEM
  Input: Integer and a boolean
  Output: Integer
  Explicit requirements:
  - Write a method that takes two arguments, a positive integer and a boolean.
    to calculate the bonus for a given salary.
  - If the boolean is true, the bonus should be half of the salary.
  - If the boolean is false, the bonus should be 0.
  Implicit requirements:
  Questions:

# EXAMPLES
  puts calculate_bonus(2800, true) == 1400
  puts calculate_bonus(1000, false) == 0
  puts calculate_bonus(50000, true) == 25000
  
# DATA STRUCTURE

# ALGORITHM
  - If the boolean is true, divide the salary by 2
  - If the boolean is false, return 0
# CODE
=end 

def calculate_bonus(integer, boolean)
  if boolean == true
    return integer / 2 
  else 
    return 0
  end 
end 

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

# Using ternary operator

def calculate_bons(integer, boolean)
  boolean ? integer / 2 : 0
end 