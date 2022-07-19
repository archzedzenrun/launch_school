=begin
# PROBLEM
  Input: Integer
  Output: String
  Explicit requirements:
  - Ask the user to enter an integer greater than 0
  - Then ask if the user wants to determine the sum or product of all numbers
    between 1 and the entered integer
  Implicit requirements:
  Questions:

# EXAMPLES
  >> Please enter an integer greater than 0:
  5
  >> Enter 's' to compute the sum, 'p' to compute the product.
  s
  The sum of the integers between 1 and 5 is 15.
  
  
  >> Please enter an integer greater than 0:
  6
  >> Enter 's' to compute the sum, 'p' to compute the product.
  p
  The product of the integers between 1 and 6 is 720.

# DATA STRUCTURE

# ALGORITHM
  - Ask the user to input an integer greater than 0
  - Ask the user to input 's' for sum, 'p' for product
  - Calculate the sum or product of all integers between 1 and the user input
  - Display the results in a string

# CODE
=end

def sum(num)
  (1..num).inject(:+)
end

def product(num)
  (1..num).inject(:*)
end

integer = 0

loop do
  puts "Please enter an integer greater than 0:"
  integer = gets.to_i
  break if integer > 0
  puts "Invalid input"
end

loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  answer = gets.chomp
  if answer == 's'
    puts "The sum of the integers between 1 and #{integer} is #{sum(integer)}."
    break
  elsif answer == 'p'
    puts "The product of the integers between 1 and #{integer} is #{product(integer)}."
    break
  end
  puts "Invalid input"
end
