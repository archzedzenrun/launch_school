=begin
# PROBLEM
  Input:
  Output: String
  Explicit requirements:
  - Randomly generate a number between 20 and 200
  - Print Teddy's age
  Implicit requirements:
  Questions:

# EXAMPLES
  Teddy is 69 years old!
  
# DATA STRUCTURE

# ALGORITHM
  - Generate a random number between 20 and 200
  - Print out that number in a string
# CODE
=end 

age = rand(20..200)
puts "Teddy is #{age} years old!"

# Further exploration

age = rand(20..200)
puts "What is your name?"
name = gets.chomp
if name.empty?
  puts "Teddy is #{age} years old!"
else
  puts "#{name} is #{age} years old!"
end 