=begin
# PROBLEM
  Input: Integers
  Output: Strings
  Explicit requirements:
  - Display when the user will retire and how many years until retirement
  Implicit requirements:
  Questions:

# EXAMPLES
  What is your age? 30
  At what age would you like to retire? 70

  It's 2016. You will retire in 2056.
  You have only 40 years of work to go!
  
# DATA STRUCTURE

# ALGORITHM
  - Prompt the user for their age
  - Prompt the user for at what age they want to retire
  - Print the current year
  - Print the year that the user will retire
  - Print how many years of work until retirement
# CODE
=end 

puts "What is your age?"
current_age = gets.to_i
puts "At what age would you like to retire?"
retirement_age = gets.to_i

current_year = Time.now.year
retirement_year = current_year + (retirement_age - current_age)
puts "It's #{current_year}. You will retire in #{retirement_year}"
puts "You have only #{retirement_age - current_age} years to go!"
