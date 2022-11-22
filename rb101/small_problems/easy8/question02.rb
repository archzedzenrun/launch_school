=begin
Algorithm:
-Get user input and store in 4 different variables
-Output the variables in an interpolated string
=end

puts "Enter a noun:"
noun = gets.chomp
puts "Enter a verb:"
verb = gets.chomp
puts "Enter an adjective:"
adjective = gets.chomp
puts "Enter an adverb:"
adverb = gets.chomp

puts "Dont #{verb} the #{adjective} #{noun} so #{adverb}!"
