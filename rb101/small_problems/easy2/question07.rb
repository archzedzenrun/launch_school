=begin
# PROBLEM
  Input: Integers
  Output: Integers
  Explicit requirements:
  - Print all even numbers from 1 to 99 to the console
  - Print each number on a separate line
  Implicit requirements:
  Questions:

# EXAMPLES

# DATA STRUCTURE

# ALGORITHM
  - Print even numbers each on a separate line
# CODE
=end

puts (1..99).select { |num| num.even? }
