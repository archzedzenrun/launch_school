=begin
# PROBLEM
  Input: Integers - Bill amount and tip rate
  Output: Integers - Tip and total amount of the bill
  Explicit requirements:
  - Prompt for a bill amount and tip rate.
  - Compute the tip and display boht the tip and the total amount of the bill.
  Implicit requirements:
  Questions:

# EXAMPLES
  What is the bill? 200
  What is the tip percentage? 15

  The tip is $30.0
  The total is $230.0
  
# DATA STRUCTURE

# ALGORITHM
  - Prompt for a bill amount
  - Prompt for a tip rate
  - Compute the tip
  - Display the tip
  - Display the total amount of the bill

# CODE
=end 

puts "What is the bill?"
bill = gets.to_f
puts "What is the tip percentage?"
tip_percentage = gets.to_f / 100

tip = (bill * tip_percentage).round(2)
total = (bill + tip).round(2)

puts "The tip is #{format("%.2f", tip)}"
puts "The total bill is #{format("%.2f", total)}"
