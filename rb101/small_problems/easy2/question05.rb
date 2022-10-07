=begin
# PROBLEM
  Input: String
  Output: String
  Explicit requirements:
  - Ask for the users name, greet the user
  - If the user writes "name!" then the computer yells back to the user
  Implicit requirements:
  Questions:

# EXAMPLES
  What is your name? Bob
  Hello Bob.

  What is your name? Bob!
  HELLO BOB. WHY ARE WE SCREAMING?

# DATA STRUCTURE

# ALGORITHM
  - Ask for the users name
  - Greet the user
  - Yell back to the user if the user writes "name!"
# CODE
=end

puts "What is your name?"
name = gets.chomp
if name.end_with?('!')
  name.chop!
  puts "Hello #{name}. why are we screaming?".upcase
else
  puts "Hello #{name}"
end

# Revisit

puts "What is your name?"
name = gets.chomp
puts name[-1] == "!" ? "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?" : "Hello #{name}"