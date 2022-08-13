=begin
# PROBLEM
  Input: 6 integers
  Output: String
  Explicit requirements:
  - Ask the user for 6 numbers
  - Print a message that describes whether or not the 6th number appears amongst the first 5
  Implicit requirements:
  Questions:

# EXAMPLES
  ==> Enter the 1st number:
  25
  ==> Enter the 2nd number:
  15
  ==> Enter the 3rd number:
  20
  ==> Enter the 4th number:
  17
  ==> Enter the 5th number:
  23
  ==> Enter the last number:
  17
  The number 17 appears in [25, 15, 20, 17, 23].
  
  
  ==> Enter the 1st number:
  25
  ==> Enter the 2nd number:
  15
  ==> Enter the 3rd number:
  20
  ==> Enter the 4th number:
  17
  ==> Enter the 5th number:
  23
  ==> Enter the last number:
  18
  The number 18 does not appear in [25, 15, 20, 17, 23].
  
# DATA STRUCTURE
  - User inputs will be stored in an array
  
# ALGORITHM
  - Initialize a variable called array and set its value to an empty array.
  - Ask the user to enter a number
  - Add the user input to the array variable
  - Repeat until the array variable contains 5 integers
  - Ask the user for a 6th integer
  - Determine if the 6th integer appears amongst the array of 5 integers
  - Print a message that describes whether or not it does

# CODE Solution 1
=end

# array = []

# puts "Enter the 1st number:"
# array << gets.to_i
# puts "Enter the 2nd number:"
# array << gets.to_i
# puts "Enter the 3rd number:"
# array << gets.to_i
# puts "Enter the 4th numbber:"
# array << gets.to_i
# puts "Enter the 5th number:"
# array << gets.to_i
# puts "Enter the last number:"
# last_num = gets.to_i

# if array.include?(last_num)
#   puts "The number #{last_num} appears in #{array}"
# else
#   puts "The number #{last_num} does not appear in #{array}"
# end 

# CODE Solution 2

count = ["1st", "2nd", "3rd", "4th", "5th", "last"]
numbers = []

count.each do |position|
  puts "Enter the #{position} number:"
  numbers << gets.to_i
end

last_num = numbers.pop

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}"
else
  puts "The number #{last_num} does not appear in #{numbers}"
end
