=begin
# PROBLEM
  Input: Two positive integers
  Output: Integers
  Explicit requirements:
  - Prompt the user for two positive integers
  - Print the results of the tfollowing operations on those two numbers:
    addition, subtraction, product, quotient, remainder, and power.
  - Don't worry about validating the input
  Implicit requirements:
  Questions:

# EXAMPLES
  ==> Enter the first number:
  23
  ==> Enter the second number:
  17
  ==> 23 + 17 = 40
  ==> 23 - 17 = 6
  ==> 23 * 17 = 391
  ==> 23 / 17 = 1
  ==> 23 % 17 = 6
  ==> 23 ** 17 = 141050039560662968926103
  
# DATA STRUCTURE

# ALGORITHM
  - Prompt the user to enter the first number
  - Prompt the user to eneter the second number 
  - Print the results of the above operations.
  
# CODE
=end

def prompt(msg)
  puts "==> #{msg}"
end

puts "Enter the first number:"
num1 = gets.to_i
puts "Enter the second number:"
num2 = gets.to_i

prompt("#{num1} + #{num2} = #{num1 + num2}")
prompt("#{num1} - #{num2} = #{num1 - num2}")
prompt("#{num1} * #{num2} = #{num1 * num2}")
prompt("#{num1} / #{num2} = #{num1 / num2}")
prompt("#{num1} % #{num2} = #{num1 % num2}")
prompt("#{num1} ** #{num2} = #{num1 ** num2}")
