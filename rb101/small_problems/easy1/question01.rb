=begin
# PROBLEM
  Input: A string and an integer
  Output: String
  Explicit requirements:
  - Write a method that takes two arguments, string and a positive integer.
  - Prints the string as many times as the integer indicates.

# EXAMPLES
  input: repeat('Hello', 3)
  output:
  Hello
  Hello
  Hello

# DATA STRUCTURE
  - No additional data structure needed to hold values

# ALGORITHM
  - Print the string as many times as the value of the integer.

# CODE
=end

def repeat(string, integer)
  integer.times { puts string }
end

repeat('Hello', 3)

=begin

# i: String and positive integer
# o: String

# Req: Write a method that takes two arguments, a string and positive integer.
# print the string as many times as the integer indicates.

# algo
# SET counter variable to 0
# PRINT string until counter is equal to the integer.

def repeat(string, integer)
  counter = 0
  until counter == integer
    puts string
    counter += 1
  end
end

repeat('Hello', 0)

=end