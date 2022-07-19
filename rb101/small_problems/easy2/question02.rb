=begin
# PROBLEM
  Input: Integer (length of room in meters), integer (width of room in meters)
  Output: String
  Explicit requirements:
  - Ask the user for the length and width of a room in meters
  - Display the area of the room in both square meters and square feet
  Implicit requirements:
  - 1 square meter == 10.7639 square feet
  Questions:
  - What is square feet?
  
# EXAMPLES
  Enter the length of the room in meters:
  10
  Enter the width of the room in meters:
  7
  The area of the room is 70.0 square meters (753.47 square feet).
  
# DATA STRUCTURE

# ALGORITHM
  - Ask the user to input the length of the room in meters
  - Store that input in a length variable
  - Ask the user to input the width of the room in meters
  - Store that input in a width variable
  - Calculate square meters (L * W) and store it in a sq_meters variable
  - Calculate square feet and store it in a sq_feet variable
  - Output the results in a string
# CODE
=end 

puts "Enter the length of the room in meters:"
length = gets.to_f
puts "Enter the width of the room in meters:"
width = gets.to_f

sq_meters = length * width
sq_feet = sq_meters * 10.7639

puts "The area of the room is #{sq_meters.round(2)} square meters (#{sq_feet.round(2)} square feet)"

# Further exploration

puts "Enter the length of the room in feet:"
length = gets.to_f
puts "Enter the width of the room in feet:"
width = gets.to_f

sq_feet = length * width
sq_inches = sq_feet * 144
sq_centimeters = sq_feet * 929.03

puts "The area of the room is #{sq_feet} square feet, #{sq_inches} square inches, #{sq_centimeters} square centimeters."