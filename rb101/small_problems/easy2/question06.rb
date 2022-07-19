=begin
# PROBLEM
  Input: Integers
  Output: Integers
  Explicit requirements:
  - Print all odd numbers from 1 to 99 to the console
  - Print each number on a separate line
  Implicit requirements:
  Questions:

# EXAMPLES

# DATA STRUCTURE

# ALGORITHM
  - Print odd numbers each on a separate line
# CODE
=end

(1..99).each { |num| puts num if num.odd? }
